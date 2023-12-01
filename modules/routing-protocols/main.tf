resource "equinix_fabric_routing_protocol" "direct" {
  connection_uuid = var.connection_uuid
  name            = var.direct_rp_name
  type            = "DIRECT"
  direct_ipv4 {
    equinix_iface_ip = var.direct_equinix_ipv4_ip
  }
  direct_ipv6 {
    equinix_iface_ip = var.direct_equinix_ipv6_ip
  }
}

resource "equinix_fabric_routing_protocol" "bgp" {
  count = var.bgp_rp_name != "" ? 1 : 0
  depends_on = [
    equinix_fabric_routing_protocol.direct
  ]

  connection_uuid = var.connection_uuid
  name            = var.bgp_rp_name
  type            = "BGP"

  customer_asn = var.bgp_customer_asn

  bgp_ipv4 {
    enabled          = var.bgp_enabled_ipv4
    customer_peer_ip = var.bgp_customer_peer_ipv4
  }
  bgp_ipv6 {
    enabled          = var.bgp_enabled_ipv6
    customer_peer_ip = var.bgp_customer_peer_ipv6
  }
}
