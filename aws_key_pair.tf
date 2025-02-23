resource "aws_key_pair" "my_key_pair" {
  public_key = var.ssh_public_key
}
