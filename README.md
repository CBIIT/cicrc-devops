# cicrc-devops

## AWS resources

| AWS resource | Type        | Name              | Purpose           |
|--------------|-------------|-------------------|-------------------|
| EC2          | t3.2xlarge  | ncias-d2999-c     | Jenkins builds    |
| RDS          | db.t3.micro | cicrc-dev-mysql   | Drupal DB         |
| RDS          | db.t3.micro | cicrc-qa-mysql    | Drupal DB         |
| ECS          | fargate     | cicrc-dev-ecs     | portal container  |
| ECS          | fargate     | cicrc-qa-ecs      | portal container  |
| RDS          | db.t3.micro | cicrc-stage-mysql | staging DB        |
| RDS          | db.t3.micro | cicrc-prod-mysql  | PROD DB           |
| EC2          | t3.2xlarge  | ncias-s3580-c     | Jenkins deploy    |
| EC2          | t3.large    | nciws-s2522-c     | staging (retired) |
| EC2          | t3.large    | nciws-p2521-c     | PROD              |

## build, test and deployment

web_task.json defines the ECS task aka CRCR container.

### DEV and QA
All pipelines are under Dashboard/_default/_lower/CICRC

* CICRC-DB-Backup-Restore; We can backup or restore the databases. Currently it only works for QA. It should be fixed
for DEV
* CICRC-Filesystem-Sync; copies from DEV EFS to QA EFS. This is kept for historical reason and it does not make sense
to use it anymore
* CICRC-Image-Build; creates docker image and publishes it to ECR
* CICRC-Image-Deploy; deploys the docker image. 
* CRCR-web-portal-test; to run tests and see the result

### staging and PROD
All pipelines are under Dashboard/_default/_upper/CICRC
* CICRC-Image-Deploy; deploy an image that was built and published to ECR. All docker images are kept in lower tier ECR
as this is the best practice. ECR lifecycle policy keeps the last 10 main.* builds.