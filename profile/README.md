# 🎬 Charmarr: Because Streaming Platforms Are Expensive and I'm Petty

> A charmed, Kubernetes-native servarr stack for the masochists who want scalable, reliable, observable, and frankly over-engineered media automation. Because why solve problems simply when you can suffer beautifully? 

---

## 📖 The Origin Story (or: How I Got Here)

This whole thing started in 2023 when I learned about Plex from my then girlfriend. Her brother had this pre-assembled NAS box serving movies through Plex, and it was cool as fuck. But what it lacked was any way to request and download movies cleanly without sending a bunch of texts back and forth. 

So naturally, I decided to build her a better system for her birthday. That's how the ARR journey began and the **psygoat homelab** was born.

---

## 🏗️ The First Iteration: When Things Actually Worked (For a While)

The initial [servarr stack](https://github.com/adhityaravi/psygoat-legacyapps/tree/main/servarr) was actually pretty dope. It followed the [TRaSH](https://trash-guides.info/) guides, had a cool movies/series requesting system based on Overseerr, and even had IMDb integration. The server stayed in India, but we were able to stream media quite reliably (to my surprise) in Germany, Norway, and even Mexico given stable internet speeds. It used a bunch of Tailscale / cloud VPS shenanigans since the server was in a CGNAT network, hence lacking a static IP. But it worked and I was happy.

### But It Only Worked Until It Didn't 💀

The hardware setup itself was cooked (but we'll leave that story out of here and only focus on ridiculing me for my software setup):

**The Software Sins:**

1. **No Automation** - I was purely motivated initially by learning new stuff, so I didn't mind all the manual hacks, configurations, and copy-pastes that I had to do to bring the system up. And boy, there were a lot of configurations to do.

2. **Zero Observability** - If something stopped working, it took forever to figure out what wasn't working, even though the system itself was very small.

3. **No Backup or Redundancy** - Neither hardware nor software. Because, YOLO.

4. **Security? What Security?** - It had a badly configured gluetun killswitch, which was okay (and maybe that's enough for most home servers), but there was no separation of concerns, no idea of access control, etc.

5. **No Scalability** - Again, probably not needed considering self-hosted servers are usually for personal use, but still.

6. **No Self-Healing or Updates** - I think it's bad enough already, so I'm gonna stop with 6 points.

### The Inevitable Collapse 📉

So what this meant was that eventually, when the server had hiccups, and in parallel my work got busy (or because I'm a lazy little bitch), the small hiccups piled up and eventually the server became irrecoverable. It ran successfully for less than a year, which I still consider a success anyway. 

And I had to painfully pay for a million commercial streaming platforms again.

---

## 🚀 The Second Attempt: When Ambition Exceeded Reality

But I really wanted the server back, and I had some micro PCs around. So there was going to be a second version of the psygoat server. I wanted to learn and rectify all the mistakes from the first time around and use a Kubernetes substrate for the servarr stack.

### The Grand Plan That Never Was 🏰

My plans were a little too grand. It involved:
- Setting up a redundant Proxmox cluster with TrueNAS
- An off-shore backup (the server from India was modded to be the backup storage server)
- Heavy automations including Terraform for spinning up VMs in Proxmox
- Installing Kubernetes and other things automatically when provisioning VMs
- Automatically provisioning storage blocks from TrueNAS and plugging it into the provisioned VMs
- Automatically joining the VM nodes into the k8s cluster
- Setting up an OPNsense router and automating the shit out of it, etc.

Well, it was all too overwhelming. I had the Proxmox cluster and TrueNAS systems functioning. But, I was switching jobs at the exact same time, and the automations I setup kinda sorta never worked. Which meant I threw my hands up in the air as god intended and continued painfully paying for a million streaming platforms.

---

## 💡 The Third Time's the Charm: Charmarr is Born

So I wanted to learn from my mistakes again and find a middle ground. Which meant I wanted to build a **repeatably deployable, scalable, reliable servarr stack** based on a K8s substrate with security features first. Then host it on mediocre existing hardware, then enhance/automate or whatever the platform and hardware.

Fortunately, my everyday work is focused on quality open source tools including [Juju charms](https://canonical.com/juju), observability, and service meshes. And I am working with a bunch of smart people far more experienced who were also self-hosting a lot. This meant I didn't have to do a lot of guess work.

### 🔍 The Research Phase

I went on a small research phase and found some amazing ARR management tools/material out there (awesome-arr, yams, quick-arr-Stack, arr helm charts, nixarr, etc. - shout out to NixOS while I am at it). They were all so awesome that I wanted to just use them (especially yams, man that thing is sexy). 

Then where will I get my daily dose of suffering and pain and quench my masochistic thirst? JK, lol.

### 🎯 The Problem That Remained

One thing that was common among all the ARR setups in my research: even though most of the ARR deployment and lifecycle was simplified and easy as fuck, **the configuration and interconnection of the ARR applications with one another was still quite complex**. Or at least one had to read through a lot of docs to do a bunch of manual configs.

Which meant that if I were to nuke or bork the stack, even though bringing up the stack would be easy, I'd still need to do the configs and setups painfully manually. And we've established I'm as lazy as they come.

And there were no existing modular systems (for example, an observability system) that you could just opt into your stack. Of course you could set up Prometheus, Grafana and stuff, but again, lets be realistic, ain't no one gonna ever maintain that.

---

## 🧩 The Solution: Juju charms

Not the take my soul in-return for free maintenance of my media server kind. But the [juju](https://canonical.com/juju) ecosystem from Canonical. I was working with this tech at work which seemed to solve these problems for me. (Trust me, this ain't an ad. All the tools in this project will be open source. Well, we could debate on the philosophy of how open source they are, but I don't wanna. They're open source and free to at least use. This project itself will be free to use and modify as you please, and that's all that matters for general homelab users.)

### What Makes Charmarr Different? 🌟

Juju charms have a concept called a [relation](https://documentation.ubuntu.com/juju/3.6/reference/relation/) which allows two apps to be integrated with one another, share information, and in turn configure themselves based on received info. The relation concept might seem like a clusterfuck at the beginning, but it's quite handy and solves most of the manual configuration issues.

**For example:** The Radarr app could be integrated with SABnzbd, and this means all the cross-configurations between these applications can be automated.

And there are existing stacks that could be connected with your servarr stack:
- **COS Stack** - A charmed canonical observability stack is an existing premade observability solution
- **Charmed Service Mesh** (which I co-develop and maintain) - Could be simply integrated into the servarr stack

Even though service mesh is overkill for a home server and probably you gotta be insane and have no life to do that, hey, I'm both of those things, so...

### Why This Approach? 🤔

This solved two of the major problems I had with existing ARR solutions:
1. **Automated cross-application configuration** through relations
2. **Modular opt-in features** like observability, service mesh, secrets management, etc.

But to take advantage of all the previously mentioned stuff, the ARR applications must be "charmed." And hence the **Charmarr project** was born.

---

## 🎯 What is Charmarr?

The idea is to provide a **charmed version of all** (well, not ALL, but an "opinionated all" because fuck me, there are millions of ARR helper apps now, but at the same time warmly welcoming PRs with any new ARR charms) **the ARR apps**, automating the cross-application configuration, with:

- A **configurator charm** to provide a single place for user configurations of all the apps
- A **Terraform/Terragrunt-based solution** for lifecycle management of the stack
- **Optional opt-in features** to existing charmed applications including but not limited to:
  - Canonical Observability Stack (COS)
  - Charmed Service Mesh for transparent traffic control
  - Charmed Vaults for secret management
  - Charmed IAM solutions
  - And opening up the possibility of integrating any charmed app into the stack

Kinda like building with Lego. This sounded amazing to me.

Hence, I've taken it upon myself to build Charmarr and the ecosystem around Charmarr so many more people can impress their friends and family in a scalable and reliable way.

---

## ⚠️ Real Talk: Is This Overkill?

**Absolutely, yes. 100%. Balls to the wall insane.**

So if I have to be completely transparent: while I'm going to try to keep everything as simple as possible, this solution is definitely overkill for a self-hosted scenario. And I would still recommend **yams** if someone asks me if they want to ARR for the first time.

But I wanna do this for the love of the game, and I know someone other than me might be crazy enough to try.

**So everyone is welcome to:**
- Give it a try
- Contribute
- Use it
- Break it
- Fix it
- Criticize it (please be gentle though, I am baby)
- Fork it
- Star it

---

## 🏗️ The Charmarr Ecosystem

Also, I change my mind quite often and this is a very alpha project, so there will be lots and lots of changes. But the Charmarr project will majorly entail 3 major products:

### 1. 🎬 Charmarr
The charmed servarr stack itself. The main event. The reason we're all here.

### 2. 🤖 Flintarr
An [opperator](https://github.com/opper-ai/opperator)-based AI agent for Charmarr named after the famous Cap. Flint, the parrot, from Treasure Island. I'm not sure what exactly this agent will do, but mostly it'll be like an assistant with preprogrammed tools that will let you ask questions about the state, logs, metrics, and maybe even configure etc. of your stack. Because duh... AI.

### 3. ⚙️ Configuratarr
(Yeah, I put all my creativity on naming the above two products. I had to go basic for this one.)

A simple TUI helper app that will help you configure the Terraform solution. For example:
- Enable mesh auth policies
- Enable observability (enable tracing, etc.)
- Enable OAuth
- And other configuration options

This will probably be the lowest priority ever, if I even get to it. This is there because I wanna build a good-looking TUI like lazygit or K9s.

---

## 🗺️ What's Next?

But like I said, this might change. I might add more products, remove or deprecate products even before they go live, or give up completely. I'll maybe try to create a roadmap when I'm done with all the initial architectural decisions and probably make the meta repo public as a starter.

🟢 Create an organization, repositories, product nomenclature, and logos  
🟠 Complete architectural design records for charmarr  
🟢 Create a charm template for charmarr charms  
⚪ Create the charmarr topology data model in `charmarr-lib`  
⚪ Create the shared reconciler in `charmarr-lib`  
⚪ Create `tailscale-connector-k8s` charm  
⚪ TBD  
⚪ TBD  

(If this generates some/any interest, I'll open discussions for this organization.)

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! This is an alpha project, so expect things to break, change, and evolve rapidly.

---

## 📜 License

Charmarr is committed to **strong open source principles** with a pragmatic approach. Different components use different licenses:

- **Services & Network Applications**: AGPL-3.0
- **Libraries**: LGPL-3.0
- **Local Tools**: GPL-3.0
- **Documentation**: CC-BY-SA-4.0
- **Community Files**: CC0-1.0

Check individual repositories for specific license details. Use it, fork it, improve it, just don't be a dick and keep it open. 🌸

---

## 💬 Final Thoughts

This is a passion project born from frustration with streaming platforms, a desire to learn, and having no life. The aim is to make a complex system simple. That said, this wont be the simplest, easiest ARR solutions out there as I've mentioned. But if you want to over-engineer your media server to an absurd degree while learning about Kubernetes, charms, service meshes, and state-of-the-art tools... welcome home, friend.

Let's build something unnecessarily complex together. 🚀

---

*Built with ❤️, spite, and a little too much free time*
