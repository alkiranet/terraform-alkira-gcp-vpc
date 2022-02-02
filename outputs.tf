output "vpc_name" {
  description = "GCP VPC name"
  value       = google_compute_network.vpc.name
}

output "vpc_id" {
  description = "GCP VPC ID"
  value       = google_compute_network.vpc.id
}

output "subnet" {
  description = "GCP subnet configuration"
  value = [
    for subnet in google_compute_subnetwork.gcp_subnet : {
      subnet_id   = subnet.id
      subnet_name = subnet.name
      subnet_cidr = subnet.ip_cidr_range
    }
  ]
}

output "connector_id" {
  description = "ID of the connector"
  value       = alkira_connector_gcp_vpc.connector.id
}

output "connector_name" {
  description = "Name of the connector"
  value       = alkira_connector_gcp_vpc.connector.name
}

output "connector_cxp" {
  description = "CXP that connector was provisioned in"
  value       = alkira_connector_gcp_vpc.connector.cxp
}

output "connector_size" {
  description = "Size of the connector"
  value       = alkira_connector_gcp_vpc.connector.size
}

output "connector_segment_id" {
  description = "Segment that connector was placed in"
  value       = alkira_connector_gcp_vpc.connector.segment_id
}

output "connector_group" {
  description = "Group that connector was added to"
  value       = alkira_connector_gcp_vpc.connector.group
}