variable "instancetype" {
    default = "t2.nano"
}
  

# variable "username" {
#     type = number
  
# }

variable "list" {
  type = list
  default = ["m5.large", "m5.xlarge", "t2.medium"]
  
}


variable "types" {
  type = map
  default = {
    us-east-1a = "t2.nano"
    us-east-1b = "t2.micro"
    us-east-1c = "t2.small"
  }
  
}