resource "aws_instance" "ec2_instance" {
    ami = var.ami_id
    instance_type = lookup(var.instance_type, terraform.workspace)
    vpc_security_group_ids = [aws_security_group.remote-exec-demo.id]
    tags = {
        Name = ""
    }
}

resource "aws_security_group" "remote-exec-demo" {
    name = "remote-exec-demo"

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
}