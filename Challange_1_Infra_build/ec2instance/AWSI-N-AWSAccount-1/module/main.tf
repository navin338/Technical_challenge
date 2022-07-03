 ##########################################
 
 #Model for Ec2 instance through terraform 

 ###########################################

########################
# Provider
########################
provider aws {
  alias = "programmatic"
}

#######################
# AWS Region
#######################
data "aws_region" "this" {
  provider = aws.programmatic
 
}

###############################
# IAM Instance profile creation
###############################
resource "aws_iam_role_policy_attachment" "allow_cloudwatch_logging" {
  provider = aws.programmatic
  role = "EC2_app_role"
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}

resource "aws_iam_instance_profile" "this" {
  provider = aws.programmatic
  role     = "EC2_app_role"
}


#################################
# Key pair
#################################

resource "tls_private_key" "ec2_temp_key" {
  #provider = aws.programmatic
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2_temp_key_pair" {
  provider = aws.programmatic
  key_name   = var.key_name
  public_key = tls_private_key.ec2_temp_key.public_key_openssh

}


#################################
# Instance build
#################################

resource "aws_instance" "name" {
  
  provider = aws.programmatic
  #server_type_name                     = var.server_type_name
  #start_count                          = "0"
  #instance_name                        = "Testserver"
  # instance_count                       = "1"
  ami                                  = var.ami
  tenancy                              = var.tenancy #default
  ebs_optimized                        = var.ebs_optimized # True or false
  disable_api_termination              = var.disable_api_termination # True or False , by default value
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior #Stop or Terminate
  instance_type                        = var.instance_type
  key_name                             = var.key_name
  monitoring                           = var.monitoring # True or False
  vpc_security_group_ids               = var.vpc_security_group_ids
  subnet_id                            = var.subnet_id
  associate_public_ip_address          = var.associate_public_ip_address# False in our case
  private_ip                           = var.private_ip # null, that would automatically take it from instance
  source_dest_check                    = var.source_dest_check # true or false
  #user_data                            = var.user_data
  #user_data                            = templatefile(var.instance_user_data_path, { instance_admin_account = var.instance_admin, tmp_admin_password = var.instance_adminpassword })
  user_data                             = var.user_data
  iam_instance_profile                 = "${aws_iam_instance_profile.this.name}"
  #tags                                 = var.instance_tags
  #volume_tags                          = var.instance_volume_tags
  #root_block_device                    = local.root_block_devices
  #ebs_block_device                      = var.ebs_block_device
  #ephemeral_block_device               = var.instance_ephemeral_block_device
  #network_interface                    = var.instance_network_interface
  #cpu_credits                          = var.instance_cpu_credits
  #key_path                             = var.key_path
  #private_ip_count_per_instance        = var.cluster_private_ip_count_per_instance
  get_password_data                    = var.get_password_data

    root_block_device {
              
              volume_type = var.volume_type
              volume_size = var.volume_size
              encrypted   = var.encrypted
              delete_on_termination = var.delete_on_termination
    }

    dynamic "ebs_block_device" {
      
    for_each = var.ebs_block_device 
     content {
      device_name           = lookup(ebs_block_device.value, "device_name")
      volume_type           = lookup(ebs_block_device.value, "volume_type")
      volume_size           = lookup(ebs_block_device.value, "volume_size")
      delete_on_termination = lookup(ebs_block_device.value, "delete_on_termination")
      encrypted             = lookup(ebs_block_device.value, "encrypted")
    }
  }



  tags = {

      Name            = var.Name
      ApplicationName = var.ApplicationName
      Applicationservicenumber  = var.Applicationservicenumber
      Businessapplicationnumber = var.Businessapplicationnumber
  }
}








