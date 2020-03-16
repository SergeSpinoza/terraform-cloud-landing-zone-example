### network-app-team-1
resource "google_compute_network" "network_1" {
  name                    = "network-app-team-1"
  project                 = var.project
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet_app_team_1_dev" {
  project       = var.project
  name          = "subnet-app-team-1-dev"
  region        = "us-east1"
  ip_cidr_range = "192.168.0.0/24"
  network       = google_compute_network.network_1.self_link
  depends_on    = [google_compute_network.network_1]
}

resource "google_compute_subnetwork" "subnet_app_team_1_prod" {
  project       = var.project
  name          = "subnet-app-team-1-prod"
  region        = "us-east1"
  ip_cidr_range = "192.168.1.0/24"
  network       = google_compute_network.network_1.self_link
  depends_on    = [google_compute_network.network_1]
}

# Firewall
resource "google_compute_firewall" "network_1_allow_proxy_from_inside" {
  project = var.project
  name    = "network-1-allow-proxy-from-inside"
  network = google_compute_network.network_1.self_link

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  direction     = "INGRESS"
  source_ranges = ["10.0.0.0/8"]
  depends_on    = [google_compute_network.network_1]
}

resource "google_compute_firewall" "network_1_allow_dns_from_all" {
  project = var.project
  name    = "network-1-allow-dns-from-all"
  network = google_compute_network.network_1.self_link

  allow {
    protocol = "tcp"
    ports    = ["53"]
  }

  allow {
    protocol = "udp"
    ports    = ["53"]
  }

  direction          = "EGRESS"
  destination_ranges = ["8.8.8.8/32"]
  depends_on         = [google_compute_network.network_1]
}


### network-app-team-2
resource "google_compute_network" "network_2" {
  name                    = "network-app-team-2"
  project                 = var.project
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet_app_team_2_dev" {
  project       = var.project
  name          = "subnet-app-team-2-dev"
  region        = "us-east1"
  ip_cidr_range = "192.168.2.0/24"
  network       = google_compute_network.network_2.self_link
  depends_on    = [google_compute_network.network_2]
}

resource "google_compute_subnetwork" "subnet_app_team_2_prod" {
  project       = var.project
  name          = "subnet-app-team-2-prod"
  region        = "us-east1"
  ip_cidr_range = "192.168.3.0/24"
  network       = google_compute_network.network_2.self_link
  depends_on    = [google_compute_network.network_2]
}

# Firewall
resource "google_compute_firewall" "network_2_allow_proxy_from_inside" {
  project = var.project
  name    = "network-2-allow-proxy-from-inside"
  network = google_compute_network.network_2.self_link

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  direction     = "INGRESS"
  source_ranges = ["10.0.0.0/8"]
  depends_on    = [google_compute_network.network_2]
}

resource "google_compute_firewall" "network_2_allow_dns_from_all" {
  project = var.project
  name    = "network-2-allow-dns-from-all"
  network = google_compute_network.network_2.self_link

  allow {
    protocol = "tcp"
    ports    = ["53"]
  }

  allow {
    protocol = "udp"
    ports    = ["53"]
  }

  direction          = "EGRESS"
  destination_ranges = ["8.8.8.8/32"]
  depends_on         = [google_compute_network.network_2]
}

