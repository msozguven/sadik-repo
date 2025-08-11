terraform {
  required_providers {
    rancher2 = {
      source = "rancher/rancher2"
      version = ">=7.3.2"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">=2.38.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = ">=3.0.2"
    }
  }
}

provider "rancher2" {}

provider "kubernetes" {}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
