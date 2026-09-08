resource "aws_instance" "ec2_instance" {
    ami = var.ami_id
    instance_type = lookup(var.instance_type, terraform.workspace)
    vpc_security_group_ids = [aws_security_group.remote-exec-demo.id]
    tags = merge(
        local.common_tags,
        {
            Name = local.common_name
        }
    )
}

resource "aws_security_group" "workspace-demo" {
    name = "${var.project}-${terraform.workspace}"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = merge(
        local.common_tags,
        {
            Name = local.common_name
        }
    )
}