#!/usr/bin/env bash
set -Eeuo pipefail

# Small bootstrap launcher. The NETMAP application itself is downloaded as a
# checksum-verified compiled release; this repository does not contain Python
# application source code.

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
RUNTIME_DIR="$ROOT_DIR/.runtime"
DOWNLOAD_DIR="$RUNTIME_DIR/downloads"
INSTALL_ROOT="$RUNTIME_DIR/apps"
RELEASE_BASE="${NETMAP_RELEASE_DOWNLOAD_BASE:-https://github.com/R3d0psPD/Netmap/releases/latest/download}"

die() {
    printf 'NETMAP launcher error: %s\n' "$*" >&2
    exit 1
}

for tool in sha256sum unzip; do
    command -v "$tool" >/dev/null 2>&1 || die "Required command '$tool' was not found. Install it using your Linux package manager."
done

download_file() {
    local url="$1"
    local destination="$2"
    local temporary="$destination.part"
    rm -f -- "$temporary"

    if command -v curl >/dev/null 2>&1; then
        curl --fail --location --show-error --retry 2 --output "$temporary" "$url" ||
            die "Download failed. Check your Internet connection and GitHub access."
    elif command -v wget >/dev/null 2>&1; then
        wget --tries=3 --timeout=30 --output-document="$temporary" "$url" ||
            die "Download failed. Check your Internet connection and GitHub access."
    else
        die "Install either curl or wget, then run this launcher again."
    fi

    [[ -s "$temporary" ]] || die "GitHub returned an empty download."
    mv -f -- "$temporary" "$destination"
}

mkdir -p -- "$DOWNLOAD_DIR" "$INSTALL_ROOT"
chmod 700 "$RUNTIME_DIR" "$DOWNLOAD_DIR" "$INSTALL_ROOT"

manifest="$DOWNLOAD_DIR/SHA256SUMS"
download_file "$RELEASE_BASE/SHA256SUMS" "$manifest"

expected_hash=""
archive_name=""
IFS=' ' read -r expected_hash archive_name _ < "$manifest" || true
[[ "$expected_hash" =~ ^[A-Fa-f0-9]{64}$ ]] ||
    die "The release checksum manifest is invalid."
[[ "$archive_name" =~ ^NETMAP-[0-9]+\.[0-9]+\.[0-9]+-linux-x86_64\.zip$ ]] ||
    die "The release manifest contains an unexpected archive name."

archive="$DOWNLOAD_DIR/$archive_name"
if [[ ! -s "$archive" ]] ||
   [[ "$(sha256sum "$archive" | awk '{print $1}')" != "$expected_hash" ]]; then
    download_file "$RELEASE_BASE/$archive_name" "$archive"
fi

(
    cd -- "$DOWNLOAD_DIR"
    sha256sum -c SHA256SUMS
) || die "The release ZIP checksum did not match. The application was not started."

release_version="${archive_name#NETMAP-}"
release_version="${release_version%-linux-x86_64.zip}"
app_dir="$INSTALL_ROOT/$release_version"
app_binary="$app_dir/NETMAP-Linux-x86_64/NETMAP"
marker="$app_dir/.verified-archive-sha256"

installed_hash=""
if [[ -f "$marker" ]]; then
    installed_hash="$(<"$marker")"
fi

if [[ ! -x "$app_binary" ]] || [[ "$installed_hash" != "$expected_hash" ]]; then
    temporary_dir="$(mktemp -d "$INSTALL_ROOT/.extract.XXXXXX")"
    cleanup() { rm -rf -- "$temporary_dir"; }
    trap cleanup EXIT

    unzip -q "$archive" -d "$temporary_dir"
    extracted_binary="$temporary_dir/NETMAP-Linux-x86_64/NETMAP"
    [[ -f "$extracted_binary" ]] ||
        die "The verified ZIP does not contain the expected NETMAP executable."

    chmod +x "$extracted_binary"
    printf '%s\n' "$expected_hash" > "$temporary_dir/.verified-archive-sha256"

    rm -rf -- "$app_dir"
    mv -- "$temporary_dir" "$app_dir"
    trap - EXIT
    app_binary="$app_dir/NETMAP-Linux-x86_64/NETMAP"
fi

[[ -x "$app_binary" ]] || die "The NETMAP executable is not runnable."
printf 'Launching checksum-verified NETMAP from %s\n' "$archive_name"
exec "$app_binary" "$@"
