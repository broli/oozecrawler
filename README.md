# Oozecrawler 🧪✨

> **Suika Game meets Dungeon Crawler Roguelite!** A 2D physics puzzle RPG developed in **Godot 4**.

[![Godot Engine](https://img.shields.io/badge/Godot-4.x-478cbf?logo=godotengine&logoColor=white)](https://godotengine.org)
[![Language](https://img.shields.io/badge/GDScript-2.0-blue)](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> [!NOTE]
> **Learning by Doing Project:**  
> This is a hands-on learning project to explore game development in Godot 4 and GDScript from scratch.  
> The core infinite physics loop is currently under active development. **All design systems, classes, and roguelite progression features described below are concepts in development and marked as TBD.**

---

### 📌 GitHub Pinned Card Blurb
```text
A learn-by-doing Godot 4 project combining Suika-style physics puzzle mechanics with dungeon crawler roguelite elements.
```

---

## 🎮 Concept & Planned Features (TBD)

The core idea is to drop, squeeze, and merge bouncy slimes inside alchemical flasks and vials to power dungeon progression.

- **Infinite Normal Mode (In Progress):**
  - Classic high-score physics puzzle.
  - Drop slimes, manage container volume, and trigger cascade merges without overflowing.
- **Dungeon Crawl Mode (TBD):**
  - Turn-based RPG monster encounters powered by physics merges.
  - Merging higher-tier slimes deals damage; enemies counter-attack on move counters.
- **Hero Classes & Abilities (TBD):**
  - 🪓 **Barbarian:** Throw slimes with downward impact force; shake container.
  - 🧙 **Wizard:** Arcane slime magnetism to attract matching tiers.
  - 🗡️ **Rogue:** Lubricated slimes that compress through narrow gaps.
- **Container Variations (TBD):**
  - Different flask geometries (conical, test tubes, round-bottom bowls, obstacles).
- **Meta Progression & Achievements (TBD):**
  - Cross-mode unlockable perks and achievement system ready for future platform integrations.

---

## 🛠️ Engine & Tech Stack

- **Engine:** Godot Engine 4.x
- **Language:** GDScript 2.0 (statically typed)
- **View:** 2D Side Static View
- **Renderer:** GL Compatibility
- **Physics:** Godot 2D Physics Engine (`RigidBody2D`, restitution, friction, and dampening)

---

## 📁 Repository Structure

```text
oozecrawler/
├── assets/                # Textures, audio, icons, prototyping graphics
├── docs/                  # Design documents & learning roadmaps
│   ├── GDD.md             # Game Design Document
│   ├── IDEAS.md           # Gameplay backlog & class abilities
│   └── CURRICULUM.md      # Godot 4 & GDScript learning syllabus
├── scenes/                # Scene tree components (.tscn)
│   ├── Core/              # Container, Dropper, Main scene
│   └── slimes/            # RigidBody2D slime tier scenes
├── scripts/               # GDScript source code (.gd)
│   ├── characters/        # Dropper controller
│   ├── core/              # Main game loop & queue manager
│   └── Slimes/            # Slime base logic & tier definitions
└── project.godot          # Engine configuration
```

---

## 📚 Documentation

- [Game Design Document (GDD)](docs/GDD.md)
- [Feature & Mechanics Backlog](docs/IDEAS.md)
- [Tutoring Curriculum](docs/CURRICULUM.md)

---

## 📄 License

Distributed under the [MIT License](LICENSE).
