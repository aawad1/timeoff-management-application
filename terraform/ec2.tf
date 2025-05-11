resource "aws_instance" "awad-ec2-tf" {
  ami           = "ami-0d8d11821a1c1678b"
  instance_type = "t2.micro"
  key_name = aws_key_pair.deployer.key_name
  subnet_id = aws_subnet.public-subnet.id
  # vpc_security_group_ids = [ aws_security_group.ssh.id ]
  associate_public_ip_address = true

  user_data = <<EOF
  #!/bin/bash
  echo "here i am"
  #apt-get update
  #apt-get install -y nginx
  EOF

  tags = {
    Name = "Awad EC2 instance via terraform"
  }
}
