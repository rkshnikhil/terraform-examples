### Software Provisioning using *Terraform*

This example demonstrates use of **[provisioners](https://www.terraform.io/docs/provisioners/index.html)** to initialize instances when they're created, [**provisioners**](https://www.terraform.io/docs/provisioners/index.html) let you upload files, run shell scripts, or install and trigger other software like configuration management tools, etc.

There are two ways to **provision software** on your launched instances :

- First way is to build your own custom machine image and bundle your software with the image. This can be done using tools like Packer. 
- Second way is to first boot instances using standard machine images and then install software using provisioners.

#### Example Implementation

In provided example, File upload provisioner is used in conjunction with **remote-exec** to execute script to provision **[nginx](https://www.nginx.com/resources/wiki/)** on ec2 instance.

Important notes :

- The provisioner may use **SSH** (Linux hosts) or WinRM (on windows hosts).
- SSH is used in current example, hence [provisioner connection](https://www.terraform.io/docs/provisioners/connection.html) will be defined to establish SSH connection.
- For AWS ec2 instances get ec2 instance user from - [**EC2_USER**](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connection-prereqs.html) based on OS type. For current example Amazon Linux OS based AMI is used, hence the user name is **`ec2-user`**
- For SSH connection with AWS based instances we generally use SSH keypairs rather than username and password, hence SSH key pairs are used in current example.
- A resource `aws_key_pair` with name ec2webserverkey is defined in instance.tf file. This resource

##### Example execution instructions :

1. Generate public and private key. If you are using linux or mac ssh-keygen can be used to generate private and public keys.
2. Navigate to example directory and run command ssh-keygen -f ec2webserverkey. Leave the passphrase to be empty.
3. Above command will create ec2webserverkey and ec2webserverkey.pub private and public key respectively.
4. Open SSH access to the instance using AWS security group.
   -  Login to AWS Console and select Ireland region.
   - Go to VPC dashboard and you will see 1 VPC and 3 subnets created.
   - Select security group and you will default security group.
   - Click on Inbound Rule panel at bottom and edit rules.
   - Click on Add Rule and then select All TCP rule type, add 22 as a port and select source as **Anywhere**. 
   - Save rule. This will allow access to this instance over TCP through port 22.
5. Now run terraform init to initiailze the terraform workspace.
6. Now run terraform apply to create the resource and provision software. Note - edit terraform.tfvars file to substitute AWS_ACCESS_KEY and AWS_SECRET_KEY values.