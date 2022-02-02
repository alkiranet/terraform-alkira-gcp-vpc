terraform {
  required_version = ">= 0.13.1"

  required_providers {

    alkira = {
      source  = "alkiranet/alkira"
      version = ">= 0.8.0"
    }

    google = {
      source  = "hashicorp/google"
      version = "<5.0,>= 2.12"
    }

  }
}
