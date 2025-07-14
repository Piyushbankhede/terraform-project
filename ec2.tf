data "template_file" "user_data" {
  template = file("${path.module}/user_data.sh")
}

resource "aws_launch_template" "web_lt" {
  name_prefix   = "web-lt"
  image_id      = "ami-0150ccaf51ab55a51" 
  instance_type = "t3.micro"

  user_data = base64encode(data.template_file.user_data.rendered)

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "WebServer"
    }
  }
}
