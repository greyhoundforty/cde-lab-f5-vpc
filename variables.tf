variable "region" {
  description = "The VPC region where the F5 environment will be deployed."
  type        = string
  default     = ""
}

variable "resource_group" {
  description = "The name of the resource group to deploy F5 VPC."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Default set of tags to assign to resource."
  type        = list(string)
  default     = []
}

variable "project" {
  description = "Name to prepend to all deployed sources. "
  type        = string
  default     = "f5-vpc"
}