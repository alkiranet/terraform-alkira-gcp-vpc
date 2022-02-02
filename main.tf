# Local vars
locals {

  gcp_subnets = {
    for subnet in var.subnets :
    try("${subnet.name}/${subnet.cidr}/${subnet.region}") => subnet
  }

}

/*
Alkira data sources
https://registry.terraform.io/providers/alkiranet/alkira/latest/docs
*/

data "alkira_segment" "segment" {
  name = var.segment
}

data "alkira_group" "group" {
  name = var.group
}

data "alkira_billing_tag" "tag" {
  name = var.billing_tag
}

data "alkira_credential" "credential" {
  name = var.credential
}

resource "google_compute_network" "vpc" {
  name                    = var.name
  project                 = var.project_id
  routing_mode            = var.routing_mode
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "gcp_subnet" {

  for_each = local.gcp_subnets

  project                  = var.project_id
  name                     = each.value.name
  ip_cidr_range            = each.value.cidr
  network                  = google_compute_network.vpc.id
  private_ip_google_access = true
}

resource "alkira_connector_gcp_vpc" "connector" {

  # GCP values
  name         = var.name
  gcp_vpc_name = var.name
  gcp_region   = var.gcp_region
  gcp_vpc_id   = google_compute_network.vpc.id

  # CXP values
  cxp             = var.cxp
  size            = var.size
  group           = data.alkira_group.group.name
  segment_id      = data.alkira_segment.segment.id
  billing_tag_ids = [data.alkira_billing_tag.tag.id]
  credential_id   = data.alkira_credential.credential.id

}
