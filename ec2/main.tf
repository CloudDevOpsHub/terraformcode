provider "aws" {
  region = "ap-south-1" # Change to your preferred region
}

resource "aws_instance" "terraform_server" {
  ami                    = "ami-0f559c3642608c138"
  instance_type          = "t3.micro"
  count                  = 1

  tags = {
    Name = "tf_server"
  }
}

output "ec2_public_ips" {
  value = aws_instance.terraform_server[*].public_ip
}
