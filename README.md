# WezTerm Configuration - Holairs

This is my custom WezTerm configuration, tailored for an efficient and visually pleasing terminal experience. It leverages the Nemesis colorscheme, adaptive transparency, and a robust set of key mappings for enhanced productivity.

<img width="1727" alt="Screenshot 2025-01-04 at 7 23 10 PM" src="https://github.com/user-attachments/assets/8fb8ecf4-4197-4836-90d6-fb080e82c95c" />

---

## Key Features

### 1. **Nemesis Colorscheme**
   - A personal dark theme inspired by Isaac Asimov's *Nemesis*.
   - Loaded from a custom directory at `~/.config/wezterm/colors`.

### 2. **Font Fallback System**
   - **Primary font:** `IBM Plex Mono` for a modern and clean look.  
     - [Source](https://github.com/IBM/plex/releases/tag/%40ibm%2Fplex-mono%401.1.0)
   - **Fallback font:** `Apple Color Emoji` for seamless emoji support.
     - Provided by Mac computer

### 3. **Adaptive Transparency**
   - Easily toggle window transparency with `CMD+B`:
     - Normal opacity: 1.0 (fully opaque).
     - Transparent mode: 0.85 (slightly transparent).
   - Provides a balance between visibility and aesthetics.

### 4. **Custom Key Mappings**
   - Simplified pane management:
     - Split panes vertically (`CMD+O`) or horizontally (`CMD+P`).
     - Resize panes dynamically with `CMD+SHIFT+H/J/K/L`.
     - Move between panes using `CMD+H/J/K/L`.
   - Fullscreen toggle: `CMD+ESC`.
   - Copy mode activation: `CMD+;`.
   - Close panes with confirmation: `CMD+X`.
   - Zoom pane toggle: `CMD+Z`.

### 5. **Performance Optimization**
   - Frame rate capped at 165 FPS for smooth visuals.
   - Custom line height and font size for readability:
     - Font size: 26. (For high dpi screens haha)
     - Line height: 1.2.

### 6. **macOS Enhancements**
   - Enabled macOS window blur (`10`) for a sleek look.
   - Configured `Option` keys to send composed input.

---
## Customize the Colorscheme

- **Place your desired `.toml` theme files** in `~/.config/wezterm/colors`.
- The configuration will automatically load **Nemesis** by default.
- The configuration contains another personal colorscheme: **Monochrome Dark**
  
---

Enjoy a beautifully crafted, efficient terminal experience with this configuration!
