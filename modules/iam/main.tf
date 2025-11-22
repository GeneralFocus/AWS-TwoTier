resource "aws_iam_role" "ec2_role" {
  name = "${var.env_name}-EC2-Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })

  eridfckhjnm,  
  red'f/cv
  iukjrebdnmf ,c.vredfcvhiukj
}

resource "aws_iam_policy" "s3_read" {
  name = "${var.env_name}-S3ReadPolicy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = ["s3:GetObject"]
      Resource = ["${var.bucket_arn}/*"]
    }]
  })
}

# Good code only attach the policy after creating both role and policy
resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.s3_read.arn
}


resource "aws_iam_instance_profile" "profile" {
  name = "${var.env_name}-InstanceProfile"
  role = aws_iam_role.ec2_role.name
}
