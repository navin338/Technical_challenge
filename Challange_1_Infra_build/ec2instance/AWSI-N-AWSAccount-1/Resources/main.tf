
##################
##################
##################
# Instance built
##################
##################
##################

module "instance" {
  source = "../module/"

  providers = {
    aws.programmatic = aws.programmatic
  }

  ami                                  = var.instance_ami
  instance_type                        = var.instance_type
  key_name                             = var.instance_key_name
  monitoring                           = var.instance_monitoring # True or False
  vpc_security_group_ids               = var.instance_vpc_security_group_ids
  subnet_id                            = var.instance_subnet_id
  private_ip                           = var.instance_private_ip # null, that would automatically take it from instance
  user_data                             = templatefile("../module/winrm_user_data_admin_pwd.tpl", { instance_admin_account = var.localadminusername, tmp_admin_password = var.localadminpassword })
  ebs_block_device                      = var.ebs_block_device
  volume_type                           = var.volume_type
  volume_size                           = var.volume_size
  Name                                  = var.instance_Name
  ApplicationName                       = var.instance_ApplicationName
  Applicationservicenumber              = var.instance_Applicationservicenumber
  Businessapplicationnumber             = var.instance_Businessapplicationnumber
  
}
