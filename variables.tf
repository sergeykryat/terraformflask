variable "name" {
  type        = string
  nullable    = false
  description = "The name of the namespace."

  validation {
    condition     = var.name != ""
    error_message = "The name of the namespace cannot be null or empty."
  }
}