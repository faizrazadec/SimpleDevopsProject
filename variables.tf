variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "devops"
}

variable "ssh_public_key" {
  description = "SSH Public Key"
  type        = string
}