terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 4.3.0"
    }
  }
}

provider "docker" {}

variable "db_password" {
  type      = string
  sensitive = true
}

resource "docker_image" "sqlserver" {
  name         = "mcr.microsoft.com/mssql/server:2025-latest"
  keep_locally = false
}

resource "docker_container" "sqlserver" {
  image    = docker_image.sqlserver.image_id
  name     = "sqlserver"
  hostname = "sqlserver"

  ports {
    internal = 1433
    external = 1433
  }

  env = [
    "ACCEPT_EULA=Y",
    "MSSQL_SA_PASSWORD=${var.db_password}",
  ]
}
