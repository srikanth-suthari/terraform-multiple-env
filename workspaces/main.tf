resource "aws_instance" "ec2_instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.remote-exec-demo.id]
    tags = {
        Name = "remote-exec-demo"
    }

    #It requires a connection block and a privisioner block
    connection {
        type     = "ssh"
        user     = "ec2-user"
        password = "DevOps321"
        host     = self.public_ip
        # user        = "ubuntu"                # Default user for Ubuntu AMIs (use "ec2-user" for Amazon Linux)
        # private_key = file("~/.ssh/id_rsa")   # Path to your local private key file
        # host        = self.public_ip
    }

    provisioner "remote-exec" {
        inline = [
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx"
        ]
    }

    provisioner "local-exec" {
        command = "echo ${self.public_ip}"
        on_failure = continue
    }

    provisioner "remote-exec" {
      inline = [
        "sudo systemctl stop nginx",
        "echo 'successfully stopped nginx server' "
      ]
      when = destroy
    }
    # Used this additonally
    # provisioner "local-exec" {
    #     command = "echo Instance is being destroyed and Nginx service is stopped"
    #     when = destroy
    # }
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