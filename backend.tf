terraform {
  backend "s3" {
    bucket         = "ecs-bluegreen-tf-state-12345"
    key            = "ecs-bluegreen/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
