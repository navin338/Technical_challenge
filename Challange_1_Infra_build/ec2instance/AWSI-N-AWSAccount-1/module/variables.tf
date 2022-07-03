
variable "key_name" {
type        = string
description = "use standard key name"
}

variable "ami" {
  description = "Enter the AMI ID here"
}

variable "tenancy" {
  type        = string
  description = "The tenancy of the instance (if the instance is running in a VPC). Available values: default, dedicated, host."
  default     = "default"
}

variable "ebs_optimized" {
  type        = bool
  description = "If true, the launched EC2 instance will be EBS-optimized" 
  default     = false
}

variable "disable_api_termination" {
  type        = bool
  description = "If true, enables EC2 Instance Termination Protection"
  default     = false
}

variable "instance_initiated_shutdown_behavior" {
  type        = string
  description = "Shutdown behavior for the instance, defaults to stop for EBS, other choice is Terminate" # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/terminating-instances.html#Using_ChangingInstanceInitiatedShutdownBehavior
  default     = null
}

variable "instance_type" {
  type        = string
  description = "The type of instance to start"
}

variable "monitoring" {
  type        = bool
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  default     = false
}

variable "vpc_security_group_ids" {
  type        = list
  description = "attached the required security group on the instance"
}

variable "subnet_id" {
  type        = string
  description = "Mentioned required Subnet ID"
}

variable "associate_public_ip_address" {
  type        = bool
  description = "If true, the EC2 instance will have associated public IP address"
  default     = false
}

variable "private_ip" {
  type        = string
  description = "Private IP address to associate with the instance in a VPC"
  default     = null
}

variable "source_dest_check" {
  type        = bool
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs."
  default     = true
}

variable "user_data" {
type        = string
description = "The user data file path provided to get powershell script to create local admin password"
}


variable "get_password_data" {
  type        = bool
  description = "update get password data"
  default     = false
}

variable "Name" {
  type        = string
  description = "update the server name tag"
}


variable "ApplicationName" {
  type        = string
  description = "update the app name"
}


variable "Applicationservicenumber" {
  type        = string
  description = "update the local application service number"
}

variable "Businessapplicationnumber" {
  type        = string
  description = "update the busineess application number"
}

variable "delete_on_termination" {
  type        = bool
  description = "delete_on_termination"
  default     = true
}

variable "volume_type" {
  type        = string
  description = "volume_typer"
}

variable "volume_size" {
  type        = string
  description = "volume_size"
}

variable "encrypted" {
  type        = bool
  description = "encrypted"
  default     = true
}

variable "ebs_block_device" {
  description = "Additional EBS block devices to attach to the instance"
  type        = list(map(string))
  default     = []
}