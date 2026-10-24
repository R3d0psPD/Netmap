# NETMAP Linux Release

NETMAP is an independent desktop application for using Nmap for authorized network discovery, service analysis, topology visualization, and reporting. It is **not an official Nmap product**.

- **Latest release:** [NETMAP 1.1.3 — Linux x86_64](https://github.com/R3d0psPD/Netmap/releases/latest)
- **Platform:** 64-bit Linux on x86_64 with a supported glibc environment
- **Package:** compiled standalone application; the NETMAP Python application source is not included

## Install and run

Open a terminal in the directory where you want the `Netmap` folder to be created, then run:

```bash
git clone --depth 1 https://github.com/R3d0psPD/Netmap.git
chmod +x Netmap/run.sh
./Netmap/run.sh
```

The launcher downloads the latest compiled Linux release, verifies the signed checksum manifest and archive hash, extracts the verified package into `.runtime/` inside the cloned repository, and launches NETMAP. It does not download or execute the NETMAP Python application source code.

### Prerequisites

NETMAP requires a graphical Linux desktop and these commands to be available: `bash`, `curl` or `wget`, `gpg`, `sha256sum`, and `unzip`. Git is required to clone this repository. Nmap must be installed separately and available as `nmap` in `PATH`.

On Kali Linux or Debian/Ubuntu-based systems, install the common requirements with:

```bash
sudo apt update
sudo apt install -y git nmap gnupg curl unzip coreutils ca-certificates
```

`coreutils` provides `sha256sum`. The launcher can use `wget` instead of `curl` if curl is not installed. If you already have the prerequisites, no package installation command is needed.

The launcher creates a private `.runtime/` directory inside the clone and keeps its downloaded archive and extracted application there. The application is not installed system-wide. Do not run NETMAP as root unless a specific authorized scan requires privileges and you understand the implications.

If you rename the clone folder, replace `Netmap` with your chosen folder name in the `chmod` and launch commands. This release does not include a native Windows package.

## Troubleshooting

- **`Required command ... was not found`:** install the named command using your Linux package manager, then run `./Netmap/run.sh` again.
- **`nmap` is not found by NETMAP:** install Nmap and confirm that `command -v nmap` returns its path.
- **Download fails:** check Internet access and whether GitHub Releases are reachable from your network.
- **Signature or checksum verification fails:** do not run the downloaded executable. Retry the download later and compare the signing-key fingerprint against a separately trusted NETMAP developer source.
- **The window does not open:** use a supported 64-bit Linux desktop session with a compatible glibc and the required runtime libraries. A headless terminal alone is not sufficient for this GUI application.

## NETMAP AI

Each user supplies their own supported provider API key in **Settings > NETMAP AI**. This release does not include a shared developer API key. Provider protocols, authentication methods, model availability, rate limits, and charges depend on the selected provider or custom endpoint; NETMAP does not guarantee that every provider or model is compatible.

Use **Load API models** to query the selected endpoint and **Test connection** before sending a request. Saved API credentials use the operating system's credential manager when available. Review privacy and scan-context settings before sending prompts or scan details to a remote AI service. Never post API keys, passwords, or tokens in public issues or screenshots.

## Local data and privacy

Scan history, target history, settings, and NETMAP AI conversation history are stored locally for the current operating-system user. They are not included in this repository or the release ZIP and are not automatically sent to other NETMAP users.

The compiled release stores its database under `$XDG_DATA_HOME/netmap`, or `~/.local/share/netmap` when `XDG_DATA_HOME` is not set. A source-development checkout uses the separate legacy `~/.netmap` directory. Remote AI providers receive only the information sent in requests; review the app's privacy and scan-context settings before sending data. Provider-side processing is governed by the provider's own terms and policies.

Each operating-system account has its own home/data directory. Review and sanitize scan reports, database files, and screenshots before sharing them.

## Download integrity and authenticity

The launcher verifies the detached OpenPGP signature on `SHA256SUMS` before trusting the SHA-256 checksum for the application ZIP. The public signing key is included as `NETMAP-RELEASE-KEY.asc`; no private signing key is included.

Release signing-key fingerprint:

```text
0B45 B609 3134 D3E3 ADB9 7C02 EDB2 243C 7827 C44D
```

For manual verification, download `NETMAP-RELEASE-KEY.asc`, `SHA256SUMS`, `SHA256SUMS.asc`, and the ZIP from the [same release](https://github.com/R3d0psPD/Netmap/releases/latest), then run these commands from the directory containing those files:

```bash
gpg --import NETMAP-RELEASE-KEY.asc
gpg --show-keys --fingerprint NETMAP-RELEASE-KEY.asc
gpg --verify SHA256SUMS.asc SHA256SUMS
sha256sum -c SHA256SUMS
```

Before relying on the signature, compare the full fingerprint above with a separately trusted NETMAP developer source. A SHA-256 checksum detects content changes; the OpenPGP signature helps establish that the manifest was signed by the holder of the corresponding private key. Neither proves that the software is vulnerability-free. If a signature or checksum check fails, do not execute the package.

## Screenshots

The screenshots below were captured from NETMAP 1.1.3 using an isolated profile with no saved scans, targets, conversations, or API keys. They show the current interface without the developer's personal history or configuration.

| Dashboard | Scanner |
| --- | --- |
| ![NETMAP 1.1.3 dashboard](docs/screenshots/dashboard.png) | ![NETMAP 1.1.3 scanner](docs/screenshots/scanner.png) |

| Ports / Hosts | Graphical Analysis |
| --- | --- |
| ![NETMAP 1.1.3 ports and hosts](docs/screenshots/ports-hosts.png) | ![NETMAP 1.1.3 graphical analysis](docs/screenshots/graphical-analysis.png) |

| Network Topology | Scan History |
| --- | --- |
| ![NETMAP 1.1.3 network topology](docs/screenshots/topology.png) | ![NETMAP 1.1.3 scan history](docs/screenshots/history.png) |

| Reports | NETMAP AI |
| --- | --- |
| ![NETMAP 1.1.3 reports](docs/screenshots/reports.png) | ![NETMAP 1.1.3 NETMAP AI](docs/screenshots/netmap-ai.png) |

| NETMAP AI Settings | Help |
| --- | --- |
| ![NETMAP 1.1.3 AI settings](docs/screenshots/ai-settings.png) | ![NETMAP 1.1.3 help](docs/screenshots/help.png) |

## Usage and authorization

Use NETMAP only against systems you own or have explicit permission to test. Scan results depend on Nmap, target responses, network conditions, permissions, and available privileges. NETMAP does not guarantee that every host or service will be discovered.

## License and source availability

NETMAP is distributed as a compiled application under the proprietary terms in [EULA.md](EULA.md). The NETMAP application source code is not included in this repository or the release package. Compiling the application can make casual inspection more difficult but does not guarantee that reverse engineering is impossible. Unauthorized redistribution is restricted by the EULA, subject to rights that cannot be restricted under applicable law or third-party licenses.

GitHub also provides `Source code (zip)` and `Source code (tar.gz)` links for release tags. These archives are pinned to the exact commit referenced by the tag, so the auto-generated source archive for `v1.1.3` does not automatically include later README or screenshot updates committed to `main`. Use the README on the default branch for the latest installation instructions and screenshots. Tag-based archives contain this distribution repository—including the small shell bootstrap launcher, documentation, screenshots, branding, and third-party license materials—not the NETMAP application Python source. The launcher downloads the signature- and checksum-verified compiled release ZIP.

Qt/PySide and other third-party components retain their own licenses. Read [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md), `LICENSES/`, and [THIRD_PARTY_SOURCES.md](THIRD_PARTY_SOURCES.md). Third-party source archives are provided for the applicable license requirements; they are not NETMAP application source code.
