variable "oem_vpc_cidr"{
     description = "cidr range of oem_vpc"
}

variable "oem_private_subnet"{
    description = "private subnet of oem"
}

variable "oem_public_subnet"{
    description = "public subnet of oem"
}

variable "vpcname"{
    description = "vpc name"
}

variable "env" {
    type = string
    description = "infrastructure environment details."
}


variable "s3_alb_log" {
        description = "application LB s3 bucket name"
}
variable "oem_az" {
   
    description = "availability zones"
}
