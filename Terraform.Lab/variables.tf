variable "region" {
  description = "Define what region the instance will be deployed"
  default     = "us-east-1"
}

variable "name-ubuntu" {
  description = "Name of the Ubuntu server"
  default     = "UBUNTU-Fernando"
}

variable "name-windows" {
  description = "Name of the Windows server"
  default     = "WEB01-Riocard"
}

variable "env" {
  description = "Environment of the application"
  default     = "prod"
}

variable "instance_type" {
  description = "AWS instance type defines the hardware configuration of the machine"
  default     = "t2.micro"
}