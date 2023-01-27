resource "aws_security_group" "test" {
    name = "test"
    ingress {
        from_port = var.server_port
        to_port = var.server_port
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
resource "aws_instance" "test" {
    ami           = var.ami_id
    instance_type = var.instance_type
    subnet_id     = var.subnet_id
    vpc_security_group_ids = [aws_security_group.test.id]
    tags =  {
        Name = "terraform-example"
    }
    user_data = <<-EOF
                #!/bin/bash
                echo "Hello, World" > index.xhtml
                nohup busybox httpd -f -p ${var.server_port} &
                EOF
    user_data_replace_on_change = true
}