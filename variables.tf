variable "project" { }

variable "credentials_file" { }

variable "region" {
  default = "asia-northeast1"
}

variable "repository_id_app" {
  default = "devlocator-app"
}

variable "repository_id_batch" {
  default = "devlocator-batch"
}

variable "image" {
  default = "devlocator"
}