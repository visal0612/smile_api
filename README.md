## Part 1 :
# REST API Development

Objective
Create a simple REST API with a single entry point.

Endpoint: GET / should return { "message": "Hello Smile" } in JSON
format.

Requirements:
Use a programming language of your choice.
Make it simple.
Include instructions for running the API locally.

## Part 1 : Solution
1. install dependency to wtite code using python
- pip install gunicorn
- pip install Flask
2. pack pip pkgs in requirement.txt
- pip freeze > requirements.txt

2. code written in python3 in app.py file test with below command

# run using below command
python3 app.py

# Access the API:
http://127.0.0.1:5000/


result
{"message": "Hello Smile"}

## Part 2: 
# Dockerization and Local Deployment:
Objective
Dockerize the REST API and prepare it for local deployment.

Requirements
Create a Dockerfile for containerizing the application.
Provide detailed instructions for building and running the container locally.


## Part: 2 Solution
Dependency Install Docker give required permission
https://docs.docker.com/engine/install/ubuntu/
- usermod -aG docker $USER

1. Create Docker file
   Dockerfile

2. Build the Docker image
docker build -t my-flask-app .

3. Run the Docker container
docker run -itd -p 5000:5000 my-flask-app

4. Access the API:
http://127.0.0.1:5000/

result
{"message": "Hello Smile"}


## Part 3
# Deployment in a Production Environment
3.1 Kubernetes

Objective

Create all necessary Kubernetes resources to deploy the application in a production environment.

Requirements

Define Kubernetes manifests for the application.

Ensure high availability and scalability of the application.

Include a README with instructions for deploying the application on a Kubernetes cluster.

## Part 3.1 Solution
I have done part 3.1 on minikube so dependency required install minikube and kubectl following below url then run cluster
Minikube installation : https://minikube.sigs.k8s.io/docs/start/
Kubectl installation: https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/


# run kubernetes cluster using minikube 
- minikube start -p smileio-stage --extra-config=a^Cserver.service-node-port-range=1-65535

1. Create a file named deployment.yaml
2. Create a file named service.yaml

3. Build and Push Docker Image to a Container Registry
- docker build -t your-docker-hub-username/my-flask-app .
- docker push your-docker-hub-username/my-flask-app

4. Deploy to Kubernetes
- kubectl apply -f deployment.yaml
- kubectl apply -f service.yaml

5. Access the Application
kubectl get services my-flask-app-service

6. Cleanup 
kubectl delete -f service.yaml
kubectl delete -f deployment.yaml


## Part 3.2 Terraform
3.2 Terraform for AWS
Objective
Use Terraform to provision the necessary AWS resources to deploy the REST API within a production environment, focusing on compute and security aspects.

Requirements
Define infrastructure as code using Terraform.
Provide a README with clear instructions to execute the Terraform code and deploy the infrastructure on AWS.

## Part 3.2 Solution
Install aws cli using this url   ## https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
then configure secret

Step 1: Install Terraform
Step 2: Create Terraform Configuration with name main.tf

Step 3: Initialize and Apply Terraform
terraform init
terraform apply

Step 4: Access the Application
Once the Terraform provisioning is complete, you can find the public IP address of your EC2 instance in the Terraform output. You can also check the AWS EC2 console.

Step 5: Cleanup (Optional)
terraform destroy

# Below are the steps to follow in order to install Terraform. 
- Once installed, you will need to configure the main.tf file by providing details such as the AWS region, AMI, EC2 key pair, and Docker image details. 
- After configuring, you will need to initialize and apply Terraform to provision AWS resources. Once the provisioning is complete, you will be provided with information on how to access the application, including the public IP address of the EC2 instance. If needed, you can also customize the Terraform configuration for scaling, additional security, or other aspects.


## Additional Notes
Additional Notes: 

If you had more time what would you include?
Ans: I would create an EKS cluster and VPC, and implement CI/CD with best practices for code management and PR approvals.