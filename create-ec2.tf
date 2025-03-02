provider "aws" {
  region = "us-east-1"  # Change region if needed
}

resource "aws_instance" "free_ec2" {
  ami           = "ami-08c40ec9ead489470"  # Amazon Linux 2 Free-tier
  instance_type = "t3.micro"  # Free-tier eligible
  key_name      = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDG+bnJPxfguJ6KF+HQkdfB+nOJpbngt9YJnkDjF>"  # Replace with your SSH key

  tags = {
    Name = "FreeTier-EC2"
  }
}

output "ec2_public_ip" {
  value       = aws_instance.free_ec2.public_ip
  description = "Public IP of the EC2 instance"
}
