#!  /bin/bash
profile="default"
region="ap-south-1"
buildTag="shellscript-demo:latest"

echo "$1"
echo "$2"
echo "$3"

if [[ -n "$1" ]]; then
  profile="$1"
fi

if [[ -n "$2" ]]; then
  region="$2"
fi

if [[ -n "$3" ]]; then
  region="$3"
fi


aws ecr get-login-password --region "${region}" --profile "${profile}" | docker login --username AWS --password-stdin 500433121564.dkr.ecr.ap-south-1.amazonaws.com"
docker build -t devopsproject ." .
docker tag devopsproject:latest 500433121564.dkr.ecr.ap-south-1.amazonaws.com/devopsproject:latest"
docker push 500433121564.dkr.ecr.ap-south-1.amazonaws.com/devopsproject:latest"
