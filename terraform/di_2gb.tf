resource "digitalocean_droplet" "di-2gb" {
  image  = "ubuntu-24-04-x64"
  name   = "di-2gb"
  region = "nyc3"
  size   = "s-1vcpu-2gb"
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]
}

output "server_ip" {
  value = digitalocean_droplet.di-2gb.ipv4_address
}
