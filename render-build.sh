#!/usr/bin/env bash
set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT_DIR"

echo "JARVIS: ZIP dosyalari kontrol ediliyor..."

shopt -s nullglob
ZIP_FILES=("$ROOT_DIR"/*.zip)

if [ ${#ZIP_FILES[@]} -eq 0 ]; then
  echo "HATA: ZIP dosyasi bulunamadi."
  exit 1
fi

for ZIP in "${ZIP_FILES[@]}"; do
  echo "Kontrol: $(basename "$ZIP")"
  unzip -tq "$ZIP"
done

echo "JARVIS: Dosyalar aciliyor..."

for ZIP in "${ZIP_FILES[@]}"; do
  echo "Aciliyor: $(basename "$ZIP")"
  unzip -oq "$ZIP" -d "$ROOT_DIR"
done

echo "JARVIS: ZIP dosyalari basariyla acildi."