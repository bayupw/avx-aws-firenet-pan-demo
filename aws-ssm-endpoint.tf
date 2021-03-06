# ---------------------------------------------------------------------------------------------------------------------
# AWS SSM
# ---------------------------------------------------------------------------------------------------------------------
resource "random_string" "ssm_random_id" {
  length  = 3
  special = false
  upper   = false
}

resource "aws_iam_role" "ssm_instance_role" {
  name               = "ssm-instance-role-${random_string.ssm_random_id.id}"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": {"Service": "ec2.amazonaws.com"},
    "Action": "sts:AssumeRole"
  }
}
EOF
}

resource "aws_iam_instance_profile" "ssm_instance_profile" {
  name = "ssm-instance-profile-${random_string.ssm_random_id.id}"
  role = aws_iam_role.ssm_instance_role.name
}

resource "aws_iam_role_policy_attachment" "ssm_instance_role_policy_attachment" {
  role       = aws_iam_role.ssm_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# SSM Spoke1
resource "aws_security_group" "spoke1_endpoint_sg" {
  name        = "ssm-ec2-endpoints-sg"
  description = "Allow TLS inbound traffic for SSM/EC2 endpoints"
  vpc_id      = module.spoke1.vpc.vpc_id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [module.spoke1.vpc.cidr]
  }
  tags = {
    Name = "spoke1-ssm-ec2-endpoints"
  }
}

resource "aws_vpc_endpoint" "spoke1_ssm_endpoint" {
  vpc_id              = module.spoke1.vpc.vpc_id
  service_name        = "com.amazonaws.${var.aws_region}.ssm"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = [module.spoke1.vpc.private_subnets[0].subnet_id]
  security_group_ids  = [aws_security_group.spoke1_endpoint_sg.id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "spoke1_ssm_messages_endpoint" {
  vpc_id              = module.spoke1.vpc.vpc_id
  service_name        = "com.amazonaws.${var.aws_region}.ssmmessages"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = [module.spoke1.vpc.private_subnets[0].subnet_id]
  security_group_ids  = [aws_security_group.spoke1_endpoint_sg.id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "spoke1_ec2_messages_endpoint" {
  vpc_id              = module.spoke1.vpc.vpc_id
  service_name        = "com.amazonaws.${var.aws_region}.ec2messages"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = [module.spoke1.vpc.private_subnets[0].subnet_id]
  security_group_ids  = [aws_security_group.spoke1_endpoint_sg.id]
  private_dns_enabled = true
}

# SSM Spoke2
resource "aws_security_group" "spoke2_endpoint_sg" {
  name        = "ssm-ec2-endpoints-sg"
  description = "Allow TLS inbound traffic for SSM/EC2 endpoints"
  vpc_id      = module.spoke2.vpc.vpc_id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [module.spoke2.vpc.cidr]
  }
  tags = {
    Name = "spoke2-ssm-ec2-endpoints"
  }
}

resource "aws_vpc_endpoint" "spoke2_ssm_endpoint" {
  vpc_id              = module.spoke2.vpc.vpc_id
  service_name        = "com.amazonaws.${var.aws_region}.ssm"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = [module.spoke2.vpc.private_subnets[0].subnet_id]
  security_group_ids  = [aws_security_group.spoke2_endpoint_sg.id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "spoke2_ssm_messages_endpoint" {
  vpc_id              = module.spoke2.vpc.vpc_id
  service_name        = "com.amazonaws.${var.aws_region}.ssmmessages"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = [module.spoke2.vpc.private_subnets[0].subnet_id]
  security_group_ids  = [aws_security_group.spoke2_endpoint_sg.id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "spoke2_ec2_messages_endpoint" {
  vpc_id              = module.spoke2.vpc.vpc_id
  service_name        = "com.amazonaws.${var.aws_region}.ec2messages"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = [module.spoke2.vpc.private_subnets[0].subnet_id]
  security_group_ids  = [aws_security_group.spoke2_endpoint_sg.id]
  private_dns_enabled = true
}