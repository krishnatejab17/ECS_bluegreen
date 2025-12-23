resource "aws_ecs_service" "green" {
  name            = "green-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = 0   # initially ZERO
  launch_type     = "FARGATE"

  network_configuration {
    subnets = [
      aws_subnet.private_a.id,
      aws_subnet.private_b.id
    ]
    security_groups  = [aws_security_group.ecs_service_sg.id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.green_tg.arn
    container_name   = "app"
    container_port   = 5000
  }

  depends_on = [
    aws_lb_listener.http_listener
  ]
}
