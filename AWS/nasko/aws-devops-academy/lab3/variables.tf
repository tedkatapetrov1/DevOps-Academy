variable "subnet_type" {
  default = {
    public  = "public"
    private = "private"
  }
}

variable "cidr_ranges" {
  default = {
    public1  = "10.0.1.0/24"
    public2  = "10.0.2.0/24"
    private1 = "10.0.3.0/24"
    private2 = "10.0.4.0/24"
  }
}

variable "regions" {
  default = {
    first_zone  = "eu-west-1a"
    second_zone = "eu-west-1b"
  }
}

variable "allow_traffic_cidr_block" {
  type    = string
  default = "0.0.0.0/0"
}

variable "image_name" {
  default     = "amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"
  type        = string
  description = "Amazon linux image name"
}
