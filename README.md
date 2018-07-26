# PCF Workstation VM

This repository contains code to create a pre-configured virtual machine that can be used when working with PCF. The main expected use-case for this VM is to provide a combined jumpbox and utility server for proof-of-concept exercises when operating on customer premises.

Note: This code does not provide explicit access to any Pivotal assets that would otherwise be obtained via Pivotal Network. All components installed on the VM are publicly accessible via package managers, GitHub repositories or other open distribution networks.

## Highlights

A list of the key characteristics of this VM:

- Ubuntu 16.04 LTS Server
- Desktop and XRDP server
- Docker CE, Docker Compose and Docker Registry
- Java development environment, including Spring Tool Suite
- Visual Studio Code
- Concourse
- Nginx
- Various Pivotal-related tools
- Commonly used tools for POC efforts
- Sample PCF-related codebases

It is also possible to optionally enable downloading various distributables from Pivotal Network in order to facilitate air-gapped installs. This requires an existing PivNet API key in order to obtain valid access.

## Languages/Platforms

A number of languages and platforms are pre-installed:

- Java (OpenJDK 8) + Maven
- Golang
- NodeJS
- .NET Core SDK 2.X

## Command-line Tools

The following is a full listing of the command-line tools which are installed:

| Utility | Purpose |
|---------------|----------------------|
| `cf` | CloudFoundry CLI tool |
| `fly` | Concourse CLI tool |
| `om` | Pivotal OpsManager CLI tool |
| `pivnet` | Pivotal Network CLI tool |
| `terraform` | Well known tool that can be used to automate infrastructure provisioning |
| `speedtest-cli` | Perform network speed tests from a CLI, which can be used to validate network speeds are appropriate for downloading large files from the likes of PivNet |
| `govc` | VMWare CLI for interacting with vCenter |
| `kubectl` | Kubernetes CLI tool, necessary for working with PKS |
| `ab` | Apache Bench tool used to generate simple HTTP load against endpoints |
| `curl` | Access HTTP endpoints, useful for debugging and downloading certain files |
| `wget` | Download files over HTTP |
| `dig` | Perform DNS queries, useful for validating and debugging DNS configuration |
| `git` | Interact with git repositories |
| `jq` | Work with JSON in a bash shell, useful for automation scripts |
| `httpie` | A more advanced version of curl |
| `aria2c` | Advanced tool for downloading files over HTTP, allows multi-threaded connections which is useful for working around certain network throttling configurations |
| `ntpdate` | Interact with NTP servers, useful for debugging NTP configuration and related network issues |


## Building

In order to build the VM locally the `packer` utility must be installed, as well as Virtualbox.

Note: It is recommended to build this on a network with a reasonable amount of bandwidth, as several large files are downloaded from the Internet.

From the root of the code checkout, run the following command:

`packer build packer.json`
