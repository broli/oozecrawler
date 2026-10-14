# Oozecrawler — Project Tasks & Checklist

---

## 🎯 Phase 1: Core Loop Polish & Juicing (Current Focus)

- [ ] **Overflow & Game Over System**
  - [ ] Add danger warning line near flask opening (with 2–3s countdown)
  - [ ] Create bottom kill plane (catches slimes that overflow out of the flask)
  - [ ] Decide overflow penalty: instant death vs. deducting HP / score penalty
  - [ ] Trigger Game Over state on overflow / HP loss
- [ ] **Audio & SFX**
  - [ ] Slime squish / landing audio
  - [ ] Slime bounce sound
  - [ ] Merge pop effect
  - [ ] Flask glass wall impact audio
- [ ] **Visual Juice & Effects**
  - [ ] Squash-and-stretch body deformation on collisions
  - [ ] Particle burst on merge
  - [ ] Floating combat/score text rising from merged slime
  - [ ] Random background camera shake / movement (linked to score or HP damage)
  - [ ] Add background tile details (cracks, moss, skulls, bones, etc.)
  - [ ] Endless Mode HUD: use boss/encounter space to display merged tier statistics
- [ ] **Game State & UI Controller**
  - [ ] Pause menu overlay
  - [ ] Game Over screen with final score
  - [ ] Restart button / scene reload loop
  - [ ] High-score persistence (`ConfigFile` saved to `user://`)
  - [ ] Main Title Screen with navigation buttons:
    - [ ] Endless Mode
    - [ ] Dungeon Crawl
    - [ ] Statistics
    - [ ] Bestiary
    - [ ] Achievements
    - [ ] Settings
    - [ ] About

---

## ⚔️ Phase 2: Hero Classes & Abilities

- [ ] **Barbarian Class**
  - [ ] *Force Throw:* Downward launch impulse instead of passive gravity drop
  - [ ] *Quake Slam:* Vial impact impulse to settle stuck slimes
- [ ] **Wizard Class**
  - [ ] *Slime Magnetism:* Attractive magnetic force between identical adjacent tiers
  - [ ] *Transmutation:* Spells to shift slime tier up/down
- [ ] **Rogue Class**
  - [ ] *Slime Lubrication:* Compress collision hull temporarily to squeeze into gaps
  - [ ] *Swap Position:* Swap placement of two target slimes
  - [ ] *Sneak Drop:* Zero-bounce precision placement

---

## 🧪 Phase 3: Flask & Container Variations

- [ ] **Erlenmeyer (Conical) Flask:** Wide base with restrictive narrow neck
- [ ] **Test Tube:** Tall, narrow vertical column (punishing stacking)
- [ ] **Round-Bottom Flask:** Curved circular bowl rolling slimes toward center
- [ ] **Obstacle & Gimmick Flasks:**
  - [ ] Pegs and dividers that split and redirect drops (Plinko mechanics)
  - [ ] Double flasks (two adjacent flasks sharing a dropper entrance)

---

## 🗺️ Phase 4: Dungeon Crawl Roguelite Mode

- [ ] **Procedural Node Map**
  - [ ] *Slay the Spire*-style map with forks and node types
  - [ ] Combat, Elite, Mystery events, Alchemist Shop, Rest/Healing Shrines
- [ ] **Encounter & Enemy System**
  - [ ] RNG encounter selector
  - [ ] Bestiary tiers: Easy, Mid, and Bosses
  - [ ] Boss mechanics (unique/gimmick jars, disrupted physics)
  - [ ] Enemy Intent & Disruption (sludge drops, container shakes, wall constriction)
- [ ] **Turn-Based Combat & Resources**
  - [ ] Merges generate attack power and elemental triggers to damage monsters
  - [ ] Turn counter progression
  - [ ] Player resource tracking (HP, mana/energy, gold)
  - [ ] Healing shrines and resource restoration nodes
- [ ] **Cards & Relics System**
  - [ ] In-run consumable skill cards (Acid Vial, Centrifuge, Wildcards)
  - [ ] Acquisition: card shop purchases vs. combat drops
  - [ ] Passive run relics

---

## 🏆 Phase 5: Meta-Progression & Platform Support

- [ ] **Progression & Unlocks**
  - [ ] Cross-run currency to unlock starter flasks, perks, and class abilities
  - [ ] Card deck progression (pool partially locked; unlock full deck by leveling up)
- [ ] **Achievements System**
  - [ ] Milestone achievements (1st, 10th, 100th, 1000th merge, score tiers, etc.)
  - [ ] Secret achievements
  - [ ] Achievements dashboard UI (with filtering, sorting, and progress bars)
  - [ ] Online / platform leaderboards
  - [ ] Decoupled `AchievementManager` supporting local offline storage and platform integrations

---

## ✅ Completed Foundations

- [x] 11-Tier Slime progression & scaled physics parameters
- [x] Dual-buffer randomized QueueManager (`peek()` and fair distribution)
- [x] Custom procedural slime shader with eyes and radial gradients
- [x] Mouse-aimed dropper with trajectory line and preview slime
- [x] Alchemical flask container with procedural glass rendering
- [x] Procedural dungeon corridor background
- [x] Autoloaded Events bus and Score HUD
