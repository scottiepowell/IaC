variable "access_key" {
    description = "Access key to AWS console"
}
variable "secret_key" {
    description = "Secret key to AWS console"
}
variable "region" {
    default = "us-east-1"
    description = "Region of AWS VPC"
}
variable "ami_id" {
    description = "AMI Ubuntu 22.04-LTS-hvm-SSD-ebs"
    default = "ami-00874d747dde814fa"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "subnet_id" {
  description = "default subnet with 4091 ip addresses/172.31.16.0/20"
  default = "subnet-01c7983b93db4fc44"
}
variable "server_port" {
  description = "port that server uses for http requests"
  default = 8080
}
