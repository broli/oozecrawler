# Oozecrawler 🧪✨

> **Suika Game meets Dungeon Crawler Roguelite!** A 2D physics-merge puzzle RPG built with **Godot 4**.

[![Godot Engine](https://img.shields.io/badge/Godot-4.x-478cbf?logo=godotengine&logoColor=white)](https://godotengine.org)
[![Language](https://img.shields.io/badge/GDScript-2.0-blue)](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> [!NOTE]
> **Learning by Doing Project:**  
> Oozecrawler is an open-source, hands-on learning project exploring Godot 4, 2D physics, procedural rendering, custom canvas shaders, and clean decoupled game architecture in GDScript.

---

### 📌 GitHub Pinned Card Blurb
```text
A learn-by-doing Godot 4 project combining Suika-style physics puzzle mechanics with dungeon crawler roguelite elements.
```

---

## 🕹️ Current Project Status

The foundational mechanics of the physics puzzle loop, procedural art, and event architecture are currently implemented and functional:

### ✅ Implemented Features

- **11-Tier Slime Hierarchy & Merge Physics:**
  - Full progression across 11 tiers (from tiny Tier 1 *Droplet* up to Tier 10 *Royal King Ooze*).
  - Scaled physics parameters per tier: radius, mass, elasticity, and score values.
  - Cascade merge collision logic (`_merge_with`) with pop impulses and cleanup.
- **Custom Slime Canvas Shader:**
  - Procedural 2D fragment shader (`slime.gdshader`) with radial alpha gradients, stylized dark borders, and responsive directional eyes.
  - Per-instance material duplication dynamically applied across all slime tiers.
- **Two-Bag Queue Manager (`QueueManager`):**
  - Dual-buffer bag randomization system (`_primary` and `_secondary`) with fair distribution shuffling.
  - Multi-step queue lookahead (`peek()`) ensuring deterministic upcoming slime previews.
- **Mouse-Aimed Dropper:**
  - Smooth mouse tracking clamped dynamically to container wall boundaries.
  - Height auto-calibrated above the container flask opening.
  - Dashed trajectory aim guide and live shader preview of the loaded slime.
  - Cooldown timer preventing rapid drop spam.
- **Alchemical Flask Container:**
  - `StaticBody2D` boundary walls with custom procedural glass drawing (`_draw`).
  - Translucent liquid/glass tint, specular highlight streaks, and graduated volume tick marks.
  - Dynamic boundary calculation methods (`get_drop_bounds()`, `get_opening_y()`) replacing hardcoded scene coordinates.
- **Procedural Dungeon Corridor Background:**
  - Perspective-projected corridor background rendered procedurally with stone floor, ceiling, and staggered mortar block patterns.
- **Global Event Bus & HUD:**
  - Autoloaded `Events` singleton decoupling gameplay systems from UI.
  - Live HUD tracking accumulated merge score and displaying upcoming queued slimes.

---

## 🗺️ Roadmap & Future Features

Development is structured in phases, moving from the standalone physics core to the full roguelite dungeon crawler:

### Phase 1: Core Loop Polish & Juicing (Next Up)
- [ ] **Overflow & Game Over System:** Danger warning line with a 2–3 second overflow countdown timer.
- [ ] **Audio & SFX:** Squish, bounce, merge pop, and flask impact sound effects.
- [ ] **Visual Juice:** Squash-and-stretch deformation, merge particle bursts, and floating score numbers.
- [ ] **Game State Controller:** Pause menu, restart loop, and high-score persistence.

### Phase 2: Hero Classes & Abilities
- [ ] 🪓 **Barbarian:**
  - *Force Throw:* Active downward slam impulse on drops.
  - *Quake Slam:* Shakes container to settle jammed slimes.
- [ ] 🧙 **Wizard:**
  - *Slime Magnetism:* Attractive magnetic force between identical adjacent tiers.
  - *Transmutation:* Arcane spells to shift slime tiers up or down.
- [ ] 🗡️ **Rogue:**
  - *Slime Lubrication:* Temporarily compresses collision radius to slip through tight gaps.
  - *Sneak Drop:* Zero-bounce precision placement.

### Phase 3: Flask & Container Variations
- [ ] **Erlenmeyer (Conical) Flask:** Wide stable base with a restrictive narrow neck.
- [ ] **Test Tube:** Tall, narrow vertical column demanding vertical stacking precision.
- [ ] **Round-Bottom Flask:** Curved circular bowl causing slimes to roll toward center.
- [ ] **Pachinko / Obstacle Flasks:** Pegs and dividers that split and redirect falling slimes.

### Phase 4: Dungeon Crawl Roguelite Mode
- [ ] **Turn-Based Combat Loop:** Merges generate attack power and elemental triggers to damage dungeon monsters.
- [ ] **Enemy Intent & Disruption:** Enemies attack on turn counters, disrupting containers with toxic sludge slimes, shakes, or wall constrictions.
- [ ] **Procedural Map Navigation:** *Slay the Spire*-style node map featuring Combat, Elite Encounters, Mystery Events, Alchemist Shops, and Rest Sites.
- [ ] **Consumable Cards & Relics:** One-time items (Acid Vial, Centrifuge, Wildcard Slimes) and passive run relics.

### Phase 5: Meta-Progression & Platform Support
- [ ] **Cross-Mode Unlocks:** Run currency to unlock starter flasks, perks, and class abilities.
- [ ] **Abstracted Achievement System:** `AchievementManager` supporting offline local storage, Steamworks (`GodotSteam`), and mobile achievements.

---

## 🛠️ Engine & Tech Stack

- **Engine:** [Godot Engine 4.x](https://godotengine.org) (Compatibility Renderer)
- **Language:** GDScript 2.0 (statically typed)
- **Architecture:** Node composition, custom CanvasItem shaders, decoupled Autoload Event Bus
- **Physics:** Godot 2D Physics (`RigidBody2D`, custom damping, restitution, and collision filtering)
- **Target Platforms:** PC (Steam / Itch.io) with mobile-ready touch architecture

---

## 📁 Repository Structure

```text
oozecrawler/
├── assets/                # Textures, audio, icons, prototyping graphics
├── docs/                  # Architecture, GDD, and design roadmaps
│   ├── GDD.md             # Game Design Document
│   ├── IDEAS.md           # Mechanics backlog & class ability concepts
│   └── CURRICULUM.md      # Godot 4 & GDScript learning roadmap
├── scenes/                # Scene tree components (.tscn)
│   ├── Core/              # Container, Dropper, Dungeon Background, Main
│   ├── slimes/            # RigidBody2D slime scenes
│   └── test/              # Shader & mechanic prototypes
├── scripts/               # GDScript source code (.gd)
│   ├── autoload/          # Global Event bus singletons
│   ├── characters/        # Dropper controller
│   ├── core/              # Main game loop, QueueManager, procedural visuals
│   └── Slimes/            # Slime physics, tier table, and shader setup
├── Shaders/               # Custom visual shaders (.gdshader)
└── project.godot          # Engine configuration & project settings
```

---

## 📚 Documentation Links

- [Game Design Document (GDD)](docs/GDD.md)
- [Feature & Mechanics Backlog](docs/IDEAS.md)
- [Learning Curriculum & Tutoring Roadmap](docs/CURRICULUM.md)

---

## 📄 License

Distributed under the [MIT License](LICENSE).
