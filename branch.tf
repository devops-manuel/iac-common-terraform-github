resource "github_branch" "development" {
  repository = github_repository.repo_github.name
  branch     = "dev"
}

resource "github_branch" "qa" {
  repository = github_repository.repo_github.name
  branch     = "qa"
}

resource "github_branch_protection" "branch_dev" {
  repository_id    = github_repository.repo_github.id
  pattern          = "main"
  enforce_admins   = true
  allows_deletions = true
}
