resource "aws_route53_zone" "k3s" {
  name = "k3s.logic-refinery.io"
}

resource "aws_route53_record" "k3s-ns" {
  zone_id = "ZGF50YPNDYLZK"
  name    = "k3s.logic-refinery.io"
  type    = "NS"
  ttl     = "60"
  records = aws_route53_zone.k3s.name_servers
}

resource "aws_instance" "server" {
  ami               = "ami-08f6e7446faea65e0"
  instance_type     = "t3a.small"
  availability_zone = "us-east-2a"

  tags = {
    Name = "server"
  }

  key_name = "logic-refinery"

  security_groups = ["default", "allow_ssh"]
}

resource "aws_route53_record" "server" {
  zone_id = aws_route53_zone.k3s.zone_id
  name    = "server.k3s.logic-refinery.io"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.server.public_ip]
}

resource "aws_route53_record" "server_int" {
  zone_id = aws_route53_zone.k3s.zone_id
  name    = "server-int.k3s.logic-refinery.io"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.server.private_ip]
}

resource "aws_instance" "agent1" {
  ami               = "ami-08f6e7446faea65e0"
  instance_type     = "t3a.small"
  availability_zone = "us-east-2a"

  tags = {
    Name = "agent1"
  }

  key_name = "logic-refinery"

  security_groups = ["default", "allow_ssh"]
}

resource "aws_route53_record" "agent1" {
  zone_id = aws_route53_zone.k3s.zone_id
  name    = "agent1.k3s.logic-refinery.io"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.agent1.public_ip]
}

resource "aws_route53_record" "agent1_int" {
  zone_id = aws_route53_zone.k3s.zone_id
  name    = "agent1-int.k3s.logic-refinery.io"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.agent1.private_ip]
}
