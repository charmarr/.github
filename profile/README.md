<p align="center">
  <img src="https://raw.githubusercontent.com/charmarr/.github/main/assets/charmarr.png" width="350" alt="Charmarr">
</p>

<h1 align="center">Charmarr</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Juju-charms-E95420?logo=ubuntu" alt="Juju">
  <img src="https://img.shields.io/badge/Kubernetes-substrate-326CE5?logo=kubernetes&logoColor=white" alt="Kubernetes">
  <img src="https://img.shields.io/badge/media-automation-purple?logo=vlcmediaplayer" alt="Media Automation">
</p>

A collection of charmed ARR services for self-hosted media server setups that run on Kubernetes substrate.

## What is Charmarr?

Charmarr is a media server management system. It provides charmed versions of ARR apps with:

- **Automated configuration** via Juju relations
- **Terraform/Terragrunt** for lifecycle management
- **Optional integrations** with other charmed solutions like observability, service mesh, Vault, IAM

## Why charms?

[Juju charms](https://canonical.com/juju) have a concept called [relations](https://documentation.ubuntu.com/juju/3.6/reference/relation/).

**What this enables:**
- Automated cross-application configuration. For ex. just `relate` radarr with sabnzbd and they configure themselves with each other's information
- Thin wrappers that handle K8s complexity (networking, storage, ingress)
- Modular opt-in features because of existing mature charms (observability, service mesh, secrets management)

## Roadmap

| Track 1 | Track 2 |
|---------|---------|
| 🟢 Organization, repos, logos | ⚪ `seerr-k8s` charm |
| 🟢 Charm template | ⚪ Observability integration with [`COS`](https://documentation.ubuntu.com/observability/track-2/) |
| 🟢 Community guidelines & licenses | ⚪ Postgres support for ARRs to enable HA |
| 🟢 Architecture Decision Records | ⚪ `tailscale-connector-k8s` charm |
| 🟢 VXLAN design validation | |
| 🟢 Shared charm libraries | |
| 🟢 `charmarr-storage-k8s` charm | |
| 🟢 `gluetun-k8s` charm | |
| 🟢 `qbittorrent-k8s` charm | |
| 🟢 `sabnzbd-k8s` charm | |
| 🟢 `prowlarr-k8s` charm | |
| 🟢 `flaresolverr-k8s` charm | |
| 🟢 `radarr-k8s` charm | |
| 🟢 `sonarr-k8s` charm | |
| 🟢 `plex-k8s` charm | |
| 🟢 `overseer-k8s` charm | |
| 🟢 Charmhub track guardrails | |
| 🟢 Validate and version terraform modules | |
| 🟢 Charmarr product level terraform module | |
| 🟢 Dogfooding phase - ~99.9% uptime over 2 months | |
| 🟢 Documentation | |
| 🟢 Solution level periodic itests | |
| 🟢 Fix repo automations | |
| 🔴 Threat modelling for track v1 | |
| 🟠 Charmarr track 1/stable release | |

## Contributing

Contributions welcome! Look at the [charmarr](https://github.com/charmarr/charmarr) repo for guidelines.

## License

- **Services**: AGPL-3.0
- **Libraries**: LGPL-3.0
- **Tools**: GPL-3.0
- **Docs**: CC-BY-SA-4.0

Use it, fork it, don't be a dick and keep it open. 🌸

---

[Mandatory xkcd](https://xkcd.com/2021)
