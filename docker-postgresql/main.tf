terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "4.3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "postgres" {
  name         = "postgres:latest"
  keep_locally = false
}

resource "docker_container" "postgres" {
  image = docker_image.postgres.image_id
  name  = "postgres"

  ports {
    internal = 5432
    external = 5433
  }

  env = [
    "POSTGRES_USER=postgres",
    "POSTGRES_PASSWORD=p@ssw0rd123",
  ]
}
