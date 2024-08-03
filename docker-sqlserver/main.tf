terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "sqlserver" {
  name         = "mcr.microsoft.com/mssql/server:2022-latest"
  keep_locally = false
}

resource "docker_container" "sqlserver" {
  image = docker_image.sqlserver.image_id
  name  = "sqlserver"
  hostname = "sqlserver"
  platform = "linux/amd64"
  ports {
    internal = 1433
    external = 1433
  }
   env = [
    "ACCEPT_EULA=Y",
    "MSSQL_SA_PASSWORD=P@ssw0rd123",
  ]
}
