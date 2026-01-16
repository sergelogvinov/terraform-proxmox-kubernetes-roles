
output "ccm_role_id" {
  description = "Role ID of the Kubernetes CCM"
  value       = var.ccm_role_id
}

output "csi_role_id" {
  description = "Role ID of the Kubernetes CSI"
  value       = var.csi_role_id
}

output "karpenter_role_id" {
  description = "Role ID of the Kubernetes Karpenter"
  value       = var.karpenter_role_id
}
