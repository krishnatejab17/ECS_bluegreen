variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "ecs-bluegreen"
}

variable "image_tag" {
  type        = string
  description = "Docker image tag"
}
