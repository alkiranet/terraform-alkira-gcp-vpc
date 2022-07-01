variable "project_id" {
  description = "GCP project ID that owns or contains calling entity"
  type        = string
  sensitive   = true
}

variable "enabled" {
  description = "Status of connector; Default is true"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of cloud network and Alkira connector"
  type        = string
}

variable "subnets" {
  description = "Subnets to create for cloud network"
  type        = list(map(string))
}

variable "routing_mode" {
  description = "VPC routing mode"
  type        = string
  default     = "GLOBAL"
}

variable "region" {
  description = "GCP region for routing Alkira"
  type        = string
}

variable "billing_tags" {
  description = "List of billing tag names to apply to connector"
  type        = list(string)
  default     = []
}

variable "credential" {
  description = "Alkira - cloud credential"
  type        = string
}

variable "segment" {
  description = "Alkira - segment to add connector to"
  type        = string
}

variable "group" {
  description = "Alkira - group to add connector to"
  type        = string
}

variable "cxp" {
  description = "Alkira - CXP to add connector to"
  type        = string
}

variable "size" {
  description = "Alkira - connector size"
  type        = string
  default     = "SMALL"
}
