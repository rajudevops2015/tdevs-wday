
provider "aws" {
 

  
}

# resource "aws_vpc" "myvpc" {
#       cidr_block = "10.0.0.0/16"
# }

# resource "aws_subnet" "public_subnet" {
#        vpc_id = aws_vpc.myvpc.id
#        cidr_block = "10.0.1.0/24" 
# }

# resource "aws_subnet" "private_subnet" {
#        vpc_id = aws_vpc.myvpc.id
#        cidr_block = "10.0.2.0/24" 
# }

# resource "aws_internet_gateway" "myigw" {
#       vpc_id = aws_vpc.myvpc.id
# }

# resource "aws_security_group" "mysg" {
#   vpc_id = aws_vpc.myvpc.id

#   ingress {
#     from_port = 22
#     to_port = 22
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }  

#   egress  {
#     from_port = 0 
#     to_port = 0
#     protocol = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }




# resource "aws_iam_user" "dev-users" {
#   name = var.username
#   path = "/system/"
  
# }
# variable "istest" {}

# locals {
#   common_tags = {
#     owner = "infrateam"
#     service = "backend"
#   }
# }

# data "aws_ami" "filter_ami" {
#   most_recent = true
#   owners = ["amazon"]

#   filter {
#      name = "name"
#      values = ["amzn2-ami-hvm*"]
#   }
  
# }

# variable "region" {
#   default = "ap-south-1"
  
# }

# variable "tags" {
#   type = list
#   default = ["server1","server2"]
  
# }

# variable "ami" {
#   type = map
#   default = {
#     "us-east-1" = "ami-0cf10cdf9fcd62d37"
#     "us-east-2" = "ami-0cf7b2f456cd5efd4"
#     "ap-south-1" = "ami-06b72b3b2a773be2b"
#   }
# }

# resource "aws_instance" "test" {
#   ami = lookup(var.ami,var.region)
#   instance_type = "t2-micro"
#   count = 2

#   tags = {
#     Name = element(var.tags,count.index)
#   } 
# }

# variable "sg_ports" {
#   type = list(number)
#   default = [22, 80, 443, 8080, 8081, 9200]
  
# }

# resource "aws_security_group" "mydynamicsg" {
#      name = "dynamic-sg"

#     dynamic "ingress" {
#      for_each = var.sg_ports
#       content {
#         from_port = ingress.value
#         to_port = ingress.value
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#       }   
#    }
  
# }


#  resource "aws_security_group" "dmysg" {
  

#   ingress {
#     from_port = 22
#     to_port = 22
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }  

#   egress  {
#     from_port = 0 
#     to_port = 0
#     protocol = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }



resource "aws_instance" "test1" {
  ami = "ami-07761f3ae34c4478d"
  instance_type = lookup(var.itype,terraform.workspace)
  key_name = "raju1603"
}

variable "itype" {
  type = map
  default = {
    dev = "t2.small"
    test = "t2.medium"
    prod = "t2.large"
  }
  
}
# resource "null_resource" "ping_check" {
#   provisioner "local-exec" {
#     command = "curl https://googlexiurwerioy.com"
    
#   }
  
# }


  # provisioner "local-exec" {
  #   command = "echo ${aws_instance.test.private_ip} >> private_ip.txt"
    
  # }
  

  # connection {
  #   type     = "ssh"
  #   user     = "ec2-user"
  #   private_key = file("./raju1603.pem")
  #   host     = self.public_ip
  # }
  # #   provisioner "file" {
  # #   source      = "./index.html"
  # #   destination = "/tmp/index.html"
  # # }

  #  provisioner "remote-exec" {
  #   on_failure = continue
  #   inline = [
  #     "sudo amazon-linux-extras install -y nginx1"
      
  #   ]
  # }

# resource "aws_eip" "myips" {
#   domain = "vpc"
#   count = 3
  
# }

# resource "null_resource" "ip_capture" {

#   triggers = {
#     latest_ips = join(",", aws_eip.myips[*].public_ip)
#   }

#   provisioner "local-exec" {
#     command = "echo latest ips created are ${null_resource.ip_capture.triggers.latest_ips} > iplist.txt"
    
#   }
  
# }
