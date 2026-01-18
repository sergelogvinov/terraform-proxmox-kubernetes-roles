
locals {
  create_tokens = var.username != "" && var.tokens && (var.ccm || var.csi || var.karpenter)
}

resource "proxmox_virtual_environment_user" "kubernetes" {
  count = local.create_tokens ? 1 : 0

  dynamic "acl" {
    for_each = compact([
      var.ccm ? proxmox_virtual_environment_role.ccm[0].role_id : "",
      var.csi ? proxmox_virtual_environment_role.csi[0].role_id : "",
      var.karpenter ? proxmox_virtual_environment_role.karpenter[0].role_id : "",
    ])
    content {
      path      = "/"
      propagate = true
      role_id   = acl.value
    }
  }

  comment = "Kubernetes user for CCM, CSI, and Karpenter roles"
  user_id = "${var.username}@pve"
}

resource "proxmox_virtual_environment_user_token" "ccm" {
  count = local.create_tokens && var.ccm ? 1 : 0

  comment    = "Kubernetes CCM"
  token_name = "ccm"
  user_id    = proxmox_virtual_environment_user.kubernetes[0].user_id
}

resource "proxmox_virtual_environment_user_token" "csi" {
  count = local.create_tokens && var.csi ? 1 : 0

  comment    = "Kubernetes CSI"
  token_name = "csi"
  user_id    = proxmox_virtual_environment_user.kubernetes[0].user_id
}

resource "proxmox_virtual_environment_user_token" "karpenter" {
  count = local.create_tokens && var.karpenter ? 1 : 0

  comment    = "Kubernetes Karpenter"
  token_name = "karpenter"
  user_id    = proxmox_virtual_environment_user.kubernetes[0].user_id
}
