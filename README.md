<!-- Template from https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>


<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/surge-networks/snell">
    <img src="https://raw.githubusercontent.com/Dreamacro/clash/master/docs/logo.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">project_title</h3>

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
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](https://example.com)

This is a personal project, as I am living in China I wanted to have my own VPN to bypass the GFW. This Terraform script creates an EC2 Linux instance and install [Snell](https://github.com/surge-networks/snell).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

* [![Terraform][Terraform-tf]][Terraform-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

You will need to have Terraform installed on your machine and some quick knowledge on how to create an IAM user for AWS. 

### Prerequisites

* []()Terraform version version 1.3.2 >.
* An AWS account with the region you want the EC2 instance to be installed.
* The access key for your Amazon account.

### Installation

1. Get a free API Key at [https://example.com](https://example.com)
2. Clone the repo
   ```sh
   git clone https://github.com/AmauryPs/TerraAWS-SNELL.git
   ```
3. In `variables.tfvars` modify the keys and the region.
   ```sh
   npm install
   ```
4. In `snell-script.sh`modify the PSK, you will need this PSK to configure the VPN client on your machine or phone.
   ```sh
   const API_KEY = 'ENTER YOUR API';
   ```
5. Simply execute the Terraform files.
      ```hc1
   terraform init
   terraform apply
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

To connect to Snell VPN on your machine, please refer to the [Documentation of Clash](https://github.com/Dreamacro/clash)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

- [ ] Script the whole thing and allow input for:
    - [ ]  The Aws region 
    - [ ]  PSK
    - [ ]  PORTS
- [ ] Automatically create a `conf.yaml` for Clash.
- [ ] Save and sort every connections logs to anywebsite.

See the [open issues](https://github.com/AmauryPs/TerraAWS-SNELL/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

No License

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
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
