# Conlang Desktop (Tauri)

This is a minimal Tauri 1.x wrapper around your existing `public/index.html`.
It packages your web app into a native desktop app for Windows/macOS/Linux.

## Prerequisites
- Node.js 16+
- Rust toolchain (`rustup`)
- Tauri CLI: `npm i -g @tauri-apps/cli` (or use local devDependency)

## Run (development)
```bash
cd conlang-desktop-tauri
npm install
npm run dev
```

## Build installers
```bash
# Windows: creates .msi/.exe; macOS: .app/.dmg; Linux: .AppImage/.deb etc.
npm run build
```

Your original `index (67).html` has been placed at `public/index.html`.
You can adjust window title/size inside `src-tauri/tauri.conf.json`.

## Build via GitHub Actions (to get a .exe without local setup)
1. Create a new private GitHub repo and push this project.
2. Go to the repo → Actions → find **Build Windows (.exe) - Tauri** → **Run workflow**.
3. After it finishes, download **tauri-windows-artifacts** from the workflow run.

## Local Windows build (PowerShell)
Open PowerShell and run:

```powershell
cd conlang-desktop-tauri
./scripts/build-windows.ps1
```


## Publish .exe for others to download (GitHub Release)
1) Push this project to GitHub.
2) Create a version tag, e.g. `git tag v1.0.0 && git push origin v1.0.0`.
   - Alternatively, run the workflow manually from the Actions tab.
3) The workflow **Build & Release Windows (.exe)** will run on Windows, build the installer,
   and publish a **Release** with assets attached (`windows-bundle.zip`, `.exe`, `.msi`).
4) Share the Release URL with others—they can download the `.exe` directly.


## Single Workflow (Windows build + optional Release)
### Run manually (Artifacts only)
1) Go to **Actions** → **Build (Windows) & optional Release (.exe)** → **Run workflow**.
2) Choose the branch (default `main`) → Run.
3) After it finishes, download the `.exe/.msi` from the **Artifacts** named `windows-build`.

### Publish Release (with .exe attached)
1) Tag a version: `git tag v1.0.0 && git push origin v1.0.0`.
2) The workflow runs on the tag and creates a **GitHub Release** with installer assets.
