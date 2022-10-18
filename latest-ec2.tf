#get latest ami EC2 Linux
#in Powershell aws ec2 describe-images --region eu-west-3 --owners amazon \
#--filters "Name=name,Values=amzn*" --query 'sort_by(Images, &CreationDate)[].Name'
#amzn2-ami-kernel-5.10-hvm-2.0.20220912.1-x86_64-gp2

data "aws_ami" "latest-linux-amazon" {
    most_recent = true
    owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-kernel-*-x86_64-gp2"]
  }
}  
