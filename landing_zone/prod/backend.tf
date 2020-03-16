terraform {
  backend "gcs" {
    bucket = "terraform-ci-storage-bucket-01"
    prefix = "terraform/prod"
  }
}

