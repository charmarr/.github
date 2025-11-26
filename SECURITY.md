# Security Policy

## Reporting a Vulnerability

The Charmarr project takes security seriously. If you discover a security vulnerability in any Charmarr project, please report it responsibly.

### How to Report

**Email**: security@charmarr.tv

**Please do not** open public GitHub issues for security vulnerabilities.

### What to Include

When reporting a vulnerability, please include:

- **Description** of the vulnerability
- **Affected repository** and version
- **Steps to reproduce** the issue
- **Potential impact** of the vulnerability
- **Suggested fix** (if you have one)
- **Your contact information** for follow-up

### Response Timeline

We are committed to responding promptly to security reports:

- **Initial Response**: Within 48 hours of receiving your report
- **Status Update**: Within 7 days with our assessment and next steps
- **Fix Timeline**: Depends on severity
  - **Critical**: Immediate priority, patch within days
  - **High**: High priority, patch within weeks
  - **Medium/Low**: Normal priority, addressed in upcoming releases

### What to Expect

1. **Acknowledgment**: We'll confirm receipt of your report
2. **Investigation**: We'll investigate and validate the vulnerability
3. **Fix Development**: We'll develop, test, and review a fix
4. **Coordinated Disclosure**: We'll work with you to coordinate public disclosure
5. **Credit**: We'll credit you in the security advisory (if you wish)

## Security Updates

Security updates are released as soon as possible after a vulnerability is confirmed and fixed.

### Notification Channels

- **GitHub Security Advisories**: Published in the affected repository
- **Release Notes**: Security fixes are highlighted in release notes
- **Critical Vulnerabilities**: Announced in project READMEs and community channels

## Supported Versions

We support the latest stable release of each project. Older versions may receive security updates for critical vulnerabilities at maintainer discretion.

| Version | Support Status      |
| ------- | ------------------- |
| latest  | ✅ Full support      |
| < 1.0   | ⚠️ Alpha/Beta - best effort |

Check individual repository README files for project-specific version support policies.

## Security-First Philosophy

Charmarr is a **security-first project**. We are committed to hardening security as much as possible so that everyone can access a secure, self-hosted media streaming platform without having to be paranoid.

Security is a community effort. We need your help to identify vulnerabilities, suggest improvements, and contribute hardening measures.

Charmarr will enforce security best practices by design, including:

- **Authentication & Authorization**: Built-in access controls
- **Network Security**: Secure defaults for ingress and service mesh integration
- **Secrets Management**: Proper handling of sensitive configuration
- **Least Privilege**: Services run with minimal required permissions

## User Best Practices

While Charmarr handles most security concerns by design, users should:

1. **Use Latest Stable Versions**: Always deploy the latest stable release
2. **Regular Updates**: Keep Charmarr and its dependencies up to date
3. **Enable Observability**: Deploy with monitoring and logging to detect anomalies
4. **Backup Regularly**: Maintain secure backups of configuration and data

## Third-Party Dependencies

Charmarr projects may depend on third-party software and services. We:

- Regularly update dependencies to address known vulnerabilities
- Use automated dependency scanning (Dependabot, etc.)
- Evaluate security of third-party integrations

Please verify the security and trustworthiness of any external images, services, or integrations you use with Charmarr.

## Scope

This security policy applies to all repositories under the Charmarr organization on GitHub.

## Contact

For security-related questions or concerns that are not vulnerabilities, you can also reach out to security@charmarr.tv.

---

Thank you for helping keep Charmarr and its users safe!
