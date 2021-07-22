1. Preparing the environment
 $ git clone git@github.com:rpg-hub/DevOps_CI_CD_NanoDegree_Project_2.git
 $ cd DevOps_CI_CD_NanoDegree_Project_2
 $ make setup
 $ source ~/.DevOps_CI_CD/bin/activate
 $ make all

2. Testing APP Locally in Azure CD_Pipeline
 $ python app.py
 $ cd DevOps_CI_CD_NanoDegree_Project_2
 $ chmod +x make_prediction.sh
 $ ./make_prediction.sh

3. Depoly App in Azure App Service
 $ az webapp up -n DevOps-CI-CD-Rajeev
 $ chmod +x make_predict_azure_app.sh
 $ ./make_predict_azure_app.sh

4. Monitor the Logs
 $ az webapp log tail -n devops-ci-cd-rajeev

5. Load Test
 $ pip install locust
 $ python app.py
 $ locust
