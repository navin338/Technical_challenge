
#############################
#############################
#############################
# Instance variable
#############################
#############################
#############################

variable "instance_ami" {
  description = "Enter the AMI ID here"
}

variable "instance_type" {
  type        = string
  description = "The type of instance to start"
}

variable "instance_key_name" {
  type        = string
  description = "Required standard key pair name"
}

variable "instance_vpc_security_group_ids" {
  type        = list
  description = "attached the required security group on the instance"
}

variable "instance_subnet_id" {
  type        = string
  description = "Mentioned required Subnet ID"
}

variable "instance_Name" {
  type        = string
  description = "update the server name on the tag"
}


variable "instance_ApplicationName" {
  type        = string
  description = "update the app name"
}


variable "instance_Applicationservicenumber" {
  type        = string
  description = "update the local application service number"
}

variable "instance_Businessapplicationnumber" {
  type        = string
  description = "update the busineess application number"
}

variable "localadminusername" {
  type        = string
  description = "localadmin username "
}

variable "localadminpassword" {
  type        = string
  description = "localadmin password"
}

variable "delete_on_termination" {
  type        = bool
  description = "delete_on_termination"
  default     = true
}

variable "instance_monitoring" {
  type        = bool
  description = "delete_on_termination"
  default     = false
}

variable "instance_private_ip" {
  type    = string
  default = null
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