# Variable Concepts

### Why Variables 

- Writing everything in one file is not recommended. Modularity is needed for reuse.
- Variables can be used for elements that can change.
  - Ex - AMI's are different per region
- Variables can be used to hide secrets
  - Generally we don't want to keep any kind of credentials in GIT Repo. 

### Implementation Explanation

1. vars.tf - This file is used to **declare** terraform variables. Please refer to [Terraform Variable]: https://www.terraform.io/docs/configuration-0-11/variables.html

> In this file variable of type map is created to define AWS AMI's as they will vary by region and can be subtituted at runtime by Terraform.
>
> ***If currly brackets are empty it means, values are not defined.***

2. provider.tf - This file is used to define provider details. In my example provider.tf defines variables required for AWS.
3. terraform.tfvars - This file is variable definitions file and used to initialise variable values which can be used to pass workspace variable values to Terraform. 
   - This file can be put in **.gitignore** file as it carries sensitive values required for our local workspace. 
     - Example - We can keep provider secret keys.
4. instance.tf - This is the file which defines the type of resource to be created. In current example instance.tf defines <u>**ami id**</u> which is dynamically looked up using  [lookup function](https://www.terraform.io/docs/configuration/functions/lookup.html) and instance type.

#### Example execution instruction

1. Substitute appropriate AMI Id's in vars.tf file.
2. Substitute your AWS account user access and secret key in terraform.tfvars file and add this file to your .gitignore file.
3. Navigate inside terraform-variable-usage folder.
4. Run terraform init command
5. Run terraform plan command to see what resource terraform is going to create
6. Run terraform apply command to create resource
7. Run terraform destroy to remove created resources. **~~Not recommended to do in production.~~** 

