#!/bin/bash
set -x
eksctl create cluster -f $1/eksctl-createcluster-fgnonode.yaml 
#echo eksctl create cluster -f $1/eksctl-createcluster-fgnonode.yaml
eksctl utils associate-iam-oidc-provider \
    --region $1 \
    --cluster SydFgAlfOs \
    --approve
set +x
