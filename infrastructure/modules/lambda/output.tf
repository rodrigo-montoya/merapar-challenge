output "lambda_arn" {
    value = aws_lambda_function.string_fetcher_lambda.arn
}

output "invoke_arn" {
    value = aws_lambda_function.string_fetcher_lambda.invoke_arn
}
