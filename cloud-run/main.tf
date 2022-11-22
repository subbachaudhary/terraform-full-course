provider "google" {
  project     = "wesionaryteam-practice-account"
  region      = "us-central1"
}
resource "google_cloud_run_service" "my-svc" {
  name     = "my-svc"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

}
resource "google_cloud_run_service_iam_policy" "policy" {
  location    = google_cloud_run_service.my-svc.location
  service     = google_cloud_run_service.my-svc.name
  policy_data = data.google_iam_policy.admin.policy_data
}
data "google_iam_policy" "admin" {
  binding {
    role = "roles/viewer"
    members = [
      "allUsers",
    ]
  }
}

/* resource "google_cloud_run_domain_mapping" "my-domain" {
  location = "us-central1"
  name     = "selftechnepal.com"

  metadata {
    namespace = "wesionaryteam-practice-account"
  }

  spec {
    route_name = google_cloud_run_service.my-svc.name
  }
} */