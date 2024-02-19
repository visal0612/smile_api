provider "aws" {
  region = "preferred-aws-region"
}

resource "aws_instance" "smile_app_instance" {
  ami           = "ami-xxxxxxxxxxxxxxxxx"  # Specify the appropriate AMI for your region
  instance_type = "t2.micro"
  key_name      = "ec2-key-pair-name"  # Replace with your EC2 key pair name

  tags = {
    Name = "my-smile-app-instance"
  }

  user_data = <<-EOF
              #!/bin/bash
              docker run -d -p 80:5000 your-docker-hub-username/smile-app:latest
              EOF

  security_group_names = ["smile_app_sg"]
}

resource "aws_security_group" "smile_app_sg" {
  name        = "smile_app_sg"
  description = "Security group for smile application"

  ingress {
    from_port   = 80
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
