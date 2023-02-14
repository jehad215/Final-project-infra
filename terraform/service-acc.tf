resource "google_service_account" "new-svc" {
  account_id = "new-svc"
  project = "jehad-iti"
}

resource "google_project_iam_binding" "new-svc-iam" {
  project = "jehad-iti"
  role    = "roles/container.admin"
  members = [
  "serviceAccount:${google_service_account.new-svc.email}"
  ]
}