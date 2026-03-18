provider "aws" {
  region = "us-east-1"
}

# Create SCP to deny open security groups
resource "aws_organizations_policy" "deny_open_sg" {
  name        = "deny-open-security-groups"
  description = "Deny security group rules with 0.0.0.0/0"
  type        = "SERVICE_CONTROL_POLICY"

  content = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "DenyOpenIngress"
        Effect = "Deny"
        Action = [
          "ec2:AuthorizeSecurityGroupIngress"
        ]
        Resource = "*"
        Condition = {
          "IpAddressIfExists" = {
            "ec2:CidrIp" = "0.0.0.0/0"
          }
        }
      },
      {
        Sid    = "DenyOpenEgress"
        Effect = "Deny"
        Action = [
          "ec2:AuthorizeSecurityGroupEgress"
        ]
        Resource = "*"
        Condition = {
          "IpAddressIfExists" = {
            "ec2:CidrIp" = "0.0.0.0/0"
          }
        }
      }
    ]
  })
}

# Organizational Unit
resource "aws_organizations_organizational_unit" "engineering_ou" {
  name      = "Engineering"
  parent_id = "r-root" # replace with actual root ID
}

# Attach SCP to OU
resource "aws_organizations_policy_attachment" "attach_policy" {
  policy_id = aws_organizations_policy.deny_open_sg.id
  target_id = aws_organizations_organizational_unit.engineering_ou.id
}

# Example: Additional Guardrail (Optional but strong)
resource "aws_organizations_policy" "restrict_regions" {
  name        = "restrict-regions"
  description = "Allow only specific AWS regions"
  type        = "SERVICE_CONTROL_POLICY"

  content = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "DenyOutsideApprovedRegions"
        Effect = "Deny"
        Action = "*"
        Resource = "*"
        Condition = {
          "StringNotEquals" = {
            "aws:RequestedRegion" = [
              "us-east-1",
              "us-west-2"
            ]
          }
        }
      }
    ]
  })
}

resource "aws_organizations_policy_attachment" "attach_region_policy" {
  policy_id = aws_organizations_policy.restrict_regions.id
  target_id = aws_organizations_organizational_unit.engineering_ou.id
}
