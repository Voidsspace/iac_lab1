variable "instance_type" {
    description = "O tipo de instância a ser criada"
    type = string
    nullable = false
}

variable "ami" {
  description =  "A Amazon Machine Image (AMI) a ser usada pela instância"
  type = string
  nullable = false
}

variable "region" {
  description = "A região AWS onde a instancia será criada"
  default = "us-east-2"
  type = string
  nullable = true
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "example" {
  ami = var.ami
  instance_type = var.instance_type
  tags = {Name = "tarefa1-terraform"}
}

// Comandos para executar com variaveis via terminar: 

// terraform init

// terraform plan -var 'instance_type=t2.micro' -var 'ami=ami-0a0d9cf81c479446a' -out lab2-plan.txt

// terraform apply -var 'instance_type=t2.micro' -var 'ami=ami-0a0d9cf81c479446a'

//terraform destroy -var 'instance_type=t2.micro' -var 'ami=ami-0a0d9cf81c479446a'

// comando para executar com arquivo de variaveis. 

// terraform plan -var-file="localdoarquivo" -out nomedoarquivo

// terraform apply -var-file="localdoarquivo"

// terraform destroy -var-file="localdoarquivo"
