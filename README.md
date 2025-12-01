# Rancher Namespace Terraform Module

This Terraform module provisions a Kubernetes namespace in a Rancher-managed cluster, optionally within a specific Rancher project. It supports resource quotas for CPU and memory.

## Features
- Creates a namespace in a Rancher cluster
- Optionally assigns the namespace to a Rancher project
- Configurable resource quotas (CPU, memory)
- Validates input values for quotas

## Usage
```hcl
module "rancher_namespace" {
  source                  = "<path-to-this-module>"
  cluster_api_url         = "https://rancher.example.com"
  rancher_access_key      = "<access-key>"
  rancher_secret_key      = "<secret-key>"
  target_cluster_name     = "my-cluster"
  project_name            = "my-project" # Set to "" to create namespace without project
  namespace_name          = "my-namespace"
  namespace_limits_cpu    = "500m"
  namespace_limits_memory = "128Mi"
  namespace_requests_cpu  = "250m"
  namespace_requests_memory = "128Mi"
}
```

## Variables
| Name                                 | Type    | Description                                                      | Default   |
|-------------------------------------- |---------|------------------------------------------------------------------|-----------|
| cluster_api_url                      | string  | Rancher API URL                                                  |           |
| rancher_access_key                   | string  | Rancher access key                                               |           |
| rancher_secret_key                   | string  | Rancher secret key                                               |           |
| target_cluster_name                  | string  | Name of the target cluster                                       |           |
| project_name                         | string  | Name of the Rancher project (set to "" for no project)           |           |
| namespace_name                       | string  | Name of the namespace                                            |           |
| namespace_limits_cpu                 | string  | CPU limit for namespace (e.g., "500m", "1", or null)            | null      |
| namespace_limits_memory              | string  | Memory limit for namespace (e.g., "128Mi", or null)              | null      |
| namespace_requests_cpu               | string  | CPU request for namespace (e.g., "250m", or null)                | null      |
| namespace_requests_memory            | string  | Memory request for namespace (e.g., "128Mi", or null)            | null      |
| container_resource_limit_requests_cpu| string  | CPU request for containers (optional)                            | null      |
| container_resource_limit_limits_cpu  | string  | CPU limit for containers (optional)                              | null      |
| container_resource_limit_requests_memory| string| Memory request for containers (optional)                         | null      |
| container_resource_limit_limits_memory| string | Memory limit for containers (optional)                           | null      |

## Example: Without Project
```hcl
module "rancher_namespace" {
  source              = "<path-to-this-module>"
  cluster_api_url     = "https://rancher.example.com"
  rancher_access_key  = "<access-key>"
  rancher_secret_key  = "<secret-key>"
  target_cluster_name = "my-cluster"
  project_name        = "" # No project
  namespace_name      = "my-namespace"
}
```

## Resource Quotas
Resource quotas are set via the following variables:
- `namespace_limits_cpu`
- `namespace_limits_memory`
- `namespace_requests_cpu`
- `namespace_requests_memory`

All values are validated for correct format and range.

## Outputs
Refer to `outputs.tf` for available outputs.

## Requirements
- Rancher provider
- Access to the Rancher API

## License
MIT
