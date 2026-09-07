variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "region" {
    type = string
    default = "us-east-1"
}

variable "ec2_tags" {
    type = map
    default = {
        Name = "Linux"
        terraform = "true"
        Project = "Terraform"
    }
}

# Security group name and rules
variable "sg_name" {
    type = string
    default = "my-securigy-group"
}

variable "ingress_from_port" {
    default = 0
}

variable "ingress_to_port" {
    default = 0
}

variable "ingress_http_from_port" {
    default = 80
}

variable "ingress_http_to_port" {
    default = 80
}

variable "http_protocol" {
    type = string
    default = "TCP"
}

variable "egress_from_port" {
    default = 0
}

variable "egress_to_port" {
    default = 0
}

variable "protocol" {
    type = string
    default = "-1"
}

variable "ingress_cidr" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "egress_cidr" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "sg_tags" {
    type = map
    default = {
        Name = "My_SG"
        terraform = "true"
        Project = "Terraform"
    }
}