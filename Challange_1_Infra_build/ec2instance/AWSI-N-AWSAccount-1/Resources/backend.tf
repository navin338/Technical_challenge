
terraform {
   backend "s3" {
     region         = "us-east-2" 
     bucket         = "awsi-tf-statefile" # enter bucket name
     key            = "test-app.tfstate" # enter required state file name
     encrypt        = "true"
     profile = "prod-sa-Test-AVM_prog" # cannot use variable on backend file, so enter the profile name manually
     
   }
 }
