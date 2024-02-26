# Creating an EC2 instance using Terraform
This repository contains a simple tutorial for launching a virtual machine in AWS using Terraform.

## Pre-requisites
Before starting, you'll need :
- An AWS account with permissions to launch EC2 instances
- Terraform installed on your device. The installation tutorial can be easily founded [here](https://developer.hashicorp.com/terraform/install)
- The [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) installed

## Configuration
### 1. Clone this repository into your local files:
```
git clone git@github.com:italo-rabelo/CreateEC2WithTerraform.git
cd CreateEC2WithTerraform/
```

### 2. Use your IAM (Indetity and Access Management) credentials to authenticate the Terraform AWS provider.
   You can obtain your ```AWS_ACCESS_KEY_ID``` and ```AWS_SECRET_ACESS_KEYS``` as the follows:
   1. In AWS console, access IAM.
   2. Select Users on left navigation pane
   3. Click on Security Credentials
   4. Scroll page down and create new Access Keys
      
   ![Captura de tela de 2024-02-26 13-25-14](https://github.com/italo-rabelo/CreateEC2WithTerraform/assets/107402049/9e98469d-cb9a-470e-8636-c9471c75d930)

   5. In use cases, select Command Line Interface (CLI) and go next
    
   ![Captura de tela de 2024-02-26 13-26-41](https://github.com/italo-rabelo/CreateEC2WithTerraform/assets/107402049/37ed087f-2db6-4c69-8340-9629e4b53711)

   6. Add a description tag if you want
   7. Confirm and create the access keys

   ![Captura de tela de 2024-02-26 13-30-54](https://github.com/italo-rabelo/CreateEC2WithTerraform/assets/107402049/80c4f76f-08ec-4242-94b4-6d2de0b9e0bd)

### Now you can use your credentials to authenticate on your terminal by running the following commands
```
export AWS_ACCESS_KEY_ID=paste_your_access_key_id_here
```
```
export AWS_SECRET_ACCESS_KEY=paste_your_secret_access_key_here
```

### 3. Initialize Terraform on the directory by running the following
```
terraform init
```
Initializing a configuration directory downloads and installs the providers defined in the configuration files, wich in this case is ```aws``` provider.

