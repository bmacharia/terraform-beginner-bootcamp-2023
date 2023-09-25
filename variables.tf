variable "user_uuid" {
  description = "The UUID of the user"
  type        = string
  # UUID validation

  validation {
    condition     = can(regex("^([a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12})$", var.user_uuid))
    error_message = "The user_uuid must be a valid UUID format."
  }

}

