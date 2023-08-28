provider "aws" {
  # changed region declaration to use workspaces	
  #region  = "us-east-2"
  region = "${terraform.workspace == "production" ? "us-east-2" : "us-east-1"}"
  # version replaced by file version.tf
  #version = "~> 3.0"
}

provider "aws" {
  alias   = "east1"
  region  = "us-east-1"
  #version = "~> 3.0"
} 

terraform {
  backend "s3" {
    # Lembre de trocar o bucket para o seu, não pode ser o mesmo nome
    bucket = "curso-terraform-essential-gomex"
    key    = "mystate1"
    region = "us-east-2"
	encrypt = true
  }

}
