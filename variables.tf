variable "cluster_api_url" {
  type = string
  description = "the rancher api url"
  validation {
    condition = can(regex("^https?://([\\w.-]+)(:[0-9]{2,5})?(/.*)?$", var.cluster_api_url))
    error_message = "Value must be a valid HTTP/HTTPS URL (e.g., https://example.com, https://example.com:8443/api)."
  }

}

variable "rancher_access_key" {
  type = string
  sensitive = true
  description = "Rancher access key for accessing rancher"
}

variable "rancher_secret_key" {
  type = string
  sensitive = true
  description = "Rancher secret key for accessing rancher"
}

variable "target_cluster_name" {
  type = string
  nullable = false
  description = "Name of the target cluster"

}

variable "project_name" {
  type = string
  nullable = false
  description = "Name of the project"
}

variable "namespace_name" {
  type = string
  description = "Name of the namespace"
}

variable "namespace_limits_cpu" {
  description = "CPU limit für Kubernetes (z.B. 500m, 1 oder null)"
  type        = string
  default     = null
  validation {
    condition     = var.namespace_limits_cpu == null || can(regex("^([1-9][0-9]*m?|0\\.[0-9]+)$", var.namespace_limits_cpu))
    error_message = "CPU limit muss null oder eine positive Zahl sein, z.B. '500m' oder '1'."
  }
}
variable "namespace_limits_memory" {
    type = string
    default = null
    nullable = true
  validation {
    condition = var.namespace_limits_memory == null || (
      can(regex("^\\d+Mi$", var.namespace_limits_memory)) &&
      tonumber(replace(var.namespace_limits_memory, "Mi", "")) >= 50 &&
      tonumber(replace(var.namespace_limits_memory, "Mi", "")) <= 9999
    )
    error_message = "Value must be null or a string in the format '<number>Mi' between 50Mi and 9999Mi (e.g., 128Mi)."
  }
}

variable "namespace_requests_memory" {
    type = string
    default = null
    nullable = true
  validation {
    condition = var.namespace_requests_memory == null || (
      can(regex("^\\d+Mi$", var.namespace_requests_memory)) &&
      tonumber(replace(var.namespace_requests_memory, "Mi", "")) >= 50 &&
      tonumber(replace(var.namespace_requests_memory, "Mi", "")) <= 9999
    )
    error_message = "Value must be null or a string in the format '<number>Mi' between 50Mi and 9999Mi (e.g., 128Mi)."
  }
}

variable "namespace_requests_cpu" {
    type = string
    default = null
    nullable = true
  validation {
    condition     = can(regex("^([1-9][0-9]*m?|0\\.[0-9]+)$", var.namespace_requests_cpu))
    error_message = "CPU limit muss eine positive Zahl sein, z.B. '500m' oder '1'."
  }
}

variable "container_resource_limit_requests_cpu" {
    type = string
    default = null
    nullable = true
  validation {
    condition     = var.container_resource_limit_requests_cpu == null || can(regex("^([1-9][0-9]*m?|0\\.[0-9]+)$", var.container_resource_limit_requests_cpu))
    error_message = "CPU limit muss eine positive Zahl sein, z.B. '500m' oder '1'."
  }
}

variable "container_resource_limit_limits_cpu" {
    type = string
    default = null
    nullable = true
  validation {
    condition     = var.container_resource_limit_limits_cpu == null || can(regex("^([1-9][0-9]*m?|0\\.[0-9]+)$", var.container_resource_limit_limits_cpu))
    error_message = "CPU limit muss eine positive Zahl sein, z.B. '500m' oder '1'."
  }
}

variable "container_resource_limit_requests_memory" {
    type = string
    default = null
    nullable = true
  validation {
    condition = var.container_resource_limit_requests_memory == null || (
      can(regex("^\\d+Mi$", var.container_resource_limit_requests_memory)) &&
      tonumber(replace(var.container_resource_limit_requests_memory, "Mi", "")) >= 50 &&
      tonumber(replace(var.container_resource_limit_requests_memory, "Mi", "")) <= 9999
    )
    error_message = "Value must be null or a string in the format '<number>Mi' between 50Mi and 9999Mi (e.g., 128Mi)."
  }
}

variable "container_resource_limit_limits_memory" {
    type = string
    default = null
    nullable = true
  validation {
    condition = var.container_resource_limit_limits_memory == null || (
      can(regex("^\\d+Mi$", var.container_resource_limit_limits_memory)) &&
      tonumber(replace(var.container_resource_limit_limits_memory, "Mi", "")) >= 50 &&
      tonumber(replace(var.container_resource_limit_limits_memory, "Mi", "")) <= 9999
    )
    error_message = "Value must be null or a string in the format '<number>Mi' between 50Mi and 9999Mi (e.g., 128Mi)."
  }
}