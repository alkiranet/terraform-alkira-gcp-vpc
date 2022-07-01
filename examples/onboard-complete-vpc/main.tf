module "gcp_vpc" {
  source = "alkiranet/gcp-vpc/alkira"

  name       = "vpc-east"
  project_id = "project"
  region     = "us-east4"

  subnets = [
    {
      name   = "app-subnet-a"
      cidr   = "10.10.1.0/24"
      region = "us-east4"
    },

    {
      name   = "app-subnet-b"
      cidr   = "10.10.2.0/24"
      region = "us-east4"
    }
  ]

  cxp          = "US-EAST-2"
  segment      = "corporate"
  group        = "non-prod"
  billing_tags = ["cloud", "network"]
  credential   = "gcp-auth"

}