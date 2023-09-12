module "base_infrastructure" {
  source = "./base-infrastructure"

  gke_kubeconfig_path = var.kubeconfig_path

  gcp_region               = "us-central1"
  gcp_project              = var.gcp_project
  gke_nodepool_location    = "us-central1"
  app_cert_folder_output   = "./shared-outputs"
  gke_nodes_replicas_count = 1

  cert_cn           = var.cert_cn
  cert_country      = var.cert_country
  cert_locality     = var.cert_locality
  cert_organization = var.cert_organization
  cert_ou           = var.cert_ou
}

module "app" {
  source     = "./application-stack"
  depends_on = [module.base_infrastructure]


  gke_service_name             = "appsvc"
  gke_service_target_http_port = 8080
  ssl_certificate            = module.base_infrastructure._certificate
  rsa_private_key            = module.base_infrastructure._certificate_key
  application_replicas_count = 3
}

output "appclusterendpoint" {
  value = module.base_infrastructure.appclusterendpoint
}

output "gke_info" {
  value = module.base_infrastructure.gke_info
}

output "certificates" {
  value = module.base_infrastructure.certificates
}

output "app_endpoint" {
  value = module.app.app_endpoint
}