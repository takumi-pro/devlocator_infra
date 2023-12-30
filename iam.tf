# resource "google_iam_workload_identity_pool" "github_actions" {
#   project                   = var.project
#   workload_identity_pool_id = "github-actions-oidc"
# }

# resource "google_iam_workload_identity_pool_provider" "github_actions" {
#   project                            = var.project
#   workload_identity_pool_provider_id = "github-actions-oidc-provider"
#   workload_identity_pool_id          = google_iam_workload_identity_pool.github_actions.workload_identity_pool_id
#   attribute_condition                = "\"takumi-pro/devlocator_backend\" == assertion.repository"

#   oidc {
#     issuer_uri = "https://token.actions.githubusercontent.com"
#   }

#   attribute_mapping = {
#     "google.subject"       = "assertion.sub"
#     "attribute.repository" = "assertion.repository"
#   }
# }

# resource "google_service_account_iam_member" "github_actions_iam_workload_identity_user" {
#   service_account_id = "projects/${var.project}/serviceAccounts/devlocator@${var.project}.iam.gserviceaccount.com"
#   role               = "roles/iam.workloadIdentityUser"
#   member             = "principal://iam.googleapis.com/${google_iam_workload_identity_pool.github_actions.name}/subject/repo:takumi-pro/devlocator_backend"
# }