#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

use tauri::{Manager};

fn main() {
  tauri::Builder::default()
    .setup(|app| {
      // You can access the main window if needed:
      let _window = app.get_window("main");
      Ok(())
    })
    .run(tauri::generate_context!())
    .expect("error while running tauri application");
}