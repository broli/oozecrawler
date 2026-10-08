# Oozecrawler — Mechanics, Skills & Feature Ideas Backlog

This document collects gameplay ideas, class traits, utility skills, and procedural dungeon concepts for future implementation.

---

## 1. Class-Specific Mechanics & Passives

* **Barbarian (Kinetic / Heavy Impact):**
  - **Force Throw:** Instead of passively dropping slimes under gravity, throws them downward with downward linear velocity/impulse.
  - **Crush:** Heavy drops cause stronger shockwaves, unsettling jammed slimes.

* **Rogue (Infiltration / Viscosity):**
  - **Slime Lubrication / Phase:** Temporarily or passively reduces collision hull radius on dropping slimes, allowing them to squeeze between narrow gaps and slip toward the bottom of the container.
  - **Sneak Drop:** Reduced bounce or silent placement.

* **Wizard (Arcane Control / Magnetism):**
  - **Slime Magnetism:** Applies an attractive force between slimes of the identical tier within a certain radius, reducing physics randomness and guiding combos.
  - **Transmutation:** Arcane alterations to slime properties.

---

## 2. Utility Skills & Manipulation Abilities

* **Merge Radius Amplification:**
  - Skill/perk that inflates merge detection radius by $X\%$ without inflating the physical collision body, allowing slimes to merge before touching.
* **Slime Swap:**
  - Targeted active: Player clicks two slimes to swap their positions inside the vial.
* **Targeted Dissolve (Destroy):**
  - Targeted active: Click and destroy a single problematic slime that is blocking a critical merge.
* **Tier Transmutation (+ / -):**
  - Targeted active: Target a slime to increment (+1) or decrement (-1) its tier.
* **Vial Shake / Quake:**
  - Active ability: Jostles the entire container with a burst of impulse, helping settled slimes find adjacent matches.

---

## 3. Consumable Cards / Item System

* **Mario Party / Board Game Style Items:**
  - Instead of (or in addition to) static cooldown skills, items drop randomly or appear as playable consumable cards.
  - Examples:
    - *Acid Vial:* Melts bottom-most obstacle.
    - *Centrifuge Card:* Temporarily spins/re-sorts container.
    - *Wildcard Slime:* Merges with any slime tier.

---

## 4. Roguelite Crawl Mode (Post-Infinite Core Implementation)

* **Node-Based Path Selection:**
  - Procedural map routing (inspired by *Slay the Spire* / *FTL*).
  - Branching paths with distinct node types:
    - **Combat Encounter:** Fight monsters by triggering merges to attack.
    - **Elite / Miniboss:** High health, container hazard attacks (e.g., throwing toxic sludge into your vial).
    - **Mystery Events:** Alchemical experiments, gamble slimes for relics, risk-reward dialogue.
    - **Alchemist Shop:** Purchase consumable cards, passive relics, and flask upgrades using run currency.
    - **Rest Site:** Brew potions, upgrade class skills.

---

## 5. Flask / Vial Geometry Variations (Class Perks & Crawl Modifiers)

* **Alternative Container Shapes:**
  - **Erlenmeyer (Conical) Flask:** Narrow neck opening, broad stable base (easier early merges, tight top).
  - **Test Tube:** Tall, narrow vertical column (punishing stacking, requires high precision).
  - **Round-Bottom Flask:** Curved circular bowl causing slimes to roll toward center point.
  - **Funnel / Hourglass:** Two chambers connected by a restrictive choke point.
  - **Internal Obstacles / Pachinko Pegs:** Fixed central pins that split and redirect falling slimes.
* **Unlock & Usage:**
  - Class-specific starter containers (e.g., Alchemist uses conical, Barbarian uses wide cauldron).
  - Dungeon room modifiers / curses in Crawl mode.
