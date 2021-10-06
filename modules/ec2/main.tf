resource "aws_instance" "pri-ec2" {
  ami           = "ami-087c17d1fe0178315"
  instance_type = "t2.micro"
  subnet_id = var.pri1-sub
  associate_public_ip_address= "false"
  vpc_security_group_ids= ["${var.ec2-sg}",]
  user_data = <<EOF
		#!/bin/bash
        yum update -y
        yum install -y httpd
        systemctl start httpd
        systemctl enable httpd
        echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
	EOF


  tags = {
    Name = "pri1-task-vpc"
  }
}