#!/bin/bash
set -x
ACCOUNT_ID=$(aws sts get-caller-identity | jq -r .Account)
VPC_ID=$(aws eks describe-cluster \
                --name $CLUSTER_NAME \
                --query "cluster.resourcesVpcConfig.vpcId" \
                --output text)
CLUSTER_NAME=SydFgAlfOs
AWS_REGION=$1
POLICY_NAME=AwsEksEfsCsiDriverPolicy
POLICY_FILE=$POLICY_FILE.json
wget -O $POLICY_FILE https://github.com/kubernetes-sigs/aws-efs-csi-driver/raw/master/docs/iam-policy-example.json
aws iam create-policy \
    --policy-name  $POLICY_NAME \
    --policy-document file://$POLICY_FILE
    POLICY_ARN=$(aws iam list-policies --query "Policies[?PolicyName=='$POLICY_NAME']" | jq -r .[].Arn)


eksctl create iamserviceaccount \
    --cluster $CLUSTER_NAME \
    --namespace kube-system \
    --name efs-csi-controller-sa \
    --attach-policy-arn $POLICY_ARN \
    --approve \
    --region $AWS_REGION

set +x
