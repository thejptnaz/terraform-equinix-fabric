provider "equinix" {
  client_id     = var.equinix_client_id
  client_secret = var.equinix_client_secret
}

data "equinix_fabric_market_place_subscription" "subscription" {
  uuid = var.marketplace_subscription_uuid
}

locals {
  entitlement = flatten([
    for entitlement in data.equinix_fabric_market_place_subscription.subscription.entitlements : [
      for asset in entitlement.asset : asset.package
    ]
  ])
}

resource "equinix_fabric_cloud_router" "create_fcr_marketplace_subscription"{
  name = var.fcr_name
  type = var.fcr_type
  notifications{
    type   = var.notifications_type
    emails = var.notifications_emails
  }
  order {
    purchase_order_number = var.purchase_order_number
  }
  location {
    metro_code = var.fcr_location
  }
  package {
    code = local.entitlement[1].code
  }
  project {
    project_id = var.project_id
  }
  marketplace_subscription{
    type = var.marketplace_subscription_type
    uuid = data.equinix_fabric_market_place_subscription.test.uuid
  }
}
