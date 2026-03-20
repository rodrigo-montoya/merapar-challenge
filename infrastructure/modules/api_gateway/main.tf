# initialize API
resource "aws_apigatewayv2_api" "the_gateway" {
    name = "the-gateway"
    protocol_type = "HTTP"
}

# API calls lambda
resource "aws_apigatewayv2_integration" "lambda" {
    api_id = aws_apigatewayv2_api.the_gateway.id

    integration_type = "AWS_PROXY"
    integration_uri = var.lambda_invoke_arn
}

# define endpoint
resource "aws_apigatewayv2_route" "get_string" {
    api_id = aws_apigatewayv2_api.the_gateway.id
    route_key = "GET /the_string"

    target = "integrations/${aws_apigatewayv2_integration.lambda.id}"
}

# deploy of your API
resource "aws_apigatewayv2_stage" "default" {
    api_id = aws_apigatewayv2_api.the_gateway.id
    name = "$default"
    auto_deploy = true
}

# permission for api gateway to invoke lambda
resource "aws_lambda_permission" "allow_apigw" {
    statement_id  = "AllowAPIGatewayInvoke"
    action = "lambda:InvokeFunction"
    function_name = var.lambda_name
    principal = "apigateway.amazonaws.com"

    source_arn = "${aws_apigatewayv2_api.the_gateway.execution_arn}/*/*"
}
