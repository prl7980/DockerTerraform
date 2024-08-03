terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "mysql" {
  name         = "mysql/mysql-server:latest"
  keep_locally = false
}

resource "docker_container" "mysql" {
  image = docker_image.mysql.image_id
  name  = "mysql"
  ports {
    internal = 3306
    external = 3306
  }
  env = [
    "MYSQL_ROOT_PASSWORD=P@ssw0rd123",
  ]
}


