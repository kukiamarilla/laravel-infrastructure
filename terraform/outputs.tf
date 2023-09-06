output "ipv4_address" {
  value = digitalocean_droplet.web.ipv4_address
  depends_on = [digitalocean_droplet.web]
}

output "db_host" {
  value = module.database.db_host
}

output "db_port" {
  value = module.database.db_port
}

output "db_password" {
  value = module.database.db_password
  sensitive = true
}