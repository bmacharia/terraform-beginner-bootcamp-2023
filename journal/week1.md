# Terraform BootCamp Week 1

## Fixing git Tags

[How to Delete Local and Remote Tags on Git](https://devconnected.com/how-to-delete-local-and-remote-tags-on-git/)

Delete a tag locally

```sh
git tag -d <tag_name>

```

Delete a tag Remotely
```sh
git push --delete origin tagname
```
To checkout the commit that you want to retag, grab the sha from your GitHub history

```sh
  git checkout <SHA> 
  git tag M.M.O
  git push --tags
  git checkout main
```

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

## Terraform and Input Variables

### Terraform Cloud Variables

In terraform we can set two kind of variables:
- Enviroment Variables - those you would set in your bash terminal eg. AWS credentials
- Terraform Variables - those that you would normally set in your tfvars file

We can set Terraform Cloud variables to be sensitive so they are not shown visibliy in the UI.

### Loading Terraform Input Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

### var flag
We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform -var user_ud="my-user_id"`

### var-file flag

- TODO: document this flag

### terraform.tvfars

This is the default file to load in terraform variables in blunk

### auto.tfvars

- TODO: document this functionality for terraform cloud

### order of terraform variables

- TODO: document which terraform variables takes presendence.



## Dealing With Configuration Drift

## What happens if we lose our state file?

If you lose your statefile, you most likley have to tear down all your cloud infrastructure manually.

You can use terraform port but it won't for all cloud resources. You need check the terraform providers documentation for which resources support import.

### Fix Missing Resources with Terraform Import

`terraform import aws_s3_bucket.bucket bucket-name`

[Terraform Import](https://developer.hashicorp.com/terraform/cli/import)
[AWS S3 Bucket Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)

### Fix Manual Configuration

If someone goes and delete or modifies cloud resource manually through ClickOps. 

If we run Terraform plan is with attempt to put our infrstraucture back into the expected state fixing Configuration Drift

## Fix Using Terraform Refresh

```sh
terraform apply -refresh-only -auto-approve
```

## Terraform Modules

### Terraform Module Structure

Best practice is to place modules in a `modules` directory when locally developing modules but you can name them whatever you want.

### Passing Input Variables

We can pass input variables into the module

The module has to declare these variables into to their own `variables.tf` file
```tf
  module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
```

### Modules Sources

Using the source we can import the module from various places eg:
- locally, Local path
- GitHub
- Terraform Registry

``` tf
  module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"

}

```

## Considerations when using ChatGPT to write Terraform

LLMs such as ChatGPT may not be trained on the the latest and most up to date data about Terraform.

As a result ChatGPT may output Terraform Code that may be depraceted and no londer supported

## Working with files in Terraform

### Fileexist Function
[fileexists](https://developer.hashicorp.com/terraform/language/functions/fileexists)

This is a built in Terraform function to check the existence of a file

```tf
  condition     = fileexists(var.error_html_filepath)

```

### Filemd5

[filemd5](https://developer.hashicorp.com/terraform/language/functions/filemd5)



### Path Variable

In Terraform there is a special variable called `path` that allows us to reference local paths:
- path.module = get the path for the current module
- path.root = get the path for the root module

[Special Path Variable](https://developer.hashicorp.com/terraform/language/expressions/references#filesystem-and-workspace-info)

```tf
resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = "${path.root}/public/index.html"

}
```

