provider "google" {
  project     = "wesionaryteam-practice-account"
  region      = "us-central1"
}
resource "google_sql_database_instance" "subba-mysql" {
  name             = "subba-mysql"
  region           = "us-central1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "false"
}
resource "google_sql_database" "my-database" {
  name     = "my-database"
  instance = google_sql_database_instance.subba-mysql.name
}
