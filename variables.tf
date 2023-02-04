variable "name" {
  type=string
  default = "nuriza"
}
variable "vpc_cidr" {
  type= string
  default ="10.0.0.0/16"
}
# variable "countw" {
#   type= any
#   default = 2
# }
variable "public_subnets" {
default = ["10.0.0.0/24","10.0.1.0/24"]
}
 variable "zones" {
  type =list(string)
  default = ["ap-northeast-1a", "ap-northeast-1c"]
   
 }