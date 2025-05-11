resource "aws_key_pair" "deployer" {
    key_name = "awad_key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDmPDSTz+UWum2dOczvygE5kIZDpwp0Q7bO0JuSJqI/HeFLRAn6o1f6qVcCiukIklfXY8UVleqYY8nvAZQ84nLcbL0oeRbNjPpYvg0EZU2ES443gykYwu+EJSZ8Gvfl8dRsiif/LlPHZ+RDQMgK6ph0aOx21MwBx4a0Bc4vQj3F4+DbGaL+SAOLpQ9yCD83xdF5A/DHtW1zkvqhTKYLsIX89WY5nvZpslkMj3A4JE13h84/vkLryjbf6MvEvG1F1+L5pU7CO+i3EMAjm5cp/jL0gKocBj1zT6doxUnxj7P6qPimtn0r4CYpsT4OWwsS8nNI4qkDUu85BZz96qYkxi0tmaFe04XNz9YexJ1w2/ssTh6bWgiF0ixmzGwdLvnrOQHN6Ihydm6EvSmT3dyh39X4qoqFeVv9zL8GAQEzsfrYbDswRoAPHGpDE4LrP0jjw3s0um5YLtShNxstH2+Tim8R8TJDjbyD37GyqpA/Uz3LbPknB6KJ/5ghMeEvw3+5AwIpzod5Gkz9EtxPnFvZ65pR6xIYEcGP6wzrUdwJfXgCMR/BxdUwiA6B1VdyJ+psopsjlk0eG2YUAkrZHGqAIY1v7bLY1W3WRNZRvpvWRPUF+PPDcIbZJ+MNQoNwTZOEPlMWH3C0CBZKiIVTf3G+UWCgUj6BMlPqgUl6EH6uEnAKJw== aawad00@SIMPLE-PC"
    # use terraform to generate ssh key for ec2 instance
}

resource "aws_security_group" "sg_awad" {
    name = "sg_awad"
    vpc_id = aws_vpc.awad-vpc-tf.id
    description = "Security group for Awad ec2 instance"

    tags = {
      Name = "sg-awad"
    }
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
    security_group_id = aws_security_group.sg_awad.id
    cidr_ipv4 = "0.0.0.0/0" # pokusavam prvo sa svih adresa pa cu onda staviti svoju ip adresu
    from_port = 22
    to_port = 22
    ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_port443" {
  security_group_id = aws_security_group.sg_awad.id
  cidr_ipv4         = aws_vpc.awad-vpc-tf.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_port80" {
  security_group_id = aws_security_group.sg_awad.id
  cidr_ipv4         =  "0.0.0.0/0"
  from_port         = 80
  ip_protocol = "tcp"
  to_port           = 80
}


# i dont know if we need ipv6 but in case it is needed here it is
# resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv6" {
#   security_group_id = aws_security_group.allow_ssh.id
#   cidr_ipv6         = aws_vpc.awad-vpc-tf.ipv6_cidr_block
#   from_port         = 443
#   ip_protocol       = "tcp"
#   to_port           = 443
# }