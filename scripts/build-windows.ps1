param(
  [switch]$InstallRust = $false
)

Write-Host "== Conlang Desktop (Tauri) Windows Builder ==" -ForegroundColor Cyan

# Ensure Node is present
try {
  node -v | Out-Null
} catch {
  Write-Error "Node.js not found. Please install Node.js LTS from https://nodejs.org/"
  exit 1
}

# Install Rust if requested
if ($InstallRust) {
  Write-Host "Installing Rust toolchain via rustup..." -ForegroundColor Yellow
  Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://sh.rustup.rs')) -ErrorAction SilentlyContinue
}

# Install Tauri CLI if not available
try {
  tauri -V | Out-Null
} catch {
  Write-Host "Installing @tauri-apps/cli globally..." -ForegroundColor Yellow
  npm i -g @tauri-apps/cli
}

Write-Host "Installing project dependencies..." -ForegroundColor Yellow
npm install

Write-Host "Building release bundle (this may take a while)..." -ForegroundColor Yellow
npm run build

# Try to locate .exe
$bundleDir = "src-tauri/target/release/bundle"
$exe = Get-ChildItem -Path $bundleDir -Recurse -Filter *.exe -ErrorAction SilentlyContinue | Select-Object -First 1

if ($exe) {
  Write-Host ("Build succeeded! EXE: " + $exe.FullName) -ForegroundColor Green
} else {
  Write-Warning "Build finished, but .exe not found. Check $bundleDir"
}