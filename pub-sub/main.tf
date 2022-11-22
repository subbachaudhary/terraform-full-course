provider "google" {
  project     = "wesionaryteam-practice-account"
  region      = "us-central1"
}
resource "google_pubsub_topic" "subba-topic" {
  name = "subba-topic"

  labels = {
    env = "dev"
  }

  message_retention_duration = "86600s"
}
resource "google_pubsub_subscription" "subba-subscription" {
  name  = "example-subscription"
  topic = google_pubsub_topic.subba-topic.name

  ack_deadline_seconds = 20

  labels = {
    env = "dev"
  }

  push_config {
    push_endpoint = "https://selftechnepal.com/push"

    attributes = {
      x-goog-version = "v1"
    }
  }
}