
locals {

  ccm = sort(flatten([
    "VM.Audit",
    var.ccm_feature_network_agent ? [
      "VM.GuestAgent.Audit"
    ] : [],
  ]))

  csi = sort(flatten([
    "VM.Audit",
    "VM.Config.Disk",
    "Datastore.Allocate",
    "Datastore.AllocateSpace",
    "Datastore.Audit",
    var.csi_feature_zfsreplication ? [
      "VM.Allocate",
      "VM.Clone",
      "VM.Config.CPU",
      "VM.Config.HWType",
      "VM.Config.Memory",
      "VM.Config.Options",
      "VM.Migrate",
      "VM.Replicate",
      "VM.PowerMgmt"
    ] : [],
  ]))

  karpenter = sort(flatten([
    "Sys.Audit",
    "Sys.AccessNetwork",
    "SDN.Audit",
    "SDN.Use",
    "VM.Audit",
    "VM.Allocate",
    "VM.Clone",
    "VM.Config.CDROM",
    "VM.Config.CPU",
    "VM.Config.Memory",
    "VM.Config.Disk",
    "VM.Config.Network",
    "VM.Config.HWType",
    "VM.Config.Cloudinit",
    "VM.Config.Options",
    "VM.PowerMgmt",
    "Datastore.Allocate",
    "Datastore.AllocateSpace",
    "Datastore.AllocateTemplate",
    "Datastore.Audit",
    var.karpenter_feature_resource_mapping ? [
      "Mapping.Audit",
      "Mapping.Use"
    ] : [],
    var.karpenter_feature_pools ? [
      "Pool.Audit",
      "Pool.Allocate",
    ] : [],
  ]))
}

resource "proxmox_virtual_environment_role" "ccm" {
  count      = var.ccm ? 1 : 0
  role_id    = var.ccm_role_id
  privileges = local.ccm
}

resource "proxmox_virtual_environment_role" "csi" {
  count      = var.csi ? 1 : 0
  role_id    = var.csi_role_id
  privileges = local.csi
}

resource "proxmox_virtual_environment_role" "karpenter" {
  count      = var.karpenter ? 1 : 0
  role_id    = var.karpenter_role_id
  privileges = local.karpenter
}
