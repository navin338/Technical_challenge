
#################################
#################################
#################################
#  Instance Build
#################################
#################################
#################################


instance_key_name = null#"AWS-TEST-N-1-KP"
instance_ami = "ami-0XXX321"
instance_type = "t2.micro"
instance_vpc_security_group_ids = ["sg-XXX1","sg-XXX2","sg-XXX3"]
instance_subnet_id = "subnet-123XXX"
#instance_user_data_path = "../module/winrm_user_data_admin_pwd.tpl"
instance_Name = "Testserver3"
instance_ApplicationName = "SampleApp"
instance_Applicationservicenumber = "123456789"
instance_Businessapplicationnumber = "SampleEnvironment"
volume_type = "gp2"
volume_size = "130"
localadminusername = "testuser"
localadminpassword = "Nav1n@098765432"


ebs_block_device = [
  {
    device_name           = "xvdb"
    volume_type           = "gp2"
    volume_size           = 80
    delete_on_termination = "true"
    encrypted             = "true"
  },
  {
    device_name           = "xvdc"
    volume_type           = "gp2"
    volume_size           = 80
    delete_on_termination = "true"
    encrypted             = "true"
  }
]
