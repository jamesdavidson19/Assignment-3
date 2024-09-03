The deployment runs on Kubernettes cluster and has a Postgres Database running

The application uses Docker to simplify the run process and is setup with Continuous Integration with CodeBuild. 

Codebuild uses the buildspec file and creates a docker image.

There is an IAM rule used by Codebuild to gain access to the ECR repository

If any updates are required to any of the configuration/docker files then a push into Github will trigger a new build run and produce a new docker image within the ECR repository. 

Once the update is completed the deployment files needs to be updaed with the image location and then run the deploymnet file

To verify service use:

kubectl get svc 
kubectl get pods

The DB access can be tested by running a curl command to the external loab balancer address which targets the Database. The loadbalancer listesn on port 5153

curl ae36fb024bc7c4424bec92aff2931da9-855240518.us-east-1.elb.amazonaws.com:5153/api/reports/daily_usage

example response:

{"2023-02-07":40,"2023-02-08":202,"2023-02-09":179,"2023-02-10":158,"2023-02-11":146,"2023-02-12":176,"2023-02-13":196,"2023-02-14":142}

