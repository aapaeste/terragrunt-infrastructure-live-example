# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.      
terraform {
  source = "git::https://github.com/aapaeste/terraform-aws-ec2-instance.git"
  #source = "git::https://github.com/terraform-aws-modules/terraform-aws-ec2-instance.git?ref=v2.12.0"
#source = "git::https://aapaeste@bitbucket.org/aapaeste/terragrunt-aws-modules.git//mysql?ref=v0.1.0"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  aws_region = "us-east-1"
  name = "vpc-vault"
  ami = "ami-0e5e487b827f19994" 
  instance_type = "t2.micro"
  key_name = "centos"
  vpc_security_group_ids = [ "sg-0571c77f5be34287e" ]
  subnet_id = "subnet-099f3d7c0027065f9"
  tags = { Name = "vpc-vault-tag01", Name2 = "vpc-vault-tag02" }
  volume_tags = { Name = "vpc-vault-vol-tag01", Name2 = "vpc-vault-vol-tag02" }
}
#  instance_state = "running"
