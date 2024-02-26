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

The ```terraform init``` command is executed once before any other terraform command in a new directory or in a directory wich received new Terraform configuration.

```
terraform init
```

![Captura de tela de 2024-02-26 14-54-10](https://github.com/italo-rabelo/CreateEC2WithTerraform/assets/107402049/464f5b51-919a-4dd7-a140-3c21e41d45a2)


Initializing a configuration directory downloads and installs the providers defined in the configuration files, wich in this case is ```aws``` provider.

### 4. Plan what resources will be deployed

The ```terraform plan``` command reads the configuration files inside the working directory and creates a execution plan. This plan is shown right after executing the command and it contains information and details about the resources defined in the configuration files.

```
terraform plan
```

![Captura de tela de 2024-02-26 14-52-29](https://github.com/italo-rabelo/CreateEC2WithTerraform/assets/107402049/1ee45561-052f-46ae-abb0-038ebce67168)




### 5. Create the instance

The ```terraform apply``` command is used to apply defined changes to your Terraform code. It reads Terraform configuration files, creates an execution plan, and asks for your confirmation before executing changes. If confirmed, it takes the necessary actions to achieve the desired state, such as creating, modifying, or deleting resources in your infrastructure, in this case, an EC2 instance on AWS.


![Captura de tela de 2024-02-26 14-31-31](https://github.com/italo-rabelo/CreateEC2WithTerraform/assets/107402049/1298e976-6881-471f-96c6-dfcea9cf0c64)


### 6. Insepct state

When you applied your configuration, Terraform wrote data into a file called terraform.tfstate. Terraform stores the IDs and properties of the resources it manages in this file, so that it can update or destroy those resources going forward.

Insepct the current state with ```terraform show``` command.
Something like this will be desplayed:
```
 aws_instance.app_server:
resource "aws_instance" "app_server" {
    ami                          = "ami-830c94e3"
    arn                          = "arn:aws:ec2:us-west-2:561656980159:instance/i-01e03375ba238b384"
    associate_public_ip_address  = true
    availability_zone            = "us-west-2c"
    cpu_core_count               = 1
    cpu_threads_per_core         = 1
    disable_api_termination      = false
    ebs_optimized                = false
    get_password_data            = false
    hibernation                  = false
    id                           = "i-01e03375ba238b384"
    instance_state               = "running"
    instance_type                = "t2.micro"
    ipv6_address_count           = 0
    ipv6_addresses               = []
    monitoring                   = false
    primary_network_interface_id = "eni-068d850de6a4321b7"
    private_dns                  = "ip-172-31-0-139.us-west-2.compute.internal"
    private_ip                   = "172.31.0.139"
    public_dns                   = "ec2-18-237-201-188.us-west-2.compute.amazonaws.com"
    public_ip                    = "18.237.201.188"
    secondary_private_ips        = []
    security_groups              = [
        "default",
    ]
    source_dest_check            = true
    subnet_id                    = "subnet-31855d6c"
    tags                         = {
        "Name" = "ExampleAppServerInstance"
    }
    tenancy                      = "default"
    vpc_security_group_ids       = [
        "sg-0edc8a5a",
    ]

    credit_specification {
        cpu_credits = "standard"
    }

    enclave_options {
        enabled = false
    }

    metadata_options {
        http_endpoint               = "enabled"
        http_put_response_hop_limit = 1
        http_tokens                 = "optional"
    }

    root_block_device {
        delete_on_termination = true
        device_name           = "/dev/sda1"
        encrypted             = false
        iops                  = 0
        tags                  = {}
        throughput            = 0
        volume_id             = "vol-031d56cc45ea4a245"
        volume_size           = 8
        volume_type           = "standard"
    }
}
```
### 7. Cleaning
To avoid unexpected charges, don't forget to delete the resource that you deployd with ```terraform destroy command```


![Captura de tela de 2024-02-26 14-58-56](https://github.com/italo-rabelo/CreateEC2WithTerraform/assets/107402049/e9251686-4b36-4d28-a9d6-5fb1cdfd0bd3)




