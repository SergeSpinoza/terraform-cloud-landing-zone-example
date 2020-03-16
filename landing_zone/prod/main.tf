provider "google-beta" {
  project = var.project
  region  = var.region
  # credentials = "../landing-zone-core.json"
}

provider "google" {
  project     = var.project
  region      = var.region
  credentials = "../landing-zone-core.json"
}

resource "google_folder" "tests_folder" {
  display_name = "tests-2"
  parent       = "organizations/1087055337970"
}

module "projects" {
  source          = "../modules/projects"
  project         = "test-proj-56456325555"
  folder_id       = google_folder.tests_folder.name
  billing_account = "016E5D-97DF7E-5BCBC4"
  apis_list       = ["iam.googleapis.com", "compute.googleapis.com", "deploymentmanager.googleapis.com", "pubsub.googleapis.com", "container.googleapis.com"]
  sa_roles_list   = ["roles/editor", "roles/viewer"]
}

module "networks" {
  source  = "../modules/networks"
  project = module.projects.created_project
}

module "apps" {
  source     = "../modules/apps"
  project    = module.projects.created_project
  subnetwork = module.networks.subnet_app_team_2_prod
}

