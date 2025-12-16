<p align="center">
  <img src="https://raw.githubusercontent.com/charmarr/.github/main/assets/charmarr.png" width="350" alt="Charmarr">
</p>

<h1 align="center">Charmarr</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Juju-charms-E95420?logo=ubuntu" alt="Juju">
  <img src="https://img.shields.io/badge/Kubernetes-substrate-326CE5?logo=kubernetes&logoColor=white" alt="Kubernetes">
  <img src="https://img.shields.io/badge/media-automation-purple?logo=vlcmediaplayer" alt="Media Automation">
</p>

> A charmed, Kubernetes-native servarr stack for the masochists who want scalable, reliable, observable, and frankly over-engineered media automation. Because why solve problems simply when you can suffer beautifully?

---

## The Problem

After two failed attempts at building a self-hosted media server (no automation, zero observability, no backups, questionable security), I noticed a pattern across all ARR solutions: **deployment is easy, but cross-application configuration remains painful**. Add Kubernetes to the mix and you're raw-dogging PVs, PVCs, NetworkPolicies, and storage backends. The [k8s@home](https://github.com/k8s-at-home) project was amazing but deprecated. Most K8s-based ARR solutions share the same fate.

## The Solution: Juju Charms

[Juju charms](https://canonical.com/juju) have [relations](https://documentation.ubuntu.com/juju/3.6/reference/relation/) - when you integrate Radarr with SABnzbd, they automatically configure themselves. No manual setup.

**What this enables:**
- Automated cross-application configuration
- Thin wrappers that handle K8s complexity (networking, storage, ingress)
- Modular opt-in features (observability, service mesh, secrets management)

## What is Charmarr?

Charmarr is **not a media server** - it's a **media server management system**. It provides charmed versions of ARR apps with:

- **Automated configuration** via Juju relations
- **Terraform/Terragrunt** for lifecycle management
- **Optional integrations** with COS (observability), service mesh, Vault, IAM

---

## The Ecosystem

| Project | Description |
|---------|-------------|
| **Charmarr** | The charmed servarr stack |
| **Flintarr** | AI agent for stack management (state, logs, metrics) |
| **Configuratarr** | TUI for Terraform configuration |

---

## Roadmap

🟢 Organization, repos, logos<br>
🟢 Charm template<br>
🟢 Community guidelines & licenses<br>
🟢 Architecture Decision Records<br>
🟢 VXLAN design validation<br>
🟠 Shared charm libraries<br>
⚪ `gluetun-k8s` charm<br>
⚪ `tailscale-connector-k8s` charm<br>

---

## Is This Overkill?

**Yes.** This is for intermediate to advanced homelab users with Kubernetes knowledge. If you want something simpler, check out [yams](https://yams.media/). If you want to over-engineer your media server while learning about K8s, charms, and service meshes... welcome home.

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

*Built with ❤️, spite, and a little too much free time*

[Mandatory xkcd](https://xkcd.com/2021)
