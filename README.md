<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0, < 2.0 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | 0.133.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.133.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vm1"></a> [vm1](#module\_vm1) | git::ssh://git@github.com/Palit-Invalid/yandex-instance.git | v0.0.1 |
| <a name="module_vm2"></a> [vm2](#module\_vm2) | git::ssh://git@github.com/Palit-Invalid/yandex-instance.git | v0.0.1 |

## Resources

| Name | Type |
|------|------|
| [yandex_alb_backend_group.test-backend-group](https://registry.terraform.io/providers/yandex-cloud/yandex/0.133.0/docs/resources/alb_backend_group) | resource |
| [yandex_alb_http_router.tf-router](https://registry.terraform.io/providers/yandex-cloud/yandex/0.133.0/docs/resources/alb_http_router) | resource |
| [yandex_alb_load_balancer.test-balancer](https://registry.terraform.io/providers/yandex-cloud/yandex/0.133.0/docs/resources/alb_load_balancer) | resource |
| [yandex_alb_target_group.test-target-group](https://registry.terraform.io/providers/yandex-cloud/yandex/0.133.0/docs/resources/alb_target_group) | resource |
| [yandex_alb_virtual_host.my-virtual-host](https://registry.terraform.io/providers/yandex-cloud/yandex/0.133.0/docs/resources/alb_virtual_host) | resource |
| [yandex_vpc_network.skillfactory](https://registry.terraform.io/providers/yandex-cloud/yandex/0.133.0/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.subnet1](https://registry.terraform.io/providers/yandex-cloud/yandex/0.133.0/docs/resources/vpc_subnet) | resource |
| [yandex_vpc_subnet.subnet2](https://registry.terraform.io/providers/yandex-cloud/yandex/0.133.0/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_token"></a> [token](#input\_token) | Token for access to yandex cloud | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_internal_ip_address_vm1"></a> [internal\_ip\_address\_vm1](#output\_internal\_ip\_address\_vm1) | n/a |
| <a name="output_internal_ip_address_vm2"></a> [internal\_ip\_address\_vm2](#output\_internal\_ip\_address\_vm2) | n/a |
<!-- END_TF_DOCS -->
