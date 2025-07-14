
# 🚀 Terraform Project: Deploy Scalable Web Infrastructure on AWS

This project demonstrates how to provision a **highly available and scalable web infrastructure on AWS** using **Terraform**. It automates the deployment of:

- A custom **VPC**
- Two public **subnets** across different **Availability Zones**
- An **EC2 instance** behind an **Application Load Balancer (ALB)**
- An **Auto Scaling Group (ASG)**
- **User data** to deploy a simple website on Apache

---

## 🧱 Architecture Overview

                +-----------------------------+
                |       Route 53 (Optional)   |
                +-----------------------------+
                             |
                             ▼
                +-----------------------------+
                |      Application Load       |
                |        Balancer (ALB)       |
                +-----------------------------+
                     /               \
                    /                 \
         +----------------+   +----------------+
         |   EC2 Instance |   |   EC2 Instance |
         | (Auto Scaled)  |   | (Auto Scaled)  |
         +----------------+   +----------------+
               in AZ-a              in AZ-b
                    \               /
                    +---------------+
                    |   Target Group |
                    +---------------+
                            |
                +-----------------------------+
                |      Public Subnets (x2)     |
                +-----------------------------+
                            |
                +-----------------------------+
                |           VPC               |
                +-----------------------------+


---

## 📁 Project Structure

terraform-ec2-website-project/
│
- ├── provider.tf    # AWS provider configuration
- ├── vpc.tf       # VPC, Subnets, Route Tables
- ├── ec2.tf       # EC2 Launch Template
- ├── alb.tf      # Load Balancer & Target Group
- ├── autoscaling.tf   # Auto Scaling Group
- ├── variables.tf   # Input variables
- ├── outputs.tf  # Output values
- ├── user_data.sh   # Script to configure Apache & serve webpage
- └── terraform.tfvars  # Values for variables


---

## 📦 Features

- **Custom VPC** with 2 public subnets in different AZs.
- **Security Groups** to allow HTTP & SSH.
- **EC2 Launch Template** with Apache web server via `user_data`.
- **Application Load Balancer (ALB)** for traffic distribution.
- **Auto Scaling Group (ASG)** to ensure high availability and scaling.
- Terraform best practices: variables, outputs, and modular structure.

---

## 📜 Prerequisites

- AWS CLI configured (`aws configure`)
- Terraform installed (`terraform -v`)
- IAM user with sufficient permissions
- Key pair (for SSH access, if needed)

---

## 🚀 How to Use

1. **Clone the repo** or copy the files

```bash
git clone https://github.com/<your-username>/terraform-ec2-website-project.git
cd terraform-ec2-website-project
