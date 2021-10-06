variable "vpc_id"{

}

variable "alb-sg-name"{
    type    = string
    default = "task-vpc-alb-sg"
    
}

variable "ec2-sg-name"{
     type    = string
    default = "task-vpc-pri-sg"

}