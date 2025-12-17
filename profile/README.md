<p align="center">
  <img src="https://raw.githubusercontent.com/charmarr/.github/main/assets/charmarr.png" width="350" alt="Charmarr">
</p>

<h1 align="center">Charmarr</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Juju-charms-E95420?logo=ubuntu" alt="Juju">
  <img src="https://img.shields.io/badge/Kubernetes-substrate-326CE5?logo=kubernetes&logoColor=white" alt="Kubernetes">
  <img src="https://img.shields.io/badge/media-automation-purple?logo=vlcmediaplayer" alt="Media Automation">
</p>

---

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

---

## Roadmap

🟢 Organization, repos, logos<br>
🟢 Charm template<br>
🟢 Community guidelines & licenses<br>
🟢 Architecture Decision Records<br>
🟢 VXLAN design validation<br>
🟢 Shared charm libraries<br>
🟠 `charmarr-storage-k8s` charm<br>
⚪ `gluetun-k8s` charm<br>
⚪ `tailscale-connector-k8s` charm<br>

---

## Is This Overkill?

**Yes.** If you want something simpler, check out [yams](https://yams.media/).

---

## Contributing

Contributions welcome! Alpha project - expect breaking changes.

## License

- **Services**: AGPL-3.0
- **Libraries**: LGPL-3.0
- **Tools**: GPL-3.0
- **Docs**: CC-BY-SA-4.0

Use it, fork it, keep it open. 🌸

---

[Mandatory xkcd](https://xkcd.com/2021)
