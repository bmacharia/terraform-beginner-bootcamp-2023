terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "ExamPro"

  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
  cloud {
    organization = "bmach"
    workspaces {
      name = "terra-house-1"
    }
  }

}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid= var.teacherseat_user_uuid
  token=var.terratowns_access_token
}

module "home_chowder_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.chowder.public_path
  content_version = var.chowder.content_version

}

resource "terratowns_home" "home" {
  name = "Clam Chowder and Sourdough Bread, A Match Made in Heaven"
  description = <<DESCRIPTION
East Coast meets West Coast. 
The marriage of New England Clam chowder with the San Francisco Sourdough Bread 
is a relatively modern culinary innovation. It's a combination
that is both practical(edible bowl) and delicious
DESCRIPTION
  domain_name = module.home_chowder_hosting.domain_name
  town = "cooker-cove"
  content_version = var.chowder.content_version
}

module "home_fender_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.fender.public_path  
  content_version = var.fender.content_version
}

resource "terratowns_home" "home_fender" {
 name = "Fender Precision Bass"
 description = <<DESCRIPTION
 Originally designed over 70 years ago, by Leo Fender, The Fender
 Precision Bass or P-Bass has been used to provide the low-end for countless
 hit songs in all genres of music, from Rock and Roll, Motown, Country,
 and any other genre one can think of.
DESCRIPTION
  domain_name = module.home_fender_hosting.domain_name
  town = "melomaniac-mansion"
  content_version = var.fender.content_version
}
