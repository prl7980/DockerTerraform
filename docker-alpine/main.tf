terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "alpine" {
  name         = "alpine:latest"
  keep_locally = false
}

resource "docker_container" "apline" {
  image = docker_image.alpine.image_id
  name  = "alpine"
  tty = true
}