resource "aws_instance" "firstec2" {
  ami           = var.ami_id
  instance_type = "t2.micro"
   key_name      = "terraform-key"

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./terraform-key.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update",
      "sudo yum install docker -y",
      "sudo service docker start",
      "sudo docker pull prabhamani/angularimage:v1",
      "sudo docker run -d -it --name angular_container -p 80:80 prabhamani/angularimage:v1"
    ]
  }
}