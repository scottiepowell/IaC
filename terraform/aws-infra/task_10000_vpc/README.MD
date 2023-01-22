Lab Steps
Task 1: Sign in to AWS Management Console

    Click on the  button, and you will get redirected to AWS Console in a new browser tab.

    On the AWS sign-in page,

        Leave the Account ID as default. Never edit/remove the 12 digit Account ID present in the AWS Console. otherwise, you cannot proceed with the lab.

        Now copy your User Name and Password in the Lab Console to the IAM Username and Password in AWS Console and click on the Sign in button.

    Once Signed In to the AWS Management Console, Make the default AWS Region as US East (N. Virginia) us-east-1.

    Select Maybe later in New AWS Console Home page pop-up 

                  
Task 2: Setup Visual studio code

    Create a folder using File Explorer on your local machine's desktop with the name task_10000_vpc.

    Open the Visual Studio Code application. If you haven't installed the VSC software, download and install using the software using the link provided in the Prerequisite section above.

    If you have already installed and using Visual studio code, Open a New Window by clicking File from the menu bar present on the top and select New Window.

    And, now select Open present under the File menu and navigate to the desktop location. Select the Folder task_10000_vpc.

    A new window will open a new file and release notes page (only if you have installed or updated Visual Studio Code recently). Close the Release notes tab.

    Visual Studio Code is now ready to use.

Task 3: Create a variables file

In this task, you will create variables files where you will declare all the global variables with a short description and a default value.

    To create variables files, click on the File from the menu bar and choose New file

    Press Ctrl + S to save the new file as variables.tf and click on the Save button after entering the file name.

    Note: Don't change the location of the new file, keep it default, i.e. inside the task_10000_vpc folder.

    Paste the below contents in variables.tf file:
    variable "access_key" {
        description = "Access key to AWS console"
    }
    variable "secret_key" {
        description = "Secret key to AWS console"
    }
    variable "region" {
        description = "Region of AWS VPC"
    }


    In the above content, you are declaring a variable called, access_key, secret_key, and region with a short description of all 3.

    After pasting the above contents, save the file by pressing Ctrl + S.

    Now create the terraform.tfvars file by selecting New file present under File in the menu bar.

    Name the file by pressing Ctrl + S and enter terraform.tfvars

    Paste the below content into terraform.tfvars file
    region = "us-east-1"
    access_key = "<YOUR AWS CONSOLE ACCESS ID>"
    secret_key = "<YOUR AWS CONSOLE SECRET KEY>"

    In the above code, you are defining the dynamic values of variables declared earlier.

    Replace the values of access_key and secret_key by copying from the lab page.

    After replacing the values of access_key and secret_key, save the file by pressing Ctrl + S.

Task 4: Create VPC and its components in main.tf file

In this task, you will create main.tf file where you will add details of the provider and resources.

    To create main.tf file, click on the File from the menu bar and choose New file

    Press Ctrl + S to save the new file as main.tf and click on the Save button after entering the file name.

    Paste the below content into main.tf file.
    provider "aws" {
         region     = var.region
         access_key = var.access_key
         secret_key = var.secret_key
    }
    resource "aws_vpc" "vpc" {
        cidr_block = "10.0.0.0/16"
    }


    In the above code, you are defining provider as aws and defining resource block using aws_vpc  for creating an Amazon VPC having CIDR Block as 10.0.0.0/24.

    Define Internet gateway, route table, and subnets in all availability zone. Add the below contents after aws_vpc block.
    resource "aws_internet_gateway" "gateway" {
        vpc_id = aws_vpc.vpc.id
    }
    resource "aws_route" "route" {
        route_table_id         = aws_vpc.vpc.main_route_table_id
        destination_cidr_block = "0.0.0.0/0"
        gateway_id             = aws_internet_gateway.gateway.id
    }
    data "aws_availability_zones" "available" {}

    resource "aws_subnet" "main" {
       count                   = length(data.aws_availability_zones.available.names)
       vpc_id                  = aws_vpc.vpc.id
       cidr_block              = "10.0.${count.index}.0/24"
       map_public_ip_on_launch = true
       availability_zone       = element(data.aws_availability_zones.available.names, count.index)
    }


    In the above code, you are performing the following tasks:

        Creating an Internet gateway and attaching it with the VPC.

        Adding route as 0.0.0.0/0 and destination as an Internet gateway.

        Checking all the availability zones.

        Creating subnets in all availability zones.

    Save the file by pressing Ctrl + S.

Task 5: Confirm the installation of Terraform by checking the version

    Open the Terminal by clicking on the View from the menu bar and choosing Terminal

    Navigate to the folder using the cd command, example, to navigate to the desktop, use cd Desktop

    To confirm the installation of Terraform, run the below command to check the version:

        terraform version

    If you are getting output as command not found: terraform, this means that terraform is not installed on your system, To install terraform follow the official guide link provided in the Prerequisite section above.

Task 6: Apply terraform configurations

    Make sure you are in the same location where all these 3 files are present, you can check the same using the ls command.

    Initialize Terraform by running the below command:

        terraform init

    Note: terraform init will check for all the plugin dependencies and download them if required, this will be used for creating a deployment plan.

    To generate the action plans run the below command:

        terraform plan

    Review the whole generated plan.

    To create all the resources declared in main.tf configuration file, run the below command:

        terraform apply

    You will be able to see the resources which will be created, approve the creation of all the resources by entering yes.

    It may take up to 2 minutes for the terraform apply command to create the resources.

    Ids of all the resources created by terraform will be visible there.

    Optionally, you can note down the IDs of all the resouces.

Task 7: Check the resources in AWS Console

    Click on the  button, AWS Management Console will open in a new tab.

    On the AWS sign-in page, the 12 digit Account ID will be present by default.

        Leave the Account ID as default. Do not remove or change the Account ID otherwise, you cannot proceed with the lab.

    Copy and paste the IAM user name and Password into AWS Console. Click on Sign in to log into the AWS Console.

    Make sure you are in the US East (N. Virginia) us-east-1 Region.

    Navigate to VPC by clicking on Services under the Networking & Content Delivery section.Click on VPC (under Networking & Content Delivery section) or you can also search for VPC.

    Click on Your VPCs from the left menu. 

    Custom VPC is present.

    To check Subnets, click on the Subnets option from the left sidebar.

    All the present subnets are of both the VPC i.e. Default VPC and Custom VPC.

    Apply the filter of Custom VPC by clicking on the Search bar and select VPC as Properties and VPC Id of custom VPC as VPC values.

    Similarly, you can check Route Tables, Internet Gateways, and Security Groups.

Task 8: Validation of the lab

    Once the lab steps are completed, please click on the  button on the left side panel.

    This will validate the resources in the AWS account and displays whether you have completed this lab successfully or not.

    Sample output : 
            

Task 9: Delete AWS Resources

    To delete the resources, open Terminal again.

    Run the below command to delete all the resources.

        terraform destroy

    Enter yes to confirm the deletion.

Resources

    To download the Terraform configuration for this lab, click here.

Completion and Conclusion

    You have successfully done the setup of the Visual Studio Code editor.

    You have successfully created variables.tf and terraform.tfvars file

    You have successfully created a main.tf file.

    You have successfully executed the terraform configuration commands to create the resources.

    You have successfully checked all the resources are created by opening the Console.

    You have successfully deleted all the resources.
