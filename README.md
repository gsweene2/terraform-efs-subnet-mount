# Terraform EFS & Subnet Mount

## Step 1: Initialize Repo
```
terraform init
```

## Step 2: (Optional) Create a .tfvars file

```
mkdir vars
touch vars/sample.tfvars
```
Example tfvars:
```
subnet_id = "subnet-abc1234"
```

## Step 2: Plan Resources
```
terraform plan -var-file="vars/sample.tfvars"
```

## Step 3: Apply Resources
```
terraform apply -var-file="vars/sample.tfvars"
```
