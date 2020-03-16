module "startup-script-lib" {
  source = "git::https://github.com/terraform-google-modules/terraform-google-startup-scripts.git?ref=v0.1.0"
}

resource "google_compute_instance" "proxy_app_team_2_prod" {
  project                   = var.project
  name                      = "proxy-app-team-2-prod"
  machine_type              = "f1-micro"
  zone                      = "us-east1-c"
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts"
      size  = "10"
      type  = "pd-ssd"
    }
  }

  network_interface {
    subnetwork = var.subnetwork
    access_config {
      nat_ip = ""
    }
  }

  metadata = {
    startup-script        = "${module.startup-script-lib.content}"
    startup-script-custom = "sudo apt-get update && sudo apt-get install -y nginx"
  }

}

