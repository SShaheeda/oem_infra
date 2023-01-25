##resource "aws_s3_bucket" "s3_alb_logs" {
#  bucket = var.s3_alb_log
#  acl    = "private"
#  
#  server_side_encryption_configuration {
#    rule {
#      apply_server_side_encryption_by_default {
#        sse_algorithm = "AES256"
#      }
#    }
#  }
#
#  policy = <<POLICY
#{
#    "Version": "2012-10-17",
#    "Statement": [
#        {
#            "Effect": "Allow",
#            "Action": [
#                "s3:*",
#                "s3-object-lambda:*"
#            ],
#            "Resource": "*"
#        }
#    ]
#}
#POLICY
#
#tags = {
#  Name        = "s3_ALB_log"
#  Environment = var.env
#}
#
#}