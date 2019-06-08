### Software Provision using *Terraform*

This example demonstrates use of **[provisioners](https://www.terraform.io/docs/provisioners/index.html)** to initialize instances when they're created, [**provisioners**](https://www.terraform.io/docs/provisioners/index.html) let you upload files, run shell scripts, or install and trigger other software like configuration management tools, etc.

There are two ways to **provision software** on your launched instances :

- First way is to build your own custom machine image and bundle your software with the image. This can be done using tools like Packer. 
- Second way is to first boot instances using standard machine images and then install software using provisioners.



