
# resource "aws_route53_zone" "dev" {
#   name = "dev.logic-refinery.io"
# }
# 
# resource "aws_route53_record" "dev-ns" {
#   zone_id = "ZGF50YPNDYLZK"
#   name    = "dev.logic-refinery.io"
#   type    = "NS"
#   ttl     = "60"
#   records = aws_route53_zone.dev.name_servers
# }
# 
# 
# 
# 
# 
# resource "aws_instance" "jmpbox" {
# 
#   ami               = "ami-08f6e7446faea65e0"
#   instance_type     = "t3a.micro"
#   availability_zone = "us-east-2a"
# 
#   tags = {
#     Name = "jmpbox"
#   }
# 
#   key_name = "logic-refinery"
# 
#   security_groups = ["default", "allow_ssh" ]
# }
# 
# 
# resource "aws_route53_record" "www" {
#   zone_id = aws_route53_zone.dev.zone_id
#   name    = "jmpbox.dev.logic-refinery.io"
#   type    = "A"
#   ttl     = "30"
#   records = [aws_instance.jmpbox.public_ip]
# }
# 
# 
# resource "aws_ebs_volume" "example" {
#   availability_zone = "us-east-2a"
#   size = 10  # 10G
# }
# 
# 
# resource "aws_volume_attachment" "example" {
#   device_name = "/dev/xvdb"
#   volume_id   = aws_ebs_volume.example.id
#   instance_id = aws_instance.jmpbox.id
# }
