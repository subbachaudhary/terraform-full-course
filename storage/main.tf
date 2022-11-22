provider "google" {
  project     = "subba-project-367714"
  region      = "us-east1"
  credentials = "key.json"
}
resource "google_storage_bucket" "my-bucket" {
  name          = "subba-test-bucket"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

}
resource "google_storage_bucket_object" "subba-obj-test" {
  name   = "my-obj-subba"
  source = "subba/index.txt"
  bucket = "subba-test-bucket"
}
resource "google_storage_bucket_access_control" "public_rule" {
  bucket = google_storage_bucket.my-bucket.name
  role   = "READER"
  entity = "allUsers"
}

