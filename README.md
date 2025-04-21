# Horusec IaC Demo

This repository contains intentionally insecure Infrastructure as Code (IaC) examples in Terraform and Ansible for educational purposes. It integrates [Horusec](https://horusec.io) to perform SAST analysis automatically via GitHub Actions.

## Usage

The GitHub Action scans the repository on every push to the `main` branch or on pull requests.

### Local Scan (Optional)

To scan locally with Docker:

```bash
docker run -v $(pwd):/src horuszup/horusec-cli:latest horusec start -p /src
```

If you're running without Docker (e.g. in environments like GitHub Actions), use:

```bash
horusec start -D -p ./ --config-file-path="./horusec-config.json"
```

---

## Explanation of GitHub Actions Error

If Horusec reports the following error:

```bash
Error: docker not found. Please check and try again
```

This means the environment where Horusec is running (e.g., GitHub Actions) **does not have Docker installed**, and by default, Horusec uses Docker for many of its scanners.

To fix this, the GitHub Action uses the `-D` flag (`--disable-docker`) to run only non-Docker-based scanners such as:
- horusec-csharp
- horusec-java
- horusec-kotlin
- horusec-javascript
- horusec-dart
- horusec-kubernetes
- horusec-leaks

This still allows for effective analysis of IaC, source code, and secrets.

---

## Directory Structure

- `/terraform`: Contains Terraform configuration files with intentionally insecure setups.
- `/ansible`: Contains an Ansible `playbook.yaml` with insecure configurations (e.g. creating users with weak passwords). This is included to test Horusec's ability to detect misconfigurations in configuration management tools.

---

## Output

After the scan, results are saved in a JSON file named `horusec-results.json`. This is uploaded as an artifact in the CI pipeline for further inspection.

To include more details or debug the scan, you can add:

```bash
--log-level=debug
```

Or enable informational vulnerabilities with:

```bash
--information-severity=true
```

---