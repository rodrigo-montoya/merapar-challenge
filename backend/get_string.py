import boto3

ssm = boto3.client("ssm")

def handler(event, context):
    response = ssm.get_parameter(Name = "/merapar_challenge/dynamic_string")

    value = response["Parameter"]["Value"]

    html = f"<h1>The saved string is {value}</h1>"

    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "text/html"
        },
        "body": html
    }
