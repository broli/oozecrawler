# Oozecrawler — Game Design Document (GDD)

## 1. High Concept & Elevator Pitch
**Oozecrawler** is a 2D fantasy physics-merge roguelite—a **"Suika Game meets Dungeon Crawler"**. Players drop bouncy, amorphous slimes into alchemical containers (vials, test tubes, flasks). When identical slimes collide, they merge into higher-tier oozes. In **Infinite Mode**, players aim for high scores while avoiding container overflow. In **Dungeon Crawl Mode**, merges trigger attacks against fantasy monsters in turn-based combat, with class skill trees (Barbarian, Wizard, Rogue) and cross-mode unlocks providing deep RPG progression.

---

## 2. Core Pillars
1. **Juicy Physical Merging:** Bouncy, squishy, semi-translucent slimes that deform, collide, and pop into larger tiers with satisfying audio-visual juice.
2. **Dual-Mode Synergy:** 
   - *Infinite Mode:* Chill, high-score driven sandbox & skill training.
   - *Roguelite Crawl:* Tactical monster encounters where merges empower your attacks.
   - Cross-mode rewards keep both modes relevant.
3. **Class Identity & Skill Trees:** Distinct playstyles (forceful throws, arcane slime magnets, slippery infiltrators) with branching passive unlocks.
4. **Lighthearted Fantasy Tone:** Humorous, pun-filled dialogue and quirky monster reactions.

---

## 3. Game Modes

### A. Infinite Normal Mode
- **Rules:** Continuous slime dropping into a chosen flask geometry.
- **Fail Condition:** Slimes stay above the top overflow limit line for more than 2–3 seconds.
- **HUD:** Current Score, High Score, Next Slime, Next+1 Slime, Slime Evolution Chart.
- **Meta Role:** Practice mechanics, complete general achievements, farm base perks for Roguelite mode.

### B. Dungeon Crawl Roguelite Mode
- **Rules:** Stage-by-stage dungeon run against enemies (e.g., Goblins, Skeletons, Alchemists, Dungeon Mimics).
- **Turn Loop:**
  - Dropping & merging slimes generates attack power/action points.
  - Higher-tier merges unleash elemental effects or critical strikes.
  - The enemy has an action counter (e.g., attacks every $N$ drops/turns).
  - Enemy attacks might disrupt your container (shake the vial, drop sludge/toxic obstacle slimes, or seal space).
- **Run Progression:** Defeating bosses unlocks relic choices, XP to spend in the class tree, and rare alchemical flask blueprints.

---

## 4. Class Archetypes & Abilities

| Class | Throw / Core Trait | Special Ability / Spell | Playstyle Theme |
| :--- | :--- | :--- | :--- |
| **Barbarian** | Extra throw force / heavy slam | *Quake Slam:* Shakes container to settle merges | High momentum, brute-force compaction |
| **Wizard** | Controlled gentle drop | *Slime Magnetism:* Attracts matching tier slimes | High synergy, tactical combo setups |
| **Rogue** | Slime lubrication | *Squeeze:* Drops compress or slip between small gaps | Precision drops, recovery from high stacks |

---

## 5. Slime Evolution Hierarchy (Tiers 1 to 10)

Slimes vary in color, radius, mass, elasticity, and translucency:
1. **Tier 1 — Droplet** (Tiny, lime green, bouncy)
2. **Tier 2 — Bloblet** (Small, cyan, lively)
3. **Tier 3 — Glob** (Medium-small, bright yellow)
4. **Tier 4 — Sludge** (Medium, orange, sticky bounce)
5. **Tier 5 — Ooze** (Medium-large, magenta)
6. **Tier 6 — Gel** (Large, royal purple, jelly-like)
7. **Tier 7 — Muck** (Bulky, crimson red)
8. **Tier 8 — Slime Knight** (Very large, sapphire blue, core visible)
9. **Tier 9 — Primordial Mass** (Huge, deep amethyst)
10. **Tier 10 — Royal King Ooze** (Screen-filling golden crowned behemoth)

---

## 6. Achievement & Platform Architecture

To support **Steam Achievements** and **Mobile Services** seamlessly:
- Dedicated **`AchievementManager`** autoload with decoupled abstract interfaces:
  - Local JSON storage for offline play / Godot standalone.
  - Pluggable backend for Steamworks (`GodotSteam`) and Google Play / Apple Game Center.
- Tracks:
  - Slime Merge Milestones (e.g., "Merge 100 Tier 1s", "Create your first King Ooze")
  - Score Thresholds ("Scored 3,000 in Infinite Mode")
  - Class Masteries ("Clear Floor 5 as Rogue without overflowing")
