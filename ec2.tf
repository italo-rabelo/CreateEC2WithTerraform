module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"
  
  name = "VmCreatedByTerraform"

  instance_type = "t2.micro"
  monitoring = true
  vpc_security_group_ids = ["vpc-01c015b9f9cbac0d7"]

  tags = {
    Terraform = "true"
    Environment = "prod"
  }
}
