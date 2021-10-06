output "pub1-sub-id"{
    value = aws_subnet.public-subnet1.id
}

output "pub2-sub-id"{
    value = aws_subnet.public-subnet2.id
}

output "pri1-sub-id"{
    value = aws_subnet.private-subnet1.id
}

output "pri2-sub-id"{
    value = aws_subnet.private-subnet2.id
}