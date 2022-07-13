terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.26.1"
    }
  }

  required_version = "~> 1.2.4"
}

provider "github" {
  # Configuration options
}
