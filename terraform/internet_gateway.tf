resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.awad-vpc-tf.id

  tags = {
    Name = "Internet gateway for Awad vpc"
  }
}