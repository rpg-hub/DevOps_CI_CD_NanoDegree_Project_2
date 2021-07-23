# Overview

![DevOps-CI-CD-with-Azure-and-GitHub](https://github.com/rpg-hub/DevOps_CI_CD_NanoDegree_Project_2/actions/workflows/main.yml/badge.svg)

In this project we are going to build a CI CD pipeline using Git, GitHub, Azure an dAzure DevOps. We will use:
Git: to code hosting, version control and repo (on Git Hub)
GitHub Actions: to aid in CI with testing and linting.
Azure DevOps to enable CD and,
Azure App Service to host final application.

## Project Plan
We are going to use Trello board and an spreadsheet to manage work items. With weekly goals, tasks and completion.
This also ensures DevOps best practices are used to build and manage the project.

* https://trello.com/b/NPG9wHo8/devopscicdnanodegreeproject2trelloboard
* spreadsheet that includes the original and final project plan:[DevOps_CI_CD_NanoDegree_Project_2_worksheet.xlsx](https://github.com/rpg-hub/DevOps_CI_CD_NanoDegree_Project_2/files/6852665/DevOps_CI_CD_NanoDegree_Project_2_worksheet.xlsx)


## Instructions

* Architectural Diagram (Shows how key parts of the system work)
![DevOps_CI_CD_NanoDegree_Project_2_architectural-diagram-2](https://user-images.githubusercontent.com/14298823/126685275-4cc78126-d8ec-485b-b127-c2a607ba73be.jpg)


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

# Setting up GitHub Actions for CI

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
  
  ![image](https://user-images.githubusercontent.com/14298823/126685631-eb3a6db1-2966-4278-9a00-faa92d439c82.png)

  the website...
  
  ![image](https://user-images.githubusercontent.com/14298823/126405383-38ad155f-fc2c-44ba-800c-584f77e24a80.png)

  A successful execution of the deployed app: This script tests the App running on Azure App Service.
  
  ![image](https://user-images.githubusercontent.com/14298823/126405034-0a2f252b-4a8d-4b5a-9eff-e2e70cb4940c.png)


  
# Setting up Azure Pipeline for CD


* Create a Azure Pipeline with Azure DevOps for CD to Azure App service
  Create a Pipeline in Azure DevOps.
    create DevOps Project
    ![image](https://user-images.githubusercontent.com/14298823/126415318-e89a68f7-66c8-44de-aae7-652e1ee1573a.png)
  
create service connection:
  go to project settings at bottom:
  
  ![image](https://user-images.githubusercontent.com/14298823/126415539-46a4caee-05e5-43df-8a85-c23cebb4f212.png)

  select 'Service connections', create a new connection:
  
  ![image](https://user-images.githubusercontent.com/14298823/126415607-d45d8b36-44e2-49af-b183-ece0014654bf.png)

  Select ARM:
  
  ![image](https://user-images.githubusercontent.com/14298823/126415641-4085715a-a583-484d-a938-a4fe73aba20c.png)
  
  select authentication method:
  
  ![image](https://user-images.githubusercontent.com/14298823/126415690-5c763dfb-128e-4b33-8b5f-1461e9c00ef1.png)

  Authenticate to your Azure Account and put in more more details:
  
  ![image](https://user-images.githubusercontent.com/14298823/126416452-8ef84e9f-41d7-491a-9b18-be87c5207682.png)

  select the same RG where your App is:
  
  ![image](https://user-images.githubusercontent.com/14298823/126416706-5cdd1c10-e1db-498f-94c6-2a7765d574ab.png)

      
  create and configure pipeline:
  
  ![image](https://user-images.githubusercontent.com/14298823/126416952-0b1d0e5f-beae-49cc-a2b8-11990af9f517.png)

  
  source code: select GitHub
  
  ![image](https://user-images.githubusercontent.com/14298823/126417029-d5ed6ff4-16ae-4ce8-b6a3-01b4e8f8f37d.png)

  
  select Repo, authenticate to GitHub if required.
  
  ![image](https://user-images.githubusercontent.com/14298823/126417109-95e6a27a-2cf1-4d6d-aaf4-cd3ee3e86746.png)
  
  
  Grant Access to one, more or all Repo:
  
  ![image](https://user-images.githubusercontent.com/14298823/126417264-cfcb85f0-6469-49a8-954c-10c86226c3a9.png)

  
  On the Configure your pipeline screen, select Python to Linux Web App on Azure. (IMPORTANT)
  
  ![image](https://user-images.githubusercontent.com/14298823/126417331-b81a6fad-daa1-487c-9b46-cc23e2a41338.png)
  
  
  Authenticate to Azure and select your App:
  
  ![image](https://user-images.githubusercontent.com/14298823/126417458-667f5bfe-7728-47cf-9d9f-a7704868db82.png)
  
  
  Pipeline is now ready. in next screen, you edit/review, or directly "save and run"
  
  ![image](https://user-images.githubusercontent.com/14298823/126417788-b5120474-4dd5-4119-b68e-98236d56d4df.png)


  Azure Pipelines creates an azure-pipelines.yml file that defines your CI/CD pipeline as a series of stages, Jobs, and steps, where each step contains the details for different tasks and scripts.
  
  

* Running Azure App Service from Azure Pipelines automatic deployment (executing CD Pipeline)
* A successful Azure Pipeline Processing:
  
  ![image](https://user-images.githubusercontent.com/14298823/126418679-f0857171-941a-4180-9fec-7f419d04c3e5.png)

  

* Successful prediction from deployed flask app in Azure Cloud Shell.  [Use this file as a template for the deployed prediction](https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn/make_predict_azure_app.sh).
  
The output should look similar to this:

```bash
  
rajeev@Azure:~/DevOps_CI_CD_NanoDegree_Project_2$ ./make_predict_azure_app.sh
Port: 443
{"prediction":[20.35373177134412]}
  
```



* Output of streamed log files from deployed application
  
```bash
  
  rajeev@Azure:~/DevOps_CI_CD_NanoDegree_Project_2$ az webapp log tail -n devops-ci-cd-rajeev
  2021-07-21T02:20:33  Welcome, you are now connected to log-streaming service.

  Starting Log Tail -n 10 of existing logs ----

  /home/LogFiles/__lastCheckTime.txt  (https://devops-ci-cd-rajeev.scm.azurewebsites.net/api/vfs/LogFiles/__lastCheckTime.txt)
  7/20/21 10:42:10 PM


  /home/LogFiles/kudu/trace/42b8676249b7-304e3c17-b3b4-4f01-aca7-2a26bcf7a162.txt  (https://devops-ci-cd-rajeev.scm.azurewebsites.net/api/vfs/LogFiles/kudu/trace/42b8676249b7-304e3c17-b3b4-4f01-aca7-2a26bcf7a162.txt)
     at Microsoft.AspNetCore.Builder.Extensions.MapMiddleware.Invoke(HttpContext context)
     at Microsoft.AspNetCore.Builder.Extensions.MapMiddleware.Invoke(HttpContext context)
     at Microsoft.AspNetCore.Builder.Extensions.MapMiddleware.Invoke(HttpContext context)
     at Microsoft.AspNetCore.Builder.Extensions.MapMiddleware.Invoke(HttpContext context)
     at Microsoft.AspNetCore.Builder.Extensions.MapMiddleware.Invoke(HttpContext context)
     at Microsoft.AspNetCore.Builder.Extensions.MapMiddleware.Invoke(HttpContext context)
     at Microsoft.AspNetCore.Builder.Extensions.MapWhenMiddleware.Invoke(HttpContext context)
     at Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware.Invoke(HttpContext context)
     at Kudu.Services.Web.Tracing.TraceMiddleware.Invoke(HttpContext context) in /tmp/KuduLite/Kudu.Services.Web/Tracing/TraceMiddleware.cs:line 65
  2021-07-21T02:16:27      Outgoing response, type: response, statusCode: 400, statusText: BadRequest
  
```

  
### Load Test:
  A load test, using Locust, is included to test our app. This test is run on website running on local PC.
  to install and run:
  * install Locust:
    `pip install locust`
  
  * start App:
    `python app.py`
  
  * Start Locust:
    `locust`
  
  * Check in Browser:
    Open http://localhost:8089 in Browser. Enter the total number of users to simulate, spawn rate, set the host to localhost:5000, and click Start Swarming:
  
  start:..
  ![image](https://user-images.githubusercontent.com/14298823/126815169-c972a2e9-5df4-425e-a68f-934202590c40.png)

  running:...
  ![image](https://user-images.githubusercontent.com/14298823/126817119-b16b8009-cc1c-490a-9b06-5ae0541bb954.png)



  
  
# Enhancements

We can add some pitcures and links to execute and display results.
Maybe some way to include more datasets.
A mobile version is also an attractive option.

# Demo 

Link to video walkthru (Demo): https://youtu.be/lMSz1hDqGDI

