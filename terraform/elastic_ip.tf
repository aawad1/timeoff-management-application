resource "aws_eip" "awad-eip" {
    instance = aws_instance.awad-ec2-tf.id
    domain = "vpc"
}