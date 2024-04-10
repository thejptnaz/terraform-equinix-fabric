variable "connection_name" {
  description = "Connection name. An alpha-numeric 24 characters string which can include only hyphens and underscores"
  type        = string
}
variable "secondary_connection_name" {
  description = "Secondary Connection name. An alpha-numeric 24 characters string which can include only hyphens and underscores"
  type        = string
  default     = ""
}
variable "connection_type" {
  description = "Defines the connection type like VG_VC, EVPL_VC, EPL_VC, EC_VC, IP_VC, ACCESS_EPL_VC, EVPLAN_VC"
  type        = string
}
variable "notifications_type" {
  description = "Notification Type - ALL is the only type currently supported"
  type        = string
  default     = "ALL"
}
variable "notifications_emails" {
  description = "Array of contact emails"
  type        = list(string)
}
variable "project_id" {
  description = "Subscriber-assigned project ID"
  type        = string
  default     = ""
}
variable "bandwidth" {
  description = "Connection bandwidth in Mbps"
  type        = number
}
variable "secondary_bandwidth" {
  description = "Connection bandwidth in Mbps"
  type        = number
  default     = 0
}
variable "purchase_order_number" {
  description = "Purchase order number"
  type        = string
  default     = ""
}
variable "aside_vd_type" {
  description = "Virtual Device type - EDGE"
  type        = string
  default     = ""
}
variable "aside_vd_uuid" {
  description = "Virtual Device UUID"
  type        = string
  default     = ""
}
variable "aside_interface_type" {
  description = "Virtual Device Interface type - CLOUD, NETWORK"
  type        = string
  default     = ""
}
variable "aside_interface_id" {
  description = "Interface Id"
  type        = number
  default     = null
}
variable "zside_ap_type" {
  description = "Access point type - VD, SP, COLO, CLOUD_ROUTER, NETWORK"
  type        = string
  default     = ""
}
variable "zside_ap_authentication_key" {
  description = "Authentication key for provider based connections"
  type        = string
  default     = ""
  sensitive   = true
}
variable "zside_ap_profile_type" {
  description = "Service profile type - L2_PROFILE, L3_PROFILE, ECIA_PROFILE, ECMC_PROFILE"
  type        = string
  default     = ""
}
variable "zside_location" {
  description = "Access point metro code"
  type        = string
  default     = ""
}
variable "zside_sp_name" {
  description = "Equinix Service Profile Name"
  type        = string
  default     = ""
}
variable "zside_port_name" {
  description = "Equinix Z-Side Port Name"
  type        = string
  default     = ""
}
variable "zside_seller_region" {
  description = "Access point seller region"
  type        = string
  default     = ""
}
variable "zside_vlan_tag" {
  description = "VLan Tag information for DOT1Q connections, and the outer VLan tag for QINQ connections"
  type        = string
  default     = ""
}
variable "zside_vlan_inner_tag" {
  description = "Inner VLan tag for QINQ connections"
  type        = string
  default     = ""
}
variable "zside_peering_type" {
  description = "Zside Access Point Peering type. Available values; PRIVATE, MICROSOFT, PUBLIC, MANUAL"
  type        = string
  default     = ""
}
variable "zside_service_token_uuid" {
  description = "Service Token UUID"
  type        = string
  default     = ""
}
variable "zside_network_uuid" {
  description = "Equinix Network UUID"
  default     = ""
}
variable "additional_info" {
  description = "Additional info parameters. It's a list of maps containing 'key' and 'value' keys with their corresponding values."
  type        = list(object({ key = string, value = string }))
  default     = []
  sensitive   = true
}
