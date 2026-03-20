provider "aws" {
    region = "us-east-1"
}

module "lambda" {
    source = "./infrastructure/modules/lambda"

    function_name = "get_string"
    filename = "${path.module}/backend/get_string.zip"
}

module "api_gateway" {
    source = "./infrastructure/modules/api_gateway"

    lambda_invoke_arn = module.lambda.invoke_arn
    lambda_name = "get_string"
}

module "ssm" {
    source = "./infrastructure/modules/ssm"

    initial_string = "merapar"
}

