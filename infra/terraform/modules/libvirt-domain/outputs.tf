output "instance_ip_addr" {
  description = "The IP address of the VM instance"
  value       = libvirt_domain.instance.*.network_interface.0.addresses
}
