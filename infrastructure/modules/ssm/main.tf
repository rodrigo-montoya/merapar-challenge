# dynamic string stored in parameter store
resource "aws_ssm_parameter" "dynamic_string" {
    name = "/merapar-challenge/dynamic-string"
    type = "String"
    value = var.initial_string
}
