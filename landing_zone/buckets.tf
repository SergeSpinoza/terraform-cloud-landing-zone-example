provider "google" {
  project = var.project
  region  = var.region
  credentials = "./landing-zone-service-account.json"
}


resource "google_storage_bucket" "terraform_ci_storage_bucket" {
  name          = "terraform-ci-storage-bucket-01"
  project       = var.project
  location      = length(var.bucket_01_location) > 0 ? var.bucket_01_location : var.region
  storage_class = var.bucket_01_storage_class

  versioning {
    enabled = var.bucket_01_versioning
  }

  lifecycle_rule {
    action {
      type          = var.bucket_01_action_type
      storage_class = var.bucket_01_action_storage_class
    }

    condition {
      age            = var.bucket_01_condition_age
      created_before = var.bucket_01_condition_created_before
      matches_storage_class = var.bucket_01_condition_storage_class
      num_newer_versions    = var.bucket_01_condition_num_newer_versions
    }
  }
}

