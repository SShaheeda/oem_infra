resource "aws_s3_bucket" "s3_alb_logs" {
  bucket = var.s3_alb_log
  acl    = "private"

  tags = {
    Name        = "s3_ALB_log"
    Environment = var.env
  }
}