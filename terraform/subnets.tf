resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.awad-vpc-tf.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_subnet" "private-subnet" {
    vpc_id = aws_vpc.awad-vpc-tf.id
    cidr_block = "10.0.2.0/24"

    tags = {
        Name = "Private Subnet"
    }
}