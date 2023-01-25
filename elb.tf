locals {
  subnetids  = split(",", module.oem_vpc.public_subnets)
}


resource "aws_lb" "oem_alb" {
  name               = "oem-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.oem_vpc.sg_https_oem,module.oem_vpc.sg_http_oem]
  subnets            = [ local.subnetids[0],local.subnetids[1] ]

  enable_deletion_protection = true

 
  tags = {
    Environment = var.env
    Name = "oem_alb"
  }
}

resource "aws_lb_target_group" "oem_alb_target" {
  name     = "tf-oem-lb-tg"
  port     =  443
  protocol = "HTTPS"
  target_type = "instance"
  vpc_id   = module.oem_vpc.vpc_id
}



resource "aws_lb_listener" "oem-lb-listener" {
  load_balancer_arn = aws_lb.oem_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:us-east-1:956547001837:certificate/11d330ed-fcad-46c2-a46e-661d165214ea"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.oem_alb_target.arn
  }
}

