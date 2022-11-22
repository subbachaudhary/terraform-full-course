provider "google" {
  project     = "wesionaryteam-practice-account"
  region      = "us-east1"
}
resource "random_integer" "myinterger" {
    min = 10
    max = 50
}
output "integer" {
    value = random_integer.myinterger.result
  
}