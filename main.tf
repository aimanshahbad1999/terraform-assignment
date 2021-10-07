provider "aws" {
  region = var.region
}

module "vpc"{
  source = "./modules/vpc"
}

module "subnet"{
  source = "./modules/subnet"
  vpc_id = module.vpc.id
}

module "ig"{
  source = "./modules/internet-gateway"
  vpc_id = module.vpc.id
}

module "nat"{
    source= "./modules/nat-gateway"
    subnet_id= module.subnet.pub1-sub-id
}

module "route-ig"{
    source= "./modules/route-table"
    task-vpc-ig= module.ig.id
    vpc_id=module.vpc.id
    nat_id=module.nat.id
    
}

module "route-table-subnet-association"{
    source= "./modules/route-table-association"
    pub1_id=module.subnet.pub1-sub-id
    pub2_id=module.subnet.pub2-sub-id
    rt_gw_id= module.route-ig.rt-gw-id
    
    pri1_id=module.subnet.pri1-sub-id
    pri2_id=module.subnet.pri2-sub-id
    rt_nat_id=module.route-ig.nat-id


}

module "security-group"{
      source= "./modules/security-group"
      vpc_id= module.vpc.id


}

module "ec2"{
    source= "./modules/ec2"
    pri1-sub= module.subnet.pri1-sub-id
    ec2-sg=module.security-group.pri-ec2-sg-id
    pub1-sub=module.subnet.pub1-sub-id


    pub-ec2-sg=module.security-group.pub-ec2-sg-id

}

module "alb"{
    source= "./modules/alb"
    alb-sg=module.security-group.alb-sg-id
    pub1-sub=module.subnet.pub1-sub-id
    pub2-sub=module.subnet.pub2-sub-id
    vpc_id=module.vpc.id
    ec2-id=module.ec2.id

}


module "rds"{
    source= "./modules/rds"
    pub1_sub=module.subnet.pub1-sub-id
    pub2_sub=module.subnet.pub2-sub-id
    pri1_sub=module.subnet.pri1-sub-id
    pri2_sub=module.subnet.pri2-sub-id
    rds-sg= module.security-group.rds-sg-id
}
