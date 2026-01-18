
variable "username" {
  description = "Proxmox user to assign the roles to"
  type        = string
  default     = "kubernetes"
}

variable "tokens" {
  description = "Create user tokens for the roles"
  type        = bool
  default     = false
}

variable "ccm" {
  description = "Enable Kubernetes Cloud Controller Manager (CCM) role creation"
  type        = bool
  default     = true
}

variable "ccm_role_id" {
  description = "Role ID for the Kubernetes CCM"
  type        = string
  default     = "Kubernetes-CCM"
}

variable "ccm_feature_network_agent" {
  description = "Enable get network IPs through guest agent for CCM"
  type        = bool
  default     = false
}

variable "csi" {
  description = "Enable Kubernetes CSI role creation"
  type        = bool
  default     = true
}

variable "csi_role_id" {
  description = "Role ID for the Kubernetes CSI"
  type        = string
  default     = "Kubernetes-CSI"
}

variable "csi_feature_zfsreplication" {
  description = "Enable ZFS replication feature for CSI"
  type        = bool
  default     = false
}

variable "karpenter" {
  description = "Enable Kubernetes Karpenter role creation"
  type        = bool
  default     = true
}

variable "karpenter_role_id" {
  description = "Role ID for the Kubernetes Karpenter"
  type        = string
  default     = "Kubernetes-Karpenter"
}

variable "karpenter_feature_resource_mapping" {
  description = "Enable resource mapping feature for Karpenter"
  type        = bool
  default     = false
}

variable "karpenter_feature_pools" {
  description = "Enable pool management feature for Karpenter for templated VMs"
  type        = bool
  default     = false
}
