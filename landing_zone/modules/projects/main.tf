resource "google_project" "project" {

  name                = var.project
  project_id          = var.project
  folder_id           = var.folder_id
  billing_account     = var.billing_account
  auto_create_network = "false"
}

resource "google_project_service" "project" {
  for_each = toset(var.apis_list)

  project                    = google_project.project.name
  service                    = each.value
  disable_dependent_services = true

  depends_on = [google_project.project]
}

resource "google_service_account" "service_account" {
  account_id   = "cft-demo-sa-0"
  display_name = "Terraform-managed service account"
  project      = google_project.project.name
}

resource "google_service_account_iam_member" "service-account-iam" {
  for_each = toset(var.sa_roles_list)

  service_account_id = google_service_account.service_account.name
  role               = each.value
  member             = "serviceAccount:${google_service_account.service_account.email}"
}

