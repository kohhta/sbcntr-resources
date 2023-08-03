## front-app setup




## p240

docker image build -t sbcntr-backend-koyama-koyama:v1 .

docker image ls --format "table {{.ID}} \t{{.Repository}}\t{{.Tag}}"

## image delete
docker image rm -f $(docker image ls- q)

AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query 'Account' --output text)

docker image tag sbcntr-backend-koyama:v1 ${AWS_ACCOUNT_ID}.dkr.ecr.us-west-2.amazonaws.com/sbcntr-backend-koyama:v1

aws ecr --region us-west-2 get-login-password | docker login --username AWS --password-stdin https://${AWS_ACCOUNT_ID}.dkr.ecr.us-west-2.amazonaws.com/sbcntr-backend-koyama

docker image push ${AWS_ACCOUNT_ID}.dkr.ecr.us-west-2.amazonaws.com/sbcntr-backend-koyama:v1

aws ecr create-repository --region us-east-2


docker tag sbcntr-backend-koyama:latest 526269109168.dkr.ecr.us-west-2.amazonaws.com/sbcntr-backend-koyama:v1

docker push 526269109168.dkr.ecr.us-west-2.amazonaws.com/sbcntr-backend-koyama:v1

docker pull 526269109168.dkr.ecr.us-west-2.amazonaws.com/sbcntr-backend-koyama:v1

docker container run -d -p 8080:80 526269109168.dkr.ecr.us-west-2.amazonaws.com/sbcntr-backend-koyama:v1

docker container ls --format "table {{.ID}} \t{{.Image}}\t{{.Status}}\t{{.Ports}}"



## front
docker tag sbcntr-frontend-koyama:latest 526269109168.dkr.ecr.us-west-2.amazonaws.com/sbcntr-frontend-koyama:v1

docker push 526269109168.dkr.ecr.us-west-2.amazonaws.com/sbcntr-frontend-koyama:v1

# aurora DB作成

hwBxrgu61bmWhc1d1kPE

sbcntr-db.cluster-cls6ilk0ixy8.us-west-2.rds.amazonaws.com


mysql -h sbcntr-db.cluster-cls6ilk0ixy8.us-west-2.rds.amazonaws.com -u admin -p

SELECT Host, User FROM mysql.user;

CREATE USER sbcntruser@'%' IDENTIFIED BY 'sbcntrEncP';

GRANT ALL ON sbcntrapp.* TO sbcntruser@'%' WITH GRANT OPTION;

CREATE USER migrate@'%' IDENTIFIED BY 'sbcntrMigrate';

GRANT ALL ON sbcntrapp.* TO migrate@'%' WITH GRANT OPTION;

GRANT ALL ON `prisma_migrate_shadow_db%`.* TO migrate@'%' WITH GRANT OPTION;

## テーブルとデータ作成
mysql -h sbcntr-db.cluster-cls6ilk0ixy8.us-west-2.rds.amazonaws.com -u sbcntruser -p
mysql -h sbcntr-db.cluster-cls6ilk0ixy8.us-west-2.rds.amazonaws.com -u sbcntruser -psbcntrEncP


mysql -h sbcntr-db.cluster-cls6ilk0ixy8.us-west-2.rds.amazonaws.com -u migrate -p

export DB_USERNAME=migrate
export DB_PASSWORD=sbcntrMigrate
export DB_HOST=sbcntr-db.cluster-cls6ilk0ixy8.us-west-2.rds.amazonaws.com
export DB_NAME=sbcntrapp

npm run migrate:dev
npm run seed


## p328
curl http://internal-sbcntr-alb-internal-koyama-904403373.us-west-2.elb.amazonaws.com:80/v1/Notifications?id=1


## 329 front-app 疎通確認

AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query 'Account' --output text)

aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 526269109168.dkr.ecr.us-west-2.amazonaws.com

docker build -t sbcntr-frontend-koyama .

docker tag sbcntr-frontend-koyama:latest 526269109168.dkr.ecr.us-west-2.amazonaws.com/sbcntr-frontend-koyama:dbv1

docker push 526269109168.dkr.ecr.us-west-2.amazonaws.com/sbcntr-frontend-koyama:dbv1



docker image tag sbcntr-frontend-koyama:latest ${AWS_ACCOUNT_ID}.dkr.ecr.us-west-2.amazonaws.com/sbcntr-frontend-koyama:dbv1

aws ecr --region us-west-2 get-login-password | docker login --username AWS --password-stdin https://${AWS_ACCOUNT_ID}.dkr.ecr.us-west-2.amazonaws.com/sbcntr-frontend-koyama
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 526269109168.dkr.ecr.us-west-2.amazonaws.com

docker image push ${AWS_ACCOUNT_ID}.dkr.ecr.us-west-2.amazonaws.com/sbcntr-frontend-koyama:dbv1

## p340

## p352
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query 'Account' --output text)

aws ecr --region us-west-2 get-login-password | docker login --username AWS --password-stdin https://526269109168.dkr.ecr.us-west-2.amazonaws.com/sbcntr-base-koyama

docker image tag golang:1.16.8-alpine3.13 526269109168.dkr.ecr.us-west-2.amazonaws.com/sbcntr-base-koyama:golang1.16.8-alpine3.13

docker image push 526269109168.dkr.ecr.us-west-2.amazonaws.com/sbcntr-base-koyama:golang1.16.8-alpine3.13

FROM 526269109168.dkr.ecr.us-west-2.amazonaws.com/sbcntr-base-koyama:golang1.16.8-alpine3.13 AS build-env

## p377
curl http://internal-sbcntr-alb-internal-koyama-904403373.us-west-2.elb.amazonaws.com:80/v1/Items



# 396

docker image build -t sbcntr-log-router-koyama .

aws ecr --region us-west-2 get-login-password | docker login --username AWS --password-stdin https://526269109168.dkr.ecr.us-west-2.amazonaws.com/sbcntr-base-koyama

docker image tag sbcntr-log-router-koyama:latest 526269109168.dkr.ecr.us-west-2.amazonaws.com/sbcntr-base-koyama:log-router

docker image push 526269109168.dkr.ecr.us-west-2.amazonaws.com/sbcntr-base-koyama:log-router


# p411
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query 'Account' --output text)

aws ecr --region us-west-2 get-login-password | docker login --username AWS --password-stdin https://526269109168.dkr.ecr.us-west-2.amazonaws.com/sbcntr-base-koyama

docker image tag fargate-bastion:latest 526269109168.dkr.ecr.us-west-2.amazonaws.com/sbcntr-base-koyama:bastion

docker image push 526269109168.dkr.ecr.us-west-2.amazonaws.com/sbcntr-base-koyama:bastion

mysql -h sbcntr-db.cluster-cls6ilk0ixy8.us-west-2.rds.amazonaws.com -u migrate -p
