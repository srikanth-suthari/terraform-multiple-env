resource "aws_instance" "ec2_instance" {
    count = 5
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.multi_env_sg.id]
    tags = merge(
        local.common_tags,
        {
            Name = "${local.common_name}-tfvars-multi-env-[count.index]"
        }
    )

    connection {
        user = "ec2-user"
        host = self.public_ip
        type = "ssh"
        password = "DevOps321"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo yum update -y",
            "sudo yum install nginx -y",
            "sudo systemctl restart nginx",
            "echo Instance has been provisioned with Nginx..!"
        ]
    }
}

resource "aws_security_group" "multi_env_sg" {
    name = "${local.common_name}-tfvars-multi-env"

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
            Name = "${local.common_name}-tfvars-multi-env"
        }
    )
}