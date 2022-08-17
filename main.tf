terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}
 variable "reponame" {}
 variable "container_port" {}

provider "docker" {}

resource "docker_image" "juan" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = var.reponame
  ports {
    internal = 80
    external = var.container_port
  }
}
// en terraformm para declarar variables se usa la palabra "variable" sin embargo para utilizarlas se utiliza el prefijo "var.(nombre de la variable)".
