provider "aws" {
  region = "ap-south-1"
}
resource "aws_sns_topic" "alerts" {
  name = "my-alerts"
}
resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = "tyagipooja371@gmail.com"
}
output "topic_arn" {
  value = aws_sns_topic.alerts.arn
}
