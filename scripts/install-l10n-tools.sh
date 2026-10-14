#!/usr/bin/env bash
set -euo pipefail

version=v0.1.0
release_url="https://github.com/thunderbird/thunderbird-mobile-weblate/releases/download/$version"
repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
install_dir="$repo_root/.tools/l10n"
mkdir -p "$install_dir"

case "${1:-}" in
  sync)
    name=l10n-sync
    checksum=28380308a290915f510ef1b3513bb673e0c804ba0b43c771b30425a82f9a3aa4
    ;;
  weblate)
    name=l10n-weblate
    checksum=18261085f1ae9e815a31fd2b80ccf014726273629a349e70bc964e20896422cf
    ;;
  *)
    echo "Usage: $0 {sync|weblate}" >&2
    exit 2
    ;;
esac

archive="$name-$version-jvm.zip"
archive_path="$install_dir/$archive"
launcher="$install_dir/$name-$version-jvm/bin/$name"

if [[ ! -f "$archive_path" ]]; then
  curl --fail --location --show-error --silent "$release_url/$archive" -o "$archive_path"
fi

if ! printf '%s  %s\n' "$checksum" "$archive_path" | shasum -a 256 --check; then
  echo "Invalid checksum for $archive; remove it and retry." >&2
  exit 1
fi

if [[ ! -x "$launcher" ]]; then
  unzip -q -o "$archive_path" -d "$install_dir"
fi
