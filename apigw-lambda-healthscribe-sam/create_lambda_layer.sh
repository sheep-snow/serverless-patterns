#!/bin/bash

# Take Lambda Layer Name
read -p "Enter the name of the Layer: " layer_name

# Take Region
read -p "Enter the deployment region: " region

# Publish the layer:
echo "Publishing the layer. Please wait ..."
aws lambda publish-layer-version --layer-name $layer_name --zip-file fileb://boto3-healthscribe-layer.zip --region $region

# Take Layer ARN
read -p "Enter the LayerVersionArn from the above command: " layer_arn

# Take Lambda Function Nameß
read -p "Enter the Lambda function name from the SAM deploy output: " function_name


# Add the new layer to your Lambda function's configuration

echo "Adding the new layer to your Lambda function's configuration. Please wait ..."
aws lambda update-function-configuration --function-name $function_name --layers $layer_arn --region $region