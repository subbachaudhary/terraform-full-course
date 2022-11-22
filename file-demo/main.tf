provider "google" {
  project     = "subba-project-367714"
  region      = "us-east1"
}

resource "local_file" "test" {
    content  = "hello subba!"
    filename = "hello.txt"
}