# Oozecrawler 🧪✨

> **Suika Game meets Dungeon Crawler Roguelite!** A 2D physics puzzle RPG developed in **Godot 4**.

[![Godot Engine](https://img.shields.io/badge/Godot-4.x-478cbf?logo=godotengine&logoColor=white)](https://godotengine.org)
[![Language](https://img.shields.io/badge/GDScript-2.0-blue)](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

---

## 🎮 Game Concept

Drop, squeeze, and merge bouncy slimes inside alchemical flasks and vials! Combine identical slimes to evolve them into colossal oozes.

- **Infinite Normal Mode:** Classic high-score physics puzzle. Manage your container, trigger cascade merges, and beat your high scores without overflowing.
- **Dungeon Crawl Roguelite Mode:** Battle dungeon creatures where each merge powers up your attacks. Outsmart enemy attack timers, conquer bosses, and earn perk XP.
- **Hero Classes:**
  - 🪓 **Barbarian:** Hurl slimes with devastating impact and shake the flask.
  - 🧙 **Wizard:** Manipulate slime physics with arcane magnetism and transmutations.
  - 🗡️ **Rogue:** Lubricate drops to slip and squeeze through microscopic gaps.
- **Meta Progression:** Interconnected skill trees where achievements and gameplay in one mode unlock game-changing perks for the other.
- **Cross-Platform Ready:** Architecture prepared for Steam and Mobile achievements.

---

## 🛠️ Engine & Tech Stack

- **Engine:** Godot Engine 4.x
- **Scripting:** GDScript 2.0 (Pythonic syntax with static typing)
- **View:** 2D Side Static View (physics container with flanking UI panels)
- **Rendering:** GL Compatibility (ultra-fast, cross-platform and web friendly)
- **Physics:** Godot 2D Physics Engine (`RigidBody2D`, dynamic restitution and dampening)

---

## 🚀 Getting Started

### Prerequisites

- [Godot Engine 4.x](https://godotengine.org/download) (Standard edition)
- [Git](https://git-scm.com/)

### Running the Project

1. Clone the repo:
   ```bash
   git clone https://github.com/<your-username>/oozecrawler.git
   cd oozecrawler
   ```
2. Open **Godot Engine 4**, click **Import**, select `project.godot`, and click **Import & Edit**.
3. Press **F5** (or click the Play button in the top right) to run.

---

## 📁 Repository Structure

```text
oozecrawler/
├── assets/                # Audio, vector sprites, fonts, particles
├── docs/                  # Design specs & tutoring guides
│   ├── GDD.md             # Game Design Document
│   └── CURRICULUM.md      # Godot 4 & GDScript learning syllabus
├── scenes/                # Scene tree components (.tscn)
│   ├── core/              # Game container, drop line, spawner
│   ├── slimes/            # RigidBody2D slime tier scenes
│   └── ui/                # HUD, next queue, tier evolution chart
├── scripts/               # GDScript logic (.gd)
│   ├── autoload/          # AchievementManager, GameManager, SoundManager
│   ├── core/              # Spawner, container, merge logic
│   └── slimes/            # Slime base class & tier data
└── project.godot          # Engine configuration
```

---

## 📜 Documentation

- [Game Design Document (GDD)](docs/GDD.md)
- [Learning Syllabus & Tutoring Curriculum](docs/CURRICULUM.md)

---

## 📄 License

Distributed under the [MIT License](LICENSE).
