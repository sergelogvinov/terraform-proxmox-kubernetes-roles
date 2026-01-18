
output "ccm_role_id" {
  description = "Role ID of the Kubernetes CCM"
  value       = var.ccm_role_id
}
output "ccm_token_id" {
  description = "Token ID of the Kubernetes CCM"
  value       = var.ccm ? proxmox_virtual_environment_user_token.ccm[0].id : ""
}
output "ccm_token_secret" {
  description = "Token secret of the Kubernetes CCM"
  sensitive   = true
  value       = var.ccm ? split("=", proxmox_virtual_environment_user_token.ccm[0].value)[1] : ""
}

output "csi_role_id" {
  description = "Role ID of the Kubernetes CSI"
  value       = var.csi_role_id
}
output "csi_token_id" {
  description = "Token ID of the Kubernetes CSI"
  value       = var.csi ? proxmox_virtual_environment_user_token.csi[0].id : ""
}
output "csi_token_secret" {
  description = "Token secret of the Kubernetes CSI"
  sensitive   = true
  value       = var.csi ? split("=", proxmox_virtual_environment_user_token.csi[0].value)[1] : ""
}

output "karpenter_role_id" {
  description = "Role ID of the Kubernetes Karpenter"
  value       = var.karpenter_role_id
}
output "karpenter_token_id" {
  description = "Token ID of the Kubernetes Karpenter"
  value       = var.karpenter ? proxmox_virtual_environment_user_token.karpenter[0].id : ""
}
output "karpenter_token_secret" {
  description = "Token secret of the Kubernetes Karpenter"
  sensitive   = true
  value       = var.karpenter ? split("=", proxmox_virtual_environment_user_token.karpenter[0].value)[1] : ""
}
