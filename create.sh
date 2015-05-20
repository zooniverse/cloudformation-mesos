#!/bin/bash

aws cloudformation create-stack \
    --template-body file://mesos.json \
    --stack-name panoptes-mesos \
    --capabilities CAPABILITY_IAM \
    --parameters \
        ParameterKey=KeyName,ParameterValue=zooniverse_1 \
        ParameterKey=ExhibitorDiscoveryUrl,ParameterValue=http://internal-mesos-zoo-ElasticL-1O6HW0LZJ3YZS-1966439055.us-east-1.elb.amazonaws.com/exhibitor/v1/cluster/list \
        ParameterKey=ZkClientSecurityGroup,ParameterValue=sg-50551034 \
        ParameterKey=VpcId,ParameterValue=vpc-10694c75 \
        ParameterKey=Subnets,ParameterValue='subnet-23e49354' \
        ParameterKey=AdminSecurityGroup,ParameterValue=sg-4e2b6e2a \
        ParameterKey=MesosMasterTemplateUrl,ParameterValue=https://s3.amazonaws.com/zooniverse-code/cloudformation/mesos-master.json \
        ParameterKey=MesosSlaveTemplateUrl,ParameterValue=https://s3.amazonaws.com/zooniverse-code/cloudformation/mesos-slave.json
