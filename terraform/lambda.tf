
resource "aws_lambda_function" "mongo-lambda" {
  function_name             = "mongodb-lambda-travel-tutorial"

  filename                  = "../archive.zip"
  handler                   = "app.handler"
  source_code_hash          = "${base64sha256(file("../archive.zip"))}"
  runtime                   = "nodejs8.10"

  timeout                   = 30
  memory_size               = 256

  role                      = "arn:aws:iam::389795768041:role/Lambda_Role"

  environment {
    variables {
      MONGODB_ATLAS_CLUSTER_URI = "mongodb+srv://lambdauser:${var.password}@${var.host}/travel?retryWrites=true"
    }
  }
}