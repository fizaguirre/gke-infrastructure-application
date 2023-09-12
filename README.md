## Application deployment in GKE

Terraform reads provider configuration in the plan step, in order to guarantee consistency. This configuration is deploying 2 modules, one that creates the GKE cluster (base-infrastructure) and another one to deploy an application and load balancer (application-stack). The second module, application-stack, needs to have the kubernetes provider configured based on the kube_config file generated in the first module, base-infrastructure. In order to deploy the configuration without errors apply the configuration in 2 steps:
1. Deploy the base infrastructure running the plan phase targeting the base-infrastructure module
    - $ terraform plan -target="module.base-infrastructure" ...
2. Deploy the application and load balancer configurations running a normal terraform plan and apply