output "db_host" {
  description = "The host of the database"
  value       = digitalocean_database_cluster.db.host
  depends_on  = [digitalocean_database_cluster.db]
}

output "db_port" {
  description = "The port of the database"
  value       = digitalocean_database_cluster.db.port
  depends_on  = [digitalocean_database_cluster.db]
}

output "db_password" {
  description = "The password of the database"
  value       = digitalocean_database_cluster.db.password
  depends_on  = [digitalocean_database_cluster.db]
}