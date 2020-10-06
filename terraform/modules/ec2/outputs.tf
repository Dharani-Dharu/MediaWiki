output "dbserver_instance_id" {
    description ="Instance ID of DB server"
    value = aws_instance.dbserver.id
}