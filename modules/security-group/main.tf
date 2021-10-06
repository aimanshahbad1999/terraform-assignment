resource "aws_security_group" "alb-sg" {
  name = "task-vpc-alb-sg"
   vpc_id      = var.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.alb-sg-name
  }
}

resource "aws_security_group" "pri-ec2-sg" {
  name = "task-vpc-pri-sg"
   vpc_id      = var.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    security_groups = ["${aws_security_group.alb-sg.id}",]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.ec2-sg-name
  }
}