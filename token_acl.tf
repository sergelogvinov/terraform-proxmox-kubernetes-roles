

resource "proxmox_virtual_environment_acl" "ccm" {
  count = local.create_tokens && var.ccm ? 1 : 0

  token_id = proxmox_virtual_environment_user_token.ccm[0].id
  role_id  = proxmox_virtual_environment_role.ccm[0].role_id

  path      = "/"
  propagate = true
}

resource "proxmox_virtual_environment_acl" "csi" {
  count = local.create_tokens && var.csi ? 1 : 0

  token_id = proxmox_virtual_environment_user_token.csi[0].id
  role_id  = proxmox_virtual_environment_role.csi[0].role_id

  path      = "/"
  propagate = true
}

resource "proxmox_virtual_environment_acl" "karpenter" {
  count = local.create_tokens && var.karpenter ? 1 : 0

  token_id = proxmox_virtual_environment_user_token.karpenter[0].id
  role_id  = proxmox_virtual_environment_role.karpenter[0].role_id

  path      = "/"
  propagate = true
}
