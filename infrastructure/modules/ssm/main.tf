resource "aws_ssm_parameter" "dynamic_string" {
    name = "/merapar_challenge/dynamic_string"
    type = "String"
    value = var.initial_string
}