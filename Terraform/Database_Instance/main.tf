# data source
data "aws_subnet" "subnet_ids"{
    filter {
      name = "vpc_id"
      values = [ var.vpc_id ]
    }

}


# resources
resource "aws_db_subnet_group" "db_subnet_group" {
    subnet_ids = data.aws_subnet.selected_subnet.id
  
}

resource "aws_db_instance" "my_database" {
  username = var.db_username
  password = var.database_password
  engine = "mysql"
  port = "3306"
  instance_class = "db.t3.micro"
  allocated_storage = 10
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  
}
