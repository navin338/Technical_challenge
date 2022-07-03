
provider aws {
  alias   = "programmatic"
  profile = "prod-sa-Test-AVM_prog"
  region  = "us-east-2"
}



########### IAM role build

data "aws_iam_policy_document" "instance-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

##What ever arn we are adding that would go directly to trusted relation configuration under this rol
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::123456789:role/CAXX/rolename"]
    }
  }
}



resource "aws_iam_role" "instance" {
  name               = "test-ceng-deploy11"
  permissions_boundary = "arn:aws:iam::123456789:policy/CAXX/test-GlobalPermissionsBoundary"
  assume_role_policy = data.aws_iam_policy_document.instance-assume-role-policy.json
}


######policy with ec2, s3



resource "aws_iam_policy" "this" {
  name = "policy-618033"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        
        Effect   = "Allow"
        Action   = [
            "ec2:*",
            "s3:*"    
            ]
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "this_role_policy_attachment" {

  role       = aws_iam_role.instance.name
  policy_arn = aws_iam_policy.this.arn
}