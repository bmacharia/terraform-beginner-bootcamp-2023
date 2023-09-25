# Terraform Beginner Bootcamp 2023
- [Terraform Beginner Bootcamp 2023 - Week 0](#terraform-beginner-bootcamp-2023-week-0)
   * [Semantic Versioning ](#semantic-versioning)
   * [Install the Terraform CLI](#install-the-terraform-cli)
      + [Considerations with the Terraform CLI change](#considerations-with-the-terraform-cli-change)
      + [How to check Linux OS version](#how-to-check-linux-os-version)
      + [Considerations for Linux Distribution](#considerations-for-linux-distribution)
      + [Refactoring into BASH Scripts](#refactoring-into-bash-scripts)
         - [Shebang](#shebang)
         - [Execution Considerations](#execution-considerations)
         - [Linux Permissions Considerations](#linux-permissions-considerations)
      + [Github Lifecycle (Before, Init, Command)](#github-lifecycle-before-init-command)
      + [Working with Env Vars](#working-with-env-vars)
      + [env command](#env-command)
         - [Setting and Unsetting Env Vars](#setting-and-unsetting-env-vars)
         - [Printing Vars](#printing-vars)
         - [Scoping of Env Vars](#scoping-of-env-vars)
         - [Persisting Env Vars in Gitpod](#persisting-env-vars-in-gitpod)
      + [AWS CLI installation](#aws-cli-installation)
   * [Terraform Basics](#terraform-basics)
      + [Terraform Registry](#terraform-registry)
      + [Terraform Console](#terraform-console)
         - [Terraform Init](#terraform-init)
         - [Terraform Plan](#terraform-plan)
         - [Terraform Apply](#terraform-apply)
         - [Terraform destroy](#terraform-destroy)
      + [Terraform Lock Files](#terraform-lock-files)
      + [Terraform State Files](#terraform-state-files)
      + [Terraform Directory](#terraform-directory)
   * [Issues with Terraform Cloud login and Gitpod Workspace](#issues-with-terraform-cloud-login-and-gitpod-workspace)


## Semantic Versioning :mage:

This project is going to utilize semantic versioning for its tagging.
[semver.org](https://semver.org)

The general format:

**MAJOR.MINOR.PATCH**, eg. `1.0.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes
Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

## Install the Terraform CLI

### Considerations with the Terraform CLI change
The Terraform CLI installation installation instructions have changeds due to gpf keyring changes. So we needed to refer to the latest install CLI instructions via Terraform documentation and change the scripting for install

### How to check Linux OS version
Example of checking OS version

```
$ cat /etc/os-release

PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy


```

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Considerations for Linux Distribution

This project is built against Ubuntu. Please consider checking your Linux Distribution and change accordinly to distribution needs

### Refactoring into BASH Scripts

#### Shebang
A Shebang (prounced Sha-bang) tells the bash script what program that will interpet the script. eg. `#!/bin/bash`

ChatGPT recommended this format for bash `#!/usr/bin/env bash`

-  for portability for different OS distributions 
-  will search the user's PATH for the bash executable

While fixing the Terraform CLI gpg depreciation issues we notice that bash scripts steps were a considerable amount more to code. So I decided to create a bash script to install the Terraform CLI.

This bash script is locataed here: [./bin/install_terraform_cli](./bin/install_terrrafrom_cli.sh)
- This will keep the Gitpod Task file([.gitpod.yml](.gitpod.yml)) tidy
- This allows us an easier to debug and execute manually Terraform CLI install
- This will allow better portability for other projects that need to install the Terraform CLI

https://en.wikipedia.org/wiki/Shebang_(Unix)

#### Execution Considerations

When executing the bash script we can use the `./` shorthand notiation to execute the bash script.

eg. `./bin/install_terraform_cli`

If we are using a script in .gitpod.yml  we need to point the script to a program to interpert it.

eg. `source ./bin/install_terraform_cli`

#### Linux Permissions Considerations

In order to make our bash scripts executable we need to change linux permission for the fix to be exetuable at the user mode.

```sh
chmod u+x ./bin/install_terraform_cli
```

alternatively:

```sh
chmod 744 ./bin/install_terraform_cli
```

https://en.wikipedia.org/wiki/Chmod

### Github Lifecycle (Before, Init, Command)

We need to be careful when using the Init because it will not rerun if we restart an existing workspace.

https://www.gitpod.io/docs/configure/workspaces/tasks



### Working with Env Vars

### env command

We can list out all Enviroment Variables (Env Vars) using the `env` command

We can filter specific env vars using grep eg. `env | grep AWS_`

#### Setting and Unsetting Env Vars

In the terminal we can set using `export HELLO='world`

In the terrminal we unset using `unset HELLO`

We can set an env var temporarily when just running a command

```sh
HELLO='world' ./bin/print_message
```
Within a bash script we can set env without writing export eg.

```sh
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
```

#### Printing Vars

We can print an env var using echo eg. `echo $HELLO`

#### Scoping of Env Vars

When you open up new bash terminals in VSCode it will not be aware of env vars that you have set in another window.

If you want to Env Vars to persist across all future bash terminals that are open you need to set env vars in your bash profile. eg. `.bash_profile`

#### Persisting Env Vars in Gitpod

We can persist env vars into gitpod by storing them in Gitpod Secrets Storage.

```
gp env HELLO='world'
```

All future workspaces launched will set the env vars for all bash terminals opened in thoes workspaces.

You can also set en vars in the `.gitpod.yml` but this can only contain non-senstive env vars.


### AWS CLI installation

AWS CLI is installed for the project via the bash script [`./bin/install_aws_cli`](./bin/install/install_aws_cli)

[Gettting Started Install (AWS CLI)](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

We can check if our AWS credentials is configured correctly by running the following command:

```sh
aws sts get-caller-identity
```

If it is successful you should see a json payload return that looks like this

```json
{
    "UserId": "AIDAYC8B4SVA63C73K1HF",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::987654321987:user/terraformer"
}

```

## Terraform Basics

### Terraform Registry

Terraform sources their providers and modules from the Terraform registry which located at [registry.terraform.io](https://registry.terraform.io/)

- **Providers** is an interface to APIs that will allow to create resources in terraform.
- **Modules** are a way to make large amount of terraform code modular, portable and sharable.

[Randon Terraform Provider](https://registry.terraform.io/providers/hashicorp/random)

### Terraform Console

We can see a list of all the Terrform commands by simply typing `terraform`


#### Terraform Init

At the start of a new terraform project we will run `terraform init` to download the binaries for the terraform providers that we'll use in this project.

#### Terraform Plan

`terraform plan`

This will generate out a changeset, about the state of our infrastructure and what will be changed.

We can output this changeset ie. "plan" to be passed to an apply, but often you can just ignore outputting.

#### Terraform Apply

`terraform apply`

This will run a plan and pass the changeset to be execute by terraform. Apply should prompt yes or no.

If we want to automatically approve an apply we can provide the auto approve flag eg. `terraform apply --auto-approve`

#### Terraform destroy
This will destroy Cloud Resources

`terraform destroy`

You can also use the `--auto-apporve` flag to approve automatically 
eg. `terraform apply --auto-approve`

### Terraform Lock Files

`.terraform.lock.hcl` contains the locked versioning for the providers or modulues that should be used with this project.

The Terraform Lock File **should be committed** to your Version Control System (VSC) eg. Github

### Terraform State Files

`.terraform.tfstate` contain information about the current state of your infrastructure.

This file **should not be commited** to your VCS.

This file can contain sensentive data.

If you lose this file, you lose knowning the state of your infrastructure.

`.terraform.tfstate.backup` is the previous state file state.

### Terraform Directory

`.terraform` directory contains binaries of terraform providers.

## Issues with Terraform Cloud login and Gitpod Workspace

When attempting to run `terraform login` it will launch bash wiswig view to generate a token. However it does not work expected in Gitpod VSCode in the brower

The workaround is manually generate a token in Terraform Cloud

```
https://app.terraform.io/app/settings/tokens/source=terraform-login

```
Then create the file manulaay here:

```sh
touch /home/gitpod/.terraform.d/credentials.tfrc.json

```

Then open the file 

```sh
open /home/gitpod/.terraform.d/credentials.tfrc.json

```

Provide the following code (replace the token in the file):

```json
{
    "credentials": {
        "app.terraform.io": {
            "token": "YOUR-TERRAFORM-CLOUD-TOKEN"
        }
    }
}
````

We have automated this workarounf with the following bash script [bin/generate_tfrc_credentials](bin/generate_tfrc_credentials)
