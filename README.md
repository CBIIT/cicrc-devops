# cicrc-devops

### AWS resources

| AWS resource | Type        | Name              | Purpose          |
|--------------|-------------|-------------------|------------------|
| EC2          | t3.2xlarge  | ncias-d2999-c     | Jenkins builds   |
| EC2          | t3.large    | nciws-q2535-c     | QA portal        |
| EC2          | t3.large    | nciws-d2524-c     | DEV portal       |
| EC2          | t3.2xlarge  | ncias-d3313-v     | ThinLinc POC     |
| RDS          | db.t3.micro | cicrc-dev-mysql   | Drupal DB        |
| RDS          | db.t3.micro | cicrc-qa-mysql    | Drupal DB        |
| ECS          | fargate     | cicrc-dev-ecs     | portal container |
| ECS          | fargate     | cicrc-qa-ecs      | portal container |
| RDS          | db.t3.micro | cicrc-stage-mysql | staging DB       |
| RDS          | db.t3.micro | cicrc-prod-mysql  | PROD DB          |
| EC2          | t3.large    | nciws-p2484-c     |                  |
| EC2          | t3.large    | nciws-s2522-c     |                  |
| EC2          | t3.large    | nciws-s2485-c     |                  |
| EC2          | t3.large    | nciws-p2521-c     |                  |
