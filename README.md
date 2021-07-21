# Overview

In this project we are going to build a CI CD pipeline using Git, GitHub, Azure an dAzure DevOps. We will use:
Git: to code hosting, version control and repo (on Git Hub)
GitHub Actions: to aid in CI with testing and linting.
Azure DevOps to enable CD and,
Azure App Service to host final application.

## Project Plan
We are going to use Trello board and an spreadsheet to manage work items. With weekly goals, tasks and completion.
This also ensures DevOps best practices are used to build and manage the project.

* https://trello.com/b/NPG9wHo8/devopscicdnanodegreeproject2trelloboard
* A link to a spreadsheet that includes the original and final project plan>

## Instructions

* Architectural Diagram (Shows how key parts of the system work)
![DevOps_CI_CD_NanoDegree_Project_2_architectural-diagram](https://user-images.githubusercontent.com/14298823/126376627-baada60a-295e-4543-8626-f3fd87d12d2f.jpg)


To be able to run this app, we first need to clone our code in Git on our local PC Or Azure Cloud Shell. Here we will use Azure Cloud Shell.
* Clone this code to your Repo. from: git@github.com:rpg-hub/DevOps_CI_CD_NanoDegree_Project_2.git

* Clone this code locally to Azure Cloud Shell locally from your Repo using SSH.
![image](https://user-images.githubusercontent.com/14298823/126380130-33d81c6d-aa52-4f7c-82d3-06a9f76f144d.png)

* setup virtual env for python:
  ```
  $ make setup
  ```
  
* enable it:
  ```
  $ source ~/.DevOps_CI_CD/bin/activate
  ```
  
* Install all dependencies in venv.
  ```
  $ make all
  ```

* Passing tests that are displayed after running the `make all` command from the `Makefile`
  ![image](https://user-images.githubusercontent.com/14298823/126400590-0fe5308d-6c8c-4ff1-8531-149d107c1a60.png)
  *W0702 is OK.*

* Output of a test run ( Run Locally )
  ```
  $ python app.py
  ```
  ![image](https://user-images.githubusercontent.com/14298823/126401102-56c1ee79-ed18-4612-a54d-19a12c02e2ff.png)


  in another window:
  
  ```
  $ cd DevOps_CI_CD_NanoDegree_Project_2
  $ chmod +x make_prediction.sh
  $ ./make_predict.sh
  ```
  ![image](https://user-images.githubusercontent.com/14298823/126401143-3dba9dea-8a7a-4bc4-b556-ef94dbb9fb6f.png)


* updating GitHub Repo:

  ![image](https://user-images.githubusercontent.com/14298823/126403147-f4fbf10a-977b-4973-87e3-be9eb467132b.png)

# Setting up Azure Actions for CI

* Setup GitHub Actions : (CI workflow)
  go to Actions, and select this workflow to start with: "set up a workflow yourself"
  
  ![image](https://user-images.githubusercontent.com/14298823/126407364-1f75d6cb-81e5-4824-b939-3947a4723762.png)

  This yml file should like the one in my Repo, it is situated here: "<your-repo>"//.github/workflows/main.yml

* The CI job completes successfully.
  ![image](https://user-images.githubusercontent.com/14298823/126409773-a1641e43-b3d3-4f54-8af4-d59ae81a6c15.png)

# Setting up Azure Web App
  
* Configure website name: Site names only allow alphanumeric characters and hyphens, cannot start or end in a hyphen, and must be less than 64 chars.

  For this project site name is: https://DevOps-CI-CD-Rajeev.azurewebsites.net
  
* Successful deploy of the project in Azure Pipelines.
  [Also refer official documentation to setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

  To create an App Service and initially deploy your app:
  ```
  az webapp up -n DevOps-CI-CD-Rajeev
  ```
  
  ![image](https://user-images.githubusercontent.com/14298823/126404828-e8df948e-bca9-4102-891f-3f3739878900.png)


* Project running on Azure App Service.
 
  ![image](https://user-images.githubusercontent.com/14298823/126405383-38ad155f-fc2c-44ba-800c-584f77e24a80.png)

  A successful execution of the deployed app: This script tests the App running on Azure App Service.
  
  ![image](https://user-images.githubusercontent.com/14298823/126405034-0a2f252b-4a8d-4b5a-9eff-e2e70cb4940c.png)

 
* Create a Azure Pipeline with Azure DevOps for CD to Azure App service
  1. Create a Pipeline in Azure DevOps.
    a. create DevOps Project
    b. create service connection
    c. create and configure pipeline:
      c.1: source code: select GitHub
      c.2: select Repo
      c.3: On the Configure your pipeline screen, select Python to Linux Web App on Azure. (IMPORTANT)
    New pipeline should be ready now. When prompted, select the Azure subscription in which you created your Web App.
    * Select the Web App
    * Select Validate and configure

    Azure Pipelines creates an azure-pipelines.yml file that defines your CI/CD pipeline as a series of stages, Jobs, and steps, where each step contains the details for different tasks and scripts.
  
  2. 

c. While creeating a service connection please select "Python to Linux Web App on Azure" in configuration wizard and select out App from drop down menu.


* Running Azure App Service from Azure Pipelines automatic deployment

* Azure Pipeline Processing: https://github.com/rpn-hub/<project-name>/actions/workflows/python-app.yml

* Successful prediction from deployed flask app in Azure Cloud Shell.  [Use this file as a template for the deployed prediction](https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn/make_predict_azure_app.sh).
The output should look similar to this:

```bash
udacity@Azure:~$ ./make_predict_azure_app.sh
Port: 443
{"prediction":[20.35373177134412]}
```

* Output of streamed log files from deployed application

> 

## Enhancements

We can add some pitcures and links to execute and display results.
Maybe some way to include more datasets.
A mobile version is also an attractive option.

## Demo 

Link to video walkthru (Demo):
