resource "digitalocean_database_cluster" "db" {
  name       = var.DB_DATABASE
  engine     = "mysql"
  size       = "db-s-1vcpu-1gb"
  region     = "nyc3"
  version    = "8"
  node_count = 1
}

resource "digitalocean_database_user" "default" {
  cluster_id = digitalocean_database_cluster.db.id
  name       = var.DB_USERNAME
}

resource "digitalocean_database_firewall" "db_firewall" {
  cluster_id = digitalocean_database_cluster.db.id

  rule {
    type  = "droplet"
    value = var.droplet_id
  }
}