from locust import HttpUser, task, between

class WebsiteTestUser(HttpUser):
    wait_time = between(0.5, 3.0)

    @task(1)
    def test1(self):
        self.client.get("https://devops-ci-cd-rajeev.azurewebsites.net/")

    @task(2)
    def test2(self):
        self.client.post("https://devops-ci-cd-rajeev.azurewebsites.net:443/predict",json=
                {
                    "CHAS":{
                        "0":0
                    },
                    "RM":{
                        "0":6.575
                    },
                    "TAX":{
                        "0":296.0
                    },
                    "PTRATIO":{
                        "0":15.3
                    },
                    "B":{
                        "0":396.9
                    },
                        "LSTAT":{
                    "0":4.98
                    }
                }
                )
        json_var = response.json()
        request_id = json_var['prediction']
