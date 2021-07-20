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
* Clone this code to your Repo. from:

* Clone this code locally to Azure Cloud Shell locally from your Repo using SSH.

* ensure Python environment is set:

* Install all dependencies in venv.

* Passing tests that are displayed after running the `make all` command from the `Makefile`

* Output of a test run

* Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

* Project running on Azure App Service

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
