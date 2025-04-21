# Horusec IaC Demo

This repository contains intentionally insecure Infrastructure as Code (IaC) examples in Terraform and Ansible for educational purposes. It integrates [Horusec](https://horusec.io) to perform SAST analysis automatically via GitHub Actions.

## Usage

The GitHub Action scans the repository on every push.

### Local Scan (Optional)

```bash
docker run -v $(pwd):/src horuszup/horusec-cli:latest horusec start -p /src
