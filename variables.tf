variable "kubeconfig_path" {
  type        = string
  description = "Path to the kube config file"
}

variable "gcp_project" {
  type        = string
}

variable "cert_cn" {
  type        = string
}

variable "cert_country" {
  type        = string
}

variable "cert_locality" {
  type        = string
}

variable "cert_organization" {
  type        = string
}

variable "cert_ou" {
  type        = string
}