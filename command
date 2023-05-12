




## p240

docker image build -t sbcntr-backend-koyama-koyama:v1 .

docker image ls --format "table {{.ID}} \t{{.Repository}}\t{{.Tag}}"
docker image ls --format "table {{.ID}} \t{{.Repository}}\t{{.Tag}}"

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