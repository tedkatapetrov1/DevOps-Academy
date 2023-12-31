variable "aws_region" {
  type        = string
  description = "Region for AWS Resources"
  default     = "eu-west-1"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in VPC"
  default     = true
}

variable "vpc_cidr_block" {
  type        = string
  description = "Base CIDR Block for VPC"
  default     = "10.0.6.0/24"
}

variable "vpc_subnets_cidr_block" {
  type        = list(string)
  description = "CIDR Blocks for Subnets in VPC"
  default     = ["10.0.6.0/25","10.0.6.128/25"]
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Map a public IP address for Subnet instances"
  default     = true
}

variable "instance_type" {
  type        = string
  description = "Type for EC2 Instnace"
  default     = "t2.micro"
}

variable "company" {
  type        = string
  description = "Company name for resource tagging"
  default     = "Teodor-Petrov"
}

variable "project" {
  type        = string
  description = "Project name for resource tagging"
  default     = "DevOps-Academy-Day2"
}