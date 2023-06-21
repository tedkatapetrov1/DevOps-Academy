variable "aws_region" {
  type = string
  description = "Region for AWS resources"
  default = "eu-west-1"
}

variable "company" {
  type = string
  description = "company name for resource tagging"
  default = "DCWS"
}

variable "project" {
  type = string
  description = "project name for resource tagging"
  default = "VCWS"
}