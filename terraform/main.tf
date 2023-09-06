

provider "digitalocean" {
  token = var.DIGITAL_OCEAN_API_KEY
}

resource "digitalocean_droplet" "web" {
  image  = "ubuntu-20-04-x64"
  name   = "test-terraform-droplet"
  region = "nyc3"
  size   = "s-1vcpu-1gb"
  ssh_keys = [36064359]
}

resource "digitalocean_domain" "domain" {
    name       = "kukiamarilla.store"
    ip_address = digitalocean_droplet.web.ipv4_address
}

resource "digitalocean_record" "www_record" {
    domain = digitalocean_domain.domain.name
    type   = "A"
    name   = "www"
    value  = digitalocean_droplet.web.ipv4_address
    ttl    = 3600
}

module "database" {
  source = "./modules/database"
  DB_DATABASE     = var.DB_DATABASE
  DB_USERNAME     = var.DB_USERNAME
  droplet_id      = digitalocean_droplet.web.id
}