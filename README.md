# Terraform module for Proxmox VE

Proxmox roles and permissions vary depending on the Proxmox VE version you are using.
To simplify preparing your environment for Kubernetes projects, this module provides predefined roles tailored to specific Proxmox VE versions.

The Terraform module follows the same versioning scheme as Proxmox VE, making it easy to select the module version that matches your Proxmox VE installation.

This Terraform module allows you to manage Proxmox roles for projects:
* [Proxmox CCM](https://github.com/sergelogvinov/proxmox-cloud-controller-manager)
* [Proxmox CSI](https://github.com/sergelogvinov/proxmox-csi-plugin)
* [Karpenter Proxmox](https://github.com/sergelogvinov/karpenter-provider-proxmox)

## Usage

```hcl
module "roles" {
  source = "github.com/sergelogvinov/terraform-proxmox-kubernetes-roles"

  tokens = true
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | >= 0.83.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | >= 0.83.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [proxmox_virtual_environment_role.ccm](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_role) | resource |
| [proxmox_virtual_environment_role.csi](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_role) | resource |
| [proxmox_virtual_environment_role.karpenter](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_role) | resource |
| [proxmox_virtual_environment_user.kubernetes](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_user) | resource |
| [proxmox_virtual_environment_user_token.ccm](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_user_token) | resource |
| [proxmox_virtual_environment_user_token.csi](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_user_token) | resource |
| [proxmox_virtual_environment_user_token.karpenter](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_user_token) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ccm"></a> [ccm](#input\_ccm) | Enable Kubernetes Cloud Controller Manager (CCM) role creation | `bool` | `true` | no |
| <a name="input_ccm_feature_network_agent"></a> [ccm\_feature\_network\_agent](#input\_ccm\_feature\_network\_agent) | Enable get network IPs through guest agent for CCM | `bool` | `false` | no |
| <a name="input_ccm_role_id"></a> [ccm\_role\_id](#input\_ccm\_role\_id) | Role ID for the Kubernetes CCM | `string` | `"Kubernetes-CCM"` | no |
| <a name="input_csi"></a> [csi](#input\_csi) | Enable Kubernetes CSI role creation | `bool` | `true` | no |
| <a name="input_csi_feature_zfsreplication"></a> [csi\_feature\_zfsreplication](#input\_csi\_feature\_zfsreplication) | Enable ZFS replication feature for CSI | `bool` | `false` | no |
| <a name="input_csi_role_id"></a> [csi\_role\_id](#input\_csi\_role\_id) | Role ID for the Kubernetes CSI | `string` | `"Kubernetes-CSI"` | no |
| <a name="input_karpenter"></a> [karpenter](#input\_karpenter) | Enable Kubernetes Karpenter role creation | `bool` | `true` | no |
| <a name="input_karpenter_feature_pools"></a> [karpenter\_feature\_pools](#input\_karpenter\_feature\_pools) | Enable pool management feature for Karpenter for templated VMs | `bool` | `false` | no |
| <a name="input_karpenter_feature_resource_mapping"></a> [karpenter\_feature\_resource\_mapping](#input\_karpenter\_feature\_resource\_mapping) | Enable resource mapping feature for Karpenter | `bool` | `false` | no |
| <a name="input_karpenter_role_id"></a> [karpenter\_role\_id](#input\_karpenter\_role\_id) | Role ID for the Kubernetes Karpenter | `string` | `"Kubernetes-Karpenter"` | no |
| <a name="input_tokens"></a> [tokens](#input\_tokens) | Create user tokens for the roles | `bool` | `false` | no |
| <a name="input_username"></a> [username](#input\_username) | Proxmox user to assign the roles to | `string` | `"kubernetes"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ccm_role_id"></a> [ccm\_role\_id](#output\_ccm\_role\_id) | Role ID of the Kubernetes CCM |
| <a name="output_ccm_token_id"></a> [ccm\_token\_id](#output\_ccm\_token\_id) | Token ID of the Kubernetes CCM |
| <a name="output_ccm_token_secret"></a> [ccm\_token\_secret](#output\_ccm\_token\_secret) | Token secret of the Kubernetes CCM |
| <a name="output_csi_role_id"></a> [csi\_role\_id](#output\_csi\_role\_id) | Role ID of the Kubernetes CSI |
| <a name="output_csi_token_id"></a> [csi\_token\_id](#output\_csi\_token\_id) | Token ID of the Kubernetes CSI |
| <a name="output_csi_token_secret"></a> [csi\_token\_secret](#output\_csi\_token\_secret) | Token secret of the Kubernetes CSI |
| <a name="output_karpenter_role_id"></a> [karpenter\_role\_id](#output\_karpenter\_role\_id) | Role ID of the Kubernetes Karpenter |
| <a name="output_karpenter_token_id"></a> [karpenter\_token\_id](#output\_karpenter\_token\_id) | Token ID of the Kubernetes Karpenter |
| <a name="output_karpenter_token_secret"></a> [karpenter\_token\_secret](#output\_karpenter\_token\_secret) | Token secret of the Kubernetes Karpenter |
<!-- END_TF_DOCS -->