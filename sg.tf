resource "aws_securitya-group" "sg_private"{
  name        = "private security"
  description = "Allows alb traffic"
  vpc_id      = module.oem_vpc.vpc_id

 ingress {
    description = " from VPC"
    from_port   = 1521
    to_port     = 1521
    protocol    = "tcp"
    cidr_blocks = ["10.93.127.128/27","10.93.127.160/27"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_securitya-group" "sg_public"{
    name        = "private security"
  description = "Allows alb traffic"
  vpc_id      = module.oem_vpc.vpc_id

 ingress {
    description = " all traffic"
    from_port   = 0
    to_port     = 0
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