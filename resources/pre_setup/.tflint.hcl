config {
  module = true
  deep_check = true
  force = false
  disabled_by_default = false
}

rule "aws_instance_invalid_type" {
  enabled = false
}

rule "aws_instance_previous_type" {
  enabled = false
}
