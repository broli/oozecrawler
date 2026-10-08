# Oozecrawler 🧪

> An amorphous dungeon crawler developed in **Godot 4**.

[![Godot Engine](https://img.shields.io/badge/Godot-4.x-478cbf?logo=godotengine&logoColor=white)](https://godotengine.org)
[![Language](https://img.shields.io/badge/GDScript-2.0-blue)](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

---

## 📖 Overview

**Oozecrawler** is a dungeon crawling game centered around unique fluid/ooze mechanics. This repository houses the complete source code, scene assets, documentation, and step-by-step game development curriculum.

---

## 🛠️ Tech Stack & Engine Configuration

- **Engine:** Godot Engine 4.x
- **Scripting:** GDScript (statically-typed)
- **Renderer:** GL Compatibility (lightweight, broad cross-platform and web compatibility)
- **Physics Engine:** Jolt Physics / Godot Physics
- **VCS:** Git

---

## 🚀 Getting Started

### Prerequisites

- [Godot Engine 4.x](https://godotengine.org/download) (Standard or .NET edition; standard is recommended for GDScript)
- [Git](https://git-scm.com/)

### Installation & Running

1. **Clone the repository:**
   ```bash
   git clone https://github.com/<your-username>/oozecrawler.git
   cd oozecrawler
   ```

2. **Open in Godot:**
   - Launch the **Godot Project Manager**.
   - Click **Import**, navigate to the project directory, and select `project.godot`.
   - Click **Import & Edit**.

3. **Run the Project:**
   - Press `F5` to run the project main scene once set, or `F6` to run the current active scene.

---

## 📂 Project Structure

```text
oozecrawler/
├── .godot/                # Godot internal cache and metadata (git-ignored)
├── assets/                # Raw & imported textures, audio, models, fonts
│   ├── audio/
│   ├── sprites/
│   └── ui/
├── docs/                  # Design documents, questionnaires, and curriculum
│   ├── CURRICULUM.md
│   └── GAME_DESIGN_QUESTIONNAIRE.md
├── scenes/                # Godot scene files (.tscn)
│   ├── characters/
│   ├── levels/
│   └── ui/
├── scripts/               # Reusable GDScript files (.gd)
│   ├── autoload/
│   ├── characters/
│   └── core/
├── icon.svg               # Default Godot project icon
├── project.godot          # Engine configuration file
└── README.md              # Project documentation
```

---

## 📚 Documentation & Roadmap

- [Game Design Questionnaire](docs/GAME_DESIGN_QUESTIONNAIRE.md): Design decisions, mechanics, and concept specifications.
- [Tutoring Curriculum & Roadmap](docs/CURRICULUM.md): Step-by-step architectural and programming syllabus.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
