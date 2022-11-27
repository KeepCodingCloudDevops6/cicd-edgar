all: terraform_install terraform_version init plan apply

terraform_install:

	sudo apt-get -y update \
	sudo apt-get -y install gnupg software-properties-common \
	wget -O- https://apt.releases.hashicorp.com/gpg | \
		gpg --dearmor | \
		sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
	echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
	       	https://apt.releases.hashicorp.com $(shell lsb_release -cs) main" |  \
		sudo tee /etc/apt/sources.list.d/hashicorp.list
	sudo apt-get -y update
	sudo apt-get -y install terraform


terraform_version:
	terraform -v

init:
	cd Terraform/ && terraform init

plan:
	cd Terraform/ && terraform plan

apply:
	cd Terraform/ && terraform apply -auto-approve

destroy:
	cd Terraform/ && terraform destroy -auto-approve
	cd Terraform/ && rm -r .terraform/
	cd Terraform/ && rm .terraform.*
