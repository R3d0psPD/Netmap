# NETMAP Linux Release

NETMAP is an independent desktop application for using Nmap for authorized network discovery, service analysis, topology visualization, and reporting. It is not an official Nmap product.

## Install from a terminal

Run these commands from the directory where you want the `Netmap` folder to be created. No `cd` command is needed. This distribution repository must be publicly accessible (or your GitHub account must have access).

```bash
git clone --depth 1 https://github.com/R3d0psPD/Netmap.git
chmod +x Netmap/run.sh
./Netmap/run.sh
```

The launcher downloads the latest compiled Linux release, verifies its SHA-256 checksum, extracts it into the local `.runtime/` folder inside the clone, and starts NETMAP. It automatically uses `curl` or `wget` to download. Install `unzip` and `sha256sum` if they are not already available. The launcher never fetches the NETMAP Python application source code.

If you want a custom clone-folder name, use that name in the last two commands as well.

## Requirements

- 64-bit Linux on x86_64 with a supported glibc environment.
- Nmap installed and available as `nmap` in `PATH`. Nmap is not bundled.
- An operating-system credential manager, such as KWallet or Secret Service, if you want NETMAP to save provider API keys.
- Internet access for remote AI services.
- `gpg` for verifying the release manifest signature when using the launcher.

On Kali Linux or Debian-based systems, install Nmap with:

```bash
sudo apt update
sudo apt install nmap gnupg
```

This release does not include a native Windows package.

## NETMAP AI

Each user supplies their own provider API key in **Settings > NETMAP AI**. NETMAP does not include a shared developer API key. Supported protocols and authentication options depend on the selected provider or custom endpoint. Use **Load API models** to query the selected endpoint, then use **Test connection** before sending a request.

Saved API credentials use the operating system's credential manager when available. NETMAP does not promise that every provider or model is compatible. Provider availability, rate limits, and charges are controlled by the provider.

Review scan-context and privacy options before sending prompts or scan details to a remote AI service. Local knowledge features may still be available without a cloud request.

## Local data and privacy

NETMAP scan history, target history, settings, and AI conversation history are stored locally for the current operating-system user. They are not included in the repository or release download and are not automatically sent to other NETMAP users.

The compiled release stores its local database under `$XDG_DATA_HOME/netmap`, or `~/.local/share/netmap` when `XDG_DATA_HOME` is not set. A source-development checkout uses the separate legacy `~/.netmap` directory. This prevents the downloaded release from reusing scan history created by the source-development copy on the same computer.

Each operating-system account has its own home/data directory. Do not share your local database or screenshots containing scan details with others unless you have reviewed and sanitized them.

## Download integrity and authenticity

The launcher verifies the detached OpenPGP signature on `SHA256SUMS` before trusting the SHA-256 checksum of the application ZIP. The public signing key is included as `NETMAP-RELEASE-KEY.asc`.

Release signing-key fingerprint: `0B45 B609 3134 D3E3 ADB9 7C02 EDB2 243C 7827 C44D`. For manual verification, obtain the ZIP, `SHA256SUMS`, `SHA256SUMS.asc`, and `NETMAP-RELEASE-KEY.asc` from the same release, then run:

```bash
gpg --import NETMAP-RELEASE-KEY.asc
gpg --show-keys --fingerprint NETMAP-RELEASE-KEY.asc
gpg --verify SHA256SUMS.asc SHA256SUMS
sha256sum -c SHA256SUMS
```

Before relying on the signature, compare the full fingerprint with a separately trusted NETMAP developer source. SHA-256 detects content changes; the signature helps establish that the checksum manifest was signed by the holder of the corresponding private key. Neither signature nor checksum guarantees that software is vulnerability-free.

## Usage and authorization

Use NETMAP only against systems you own or have explicit permission to test. Scanning behaviour depends on Nmap, target responses, network conditions, and available privileges. NETMAP does not guarantee that every host or service will be discovered.

## Screenshots

These screenshots were captured from a clean, isolated NETMAP profile with no saved scans, targets, conversations, or API keys. They do not show a developer's personal history or configuration.

| | |
| --- | --- |
| ![NETMAP dashboard](docs/screenshots/dashboard.png) | ![NETMAP scanner](docs/screenshots/scanner.png) |
| **Dashboard** | **Scanner** |
| ![Ports and hosts](docs/screenshots/ports-hosts.png) | ![Graphical analysis](docs/screenshots/graphical-analysis.png) |
| **Ports / Hosts** | **Graphical Analysis** |
| ![Network topology](docs/screenshots/topology.png) | ![NETMAP AI](docs/screenshots/netmap-ai.png) |
| **Topology** | **NETMAP AI** |
| ![Scan history](docs/screenshots/history.png) | ![Report preview](docs/screenshots/reports.png) |
| **Scan History** | **Reports** |
| ![NETMAP AI settings](docs/screenshots/ai-settings.png) | ![NETMAP Help](docs/screenshots/help.png) |
| **AI Settings** | **Help** |

## License and source availability

NETMAP is distributed as a compiled application under the proprietary terms in EULA.md. The NETMAP application source code is not included in this repository or the release package. Unauthorized redistribution of NETMAP is prohibited, subject to rights that cannot be restricted under applicable law or the licenses of third-party components.

GitHub automatically displays `Source code (zip)` and `Source code (tar.gz)` for release tags. Those links snapshot this distribution repository, including the small shell bootstrap launcher, documentation, screenshots, branding, and third-party license materials—not the NETMAP application Python source code. The launcher downloads the verified compiled release ZIP.

Qt/PySide and other third-party components retain their respective licenses. Read THIRD_PARTY_NOTICES.md, LICENSES/, and THIRD_PARTY_SOURCES.md. Third-party source archives are provided for their license requirements; they are not NETMAP application source code.
