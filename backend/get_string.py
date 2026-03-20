import boto3

ssm = boto3.client("ssm")

# gets dynamic string from parameter store and serves the html
def serve_html():
    response = ssm.get_parameter(Name = "/merapar-challenge/dynamic-string")

    value = response["Parameter"]["Value"]

    html = f"<h1>The saved string is {value}</h1>"

    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "text/html"
        },
        "body": html
    }

#lambda handler
def handler(event, context):
    return serve_html()
