module "oem_vpc" {
  source            = "git::https://github.com/SShaheeda/tf_aws_vpc.git"
  vpc_cidr            = var.oem_vpc_cidr
  global_private_subnets   = var.oem_private_subnet
  global_public_subnets    = var.oem_public_subnet
  global_availability_zones = var.oem_az
  vpc_oem          = var.vpcname
}

resource "aws_instance""public_ec2"{
  count                   = length(split(",", module.oem_vpc.public_subnets))
  vpc_id                  = module.oem_vpc.vpc_id
  subnet_id               = element(split(",", module.oem_vpc.public_subnets), count.index)
  ami ="ami-05fa00d4c63e32376"
  instance_type="t2.micro"
  depends_on = [module.oem_vpc]

  tags={
    Name ="db EC2 is created in public"
}
}

resource "aws_instance""private_ec2"{
 
 count                   = length(split(",",module.oem_vpc.private_subnets))
 vpc_id                  = module.oem_vpc.vpc_id
 cidr_block              = element(split(",",module.oem_vpc.private_subnets), count.index)
  
  ami ="ami-05fa00d4c63e32376"
  instance_type="t2.micro"
  depends_on = [module.oem_vpc]

  tags={
    Name ="db EC2 is created in private"
}
}