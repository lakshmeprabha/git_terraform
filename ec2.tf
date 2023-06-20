resource "aws_instance" "firstec2" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  tags = {
    Name = "First ec2"
  }
}

