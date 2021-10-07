output "pri-ec2-sg-id"{
    value = aws_security_group.pri-ec2-sg.id

}

output "alb-sg-id"{
    value = aws_security_group.alb-sg.id

}

output "rds-sg-id"{
    value = aws_security_group.rds-sg.id
}

output "pub-ec2-sg-id"{
    value = aws_security_group.pub-sg.id

}

