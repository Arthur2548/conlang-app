#!/usr/bin/env bash
set -euo pipefail
echo "== Conlang Desktop (Tauri) Builder =="

if ! command -v node >/dev/null 2>&1; then
  echo "Node.js not found. Install from https://nodejs.org/"
  exit 1
fi

if ! command -v cargo >/dev/null 2>&1; then
  echo "Rust toolchain not found. Install via https://rustup.rs"
  exit 1
fi

if ! command -v tauri >/dev/null 2>&1; then
  echo "Installing @tauri-apps/cli locally..."
  npm i -g @tauri-apps/cli
fi

echo "Installing dependencies..."
npm install

echo "Building release bundle..."
npm run build

echo "Artifacts in src-tauri/target/release/bundle"