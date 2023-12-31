#Creates the ha policy for the DR implementation -- Name changes to *2 to avoid issues with PRD role

resource "aws_iam_policy" "hapolicy" {
  name        = "hapalo2"
  path        = "/"
  description = "hapalo2"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:DescribeNetworkInterfaces",
          "ec2:DescribeInstances",
          "ec2:DetachNetworkInterface",
          "ec2:AttachNetworkInterface"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

#Role creation based on the policy

resource "aws_iam_role" "ec2_role" {
  name = "hapalo2"
  assume_role_policy = jsonencode ({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
       },
      ]
    })
  }

# Attach policy to Role
  
  resource "aws_iam_policy_attachment" "ec2_policy_role" {
    name  = "ec2_attachment_2"
    roles = [aws_iam_role.ec2_role.name]
    policy_arn = aws_iam_policy.hapolicy.arn
   }

#Create policy profile so TF can attach role to VM

  resource "aws_iam_instance_profile" "ec2_profile" {
    name = "ec2_profile_2"
    role = aws_iam_role.ec2_role.name
   }
