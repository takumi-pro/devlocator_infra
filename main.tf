terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file)
  project = "sigma-method-409207"
  region  = var.region
}

resource "google_artifact_registry_repository" "devlocator_app_repository" {
  location      = var.region
  repository_id = var.repository_id_app
  format        = "DOCKER"
  description   = "Docker repository"
}

// TODO: batch artifact registry