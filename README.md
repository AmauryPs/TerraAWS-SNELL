<!-- Template from https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>


<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/surge-networks/snell">
    <img src="https://raw.githubusercontent.com/Dreamacro/clash/master/docs/logo.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">Terraform-AWS-Snell</h3>

  <p align="center">
    <br />
    <a href="https://github.com/AmauryPs/TerraAWS-SNELL">View Demo</a>
    ·
    <a href="https://github.com/AmauryPs/TerraAWS-SNELL/issues">Report Bug</a>
    ·
    <a href="https://github.com/AmauryPs/TerraAWS-SNELL/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#thanks">Thanks</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

This is a personal project, as I am living in China, I wanted to have my own VPN to bypass the GFW. This Terraform script creates an EC2 Linux instance with the latest AMI, apply a security group and install [Snell](https://github.com/surge-networks/snell).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

* [![Terraform][Terraform-tf]][Terraform-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

You will need to have Terraform installed on your machine and some quick knowledge on how to create an IAM user for AWS. 

### Prerequisites

* []()Terraform version 1.3.2 >.
* An AWS account with the region you want the EC2 instance to be installed.
* The access key for your Amazon account.

### Installation

1. [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli).
2. Clone the repo
   ```sh
   git clone https://github.com/AmauryPs/TerraAWS-SNELL.git
   ```
3. Create a `variables.tfvars` file (note that my .gitignore ignore this file, if you upload your AWS keys to Github, AWS will find it and lock your IAM account with a policy that you need to remove with your root user) and modify the keys and the region for the AWS provider, you may follow the official [guide](https://aws.amazon.com/premiumsupport/knowledge-center/create-access-key/), it's quite easy, note well the Access and Secret keys as AWS shows only them. You can find the code of the region you want your instance to be in the column 'Region' of this [table](https://aws.amazon.com/premiumsupport/knowledge-center/create-access-key/), example `eu-west-3`
   ```hc1
   aws_access_key = "Your_access_key"
   aws_secret_key = "Your_secrect_key"
   aws_region     = ""
   ```
4. In `snell-script.sh`modify the PSK, it should be 31 characters, you will need this PSK to configure the VPN client on your machine or phone. You can also modify the port number and the obfuscation type, by default port is `443` and obfs is `http`.
   ```sh
   PSK="6NvFIU307789MlKPD6Ihxql0V"
   ```
5. Simply execute the Terraform files.
      ```hc1
   terraform init
   terraform apply
   ```
6. At the end of the script, Terraform will output the public IP address of your instance, note it to pass it into the configuration file of Clash.
   ```hc1
    Outputs:
    T-publicIP = "13.39.51.62"
   ```
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->
## Usage

To connect to Snell VPN on your machine, please refer to the [Documentation of Clash](https://github.com/Dreamacro/clash)

Here is a working `.yaml` configuration file for Clash:
   ```sh
port: 7890
socks-port: 7891
allow-lan: false
mode: Global
log-level: info
external-controller: 127.0.0.1:9090
secret: ""
proxies:
  - name: "snellAws"
    type: snell
    server: PublicIPOfYourInstance
    port: 443
    psk: ThePSKYouChoose
    version: 3
    obfs-opts:
     mode: http
     host: bing.com
Rule:
  - MATCH,DIRECT

   ```
<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

- [ ] Script the whole thing and allow input for:
    - [ ]  The Aws region 
    - [ ]  PSK
    - [ ]  PORTS
- [ ] Automatically create a `conf.yaml` for Clash.
- [ ] Save and sort every connection logs to any websites.

See the [open issues](https://github.com/AmauryPs/TerraAWS-SNELL/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
## License

No License

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Thanks -->
## Thanks

* [Surge Network](https://github.com/surge-networks/snell)
* [Clash](https://github.com/Dreamacro/clash)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[Terraform-tf]:https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white
[Terraform-url]:https://www.terraform.io/
[contributors-shield]: https://img.shields.io/github/contributors/github_username/repo_name.svg?style=for-the-badge
[contributors-url]: https://github.com/github_username/repo_name/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/github_username/repo_name.svg?style=for-the-badge
[forks-url]: https://github.com/github_username/repo_name/network/members
[stars-shield]: https://img.shields.io/github/stars/github_username/repo_name.svg?style=for-the-badge
[stars-url]: https://github.com/github_username/repo_name/stargazers
[issues-shield]: https://img.shields.io/github/issues/github_username/repo_name.svg?style=for-the-badge
[issues-url]: https://github.com/github_username/repo_name/issues
[license-shield]: https://img.shields.io/github/license/github_username/repo_name.svg?style=for-the-badge
[license-url]: https://github.com/github_username/repo_name/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png
