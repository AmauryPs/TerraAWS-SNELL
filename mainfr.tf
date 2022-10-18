provider "aws" {
region     = var.aws_region
access_key = var.aws_access_key
secret_key = var.aws_secret_key
}

#Variable to declare the port to open on the securitygroup
variable "ingressrules_ports" {
	  type    = list(number)
	  default = [80, 443, 22]
}

#difference each.keay and each.value, comme pour python avec les dictonniaires https://www.middlewareinventory.com/blog/terraform-for-each-examples/
#iterator évite simplement d'écrire "each"

resource "aws_security_group" "sg-web-vpn-fr" {
  name        = "SG-VPN"
  description = "Allow ssh and standard http/https inbound and everything outbound"
  dynamic ingress {
    iterator = port
    for_each = var.ingressrules_ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
} 
#Create an EC2 Linux free tiers with latest AMI
resource "aws_instance" "EC2-SNELL-FR" {
  ami = data.aws_ami.latest-linux-amazon.id
  instance_type = "t2.micro"
  security_groups = [aws_security_group.sg-web-vpn-fr.name]
  key_name = aws_key_pair.key_pair-generated.key_name

  tags = {
    Name = "VPNServer"
  }

    provisioner "file" {
        source      = "snell-script.sh"
        destination = "snell-script.sh"
    }

    provisioner "remote-exec" {
      inline = [
      #"wget --no-check-certificate -O snell-script.bash https://raw.githubusercontent.com/AmauryPs/TerraAWSFR2/main/snell-script.bash",
      "chmod +x snell-script.sh",
      "sudo ./snell-script.sh",      
        ]
  }
   #Connect in SSH with ec2-user and use the created SSH key
   connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("${aws_key_pair.key_pair-generated.key_name}.pem")
  }
}

#Output the IP of the server, to add to client configuration
output "T-publicIP"{
  value = aws_instance.EC2-SNELL-FR.public_ip
}
