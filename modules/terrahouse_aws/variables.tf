variable "user_uuid" {
  description = "The UUID of the user"
  type        = string
  # UUID validation

  validation {
    condition     = can(regex("^([a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12})$", var.user_uuid))
    error_message = "The user_uuid must be a valid UUID format."
  }

}

#variable "bucket_name" {
#  description = "The name of the S3 bucket"
#  type        = string
#
# validation {
#   condition = (
#     length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63 &&
#     can(regex("^[a-z0-9][a-z0-9-.]*[a-z0-9]$", var.bucket_name))
#   )
#   error_message = "The bucket name must be between 3 and 63 characters, start and end with a lowercase letter or number, and can contain only lowercase letters, numbers, hyphens, and dots."
# }
#}
#

variable "index_html_filepath" {
  description = "The filepath to the index.html file"
  type        = string

  validation {
    condition     = can(fileexists(var.index_html_filepath))
    error_message = "The provided path for index.html is not valid or the file does not exist."
  }
}

variable "error_html_filepath" {
  description = "The filepath to the error.html file"
  type        = string

  validation {
    condition     = can(fileexists(var.error_html_filepath))
    error_message = "The provided path for error.html is not valid or the file does not exist."
  }
}

variable "content_version" {
  type        = number
  description = "The version of the content. Must be a positive integer."

  validation {
    condition     = var.content_version > 0 && floor(var.content_version) == var.content_version
    error_message = "The content_version must be a positive integer."
  }
}

variable "assets_path" {
  description = "Path to assets folder"
  type = string
}


