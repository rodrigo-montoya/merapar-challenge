# Options and Reasoning
My first idea was to have:
- an S3 bucket that hosts the frontend with a template file for the html with a javascript fetch to the API
- API-gateway for the endpoint
- endpoint calls the lambda which is serverless and is always better for cost efficiency
- the dynamic string stored in a file on an S3 bucket

Then i refined the solution to make it more minimalist
- the dynamic string could be stored in the parameter store instead of S3 or DynamoDB, that way its faster to modify
- theres no need to host the page on an S3, since its not a sofisticated frontend, its just one html line, the lambda alone can handle that.

Final solution is an endpoint created with API-gateway which calls a lambda that fetches the dynamic string from the parameter store and serves the html.

# Embellishment
i would definitely add a CI/CD pipeline with github actions for automatic redeploys on push.
maybe over engineer the solution more to show knowledge on other AWS services, like actually hosting a frontend on S3 with cloudfront to have faster availability.
a dynamodb for scalability if we wanted more strings to be stored.
use frameworks like fastAPI for the backend and React for the frontend to show knowledge there, and again for scalability purposes frameworks make life much easier.
but then again, i think the solution given was just enough for the challenge.
