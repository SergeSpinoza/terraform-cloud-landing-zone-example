output "network_1" {
  value = "${google_compute_network.network_1.self_link}"
}

output "subnet_app_team_1_dev" {
  value = "${google_compute_subnetwork.subnet_app_team_1_dev.self_link}"
}

output "subnet_app_team_1_prod" {
  value = "${google_compute_subnetwork.subnet_app_team_1_prod.self_link}"
}

output "network_2" {
  value = "${google_compute_network.network_2.self_link}"
}

output "subnet_app_team_2_dev" {
  value = "${google_compute_subnetwork.subnet_app_team_2_dev.self_link}"
}

output "subnet_app_team_2_prod" {
  value = "${google_compute_subnetwork.subnet_app_team_2_prod.self_link}"
}

