# Terraform BootCamp Week 1

## Root Module Structure

Our root module structure is as follows
```
PROJECT_ROOT
│
├── main.tf                   # everything else
├── variables.tf              # stores the structure of input variables
├── terraform.tfvars          # the data of variables we want to load into our terraform project
├── providers.tf              # define required providers
├── outputs.tf                # stores our outputs
└── README.md                 # required for root modules
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)
