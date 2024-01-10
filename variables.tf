variable "limits" {
  description = "Limits for the application namespace"
  type        = string
  default     = "100m"
}

variable "rbac" {
  description = "Enable RBAC for the application namespace"
  type        = bool
  default     = true
}