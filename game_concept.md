# Fatebound: Shattered Realms - Technical Design Doc

## 1. Core Concept & Victory Conditions
- **Genre:** 2D Top-down Roguelite RPG.
- **Goal:** Defeat 4 Region Bosses (Non-linear order).
- **Meta-Progression:** "Eternal Soul-Binding" (Permanent upgrades via Soul Stones).

## 2. Character Classes & Combat Mechanics
### 2.1 Character Table
| Class | Base Stat | Resource | Space (Evasion) | Attack Style |
| :--- | :--- | :--- | :--- | :--- |
| **Warrior** | Strength | Rage | Roll | Melee, High HP |
| **Ranger** | Dexterity | Energy | Swift Dash | Single Target Ranged |
| **Wizard** | Intelligence | Mana | Teleport | AoE Ranged (Lower DMG) |

### 2.2 Combat Math & Scaling
- **Damage Formula:** `Total Damage = (Weapon Damage * Skill Multiplier) * (Stat Coefficient)`
- **Auto-Attack Logic:** Only triggers when **IDLE** (No Move/LMB/RMB/Space input).
- **Evasion Logic:** Dexterity-based chance to completely dodge an incoming hit.
    - **Scaling:** Logarithmic (Diminishing returns).
    - **Hard Cap:** **80% Maximum Evasion**.

## 2.3 Stat Effects & Scaling Details
- **Strength (STR):** Increases **Max HP** and **HP Regeneration**.
- **Dexterity (DEX):** - Increases **Attack/Cast Speed**.
    - Increases **Movement Speed** (Log-scaled: $\text{Base} + A \times \ln(1 + \text{DEX})$).
    - Increases **Evasion Chance** (Log-scaled, **Hard Cap: 80%**).
- **Intelligence (INT):** Increases **Resource Gain Rate** and **Armor**.

## 2.4 Damage Calculation
- **Formula:** $\text{Total Damage} = (\text{Weapon Damage} \times \text{Skill Multiplier}) \times (\text{Stat Coefficient})$
- Each skill has a different primary stat multiplier (e.g., Warrior skills scale more with STR).
- **Auto-Attack:** Triggers only when the player is **IDLE**.

## 3. The Global Skill System (Skill Map)
### 3.1 Structure & Acquisition
- **Shared Map:** Grid of nodes (PoE style). Classes start at unique coordinates.
- **Unlocking:** Nodes become "Available" once an adjacent prerequisite skill reaches its **Required Level**.
- **The 3-Choice Discovery:** Spending a Skill Point presents 3 random "Available" nodes.
- **Jackpot Multiplier:** Spent points have a **1x, 2x, or 3x** level-up chance (Modified by Luck).

## 4. The Randomness & Luck System
### 4.1 Rarity Tiers
- **Five Tiers:** Common (White), Uncommon (Green), Rare (Blue), Epic (Purple), Legendary (Gold).
- **Luck Influence:** Increases the probability of:
    - 2x and 3x "Jackpot" rolls for Stats/Skills.
    - Higher Rarity Skills and Equipment drops.
    - Spawn rate of Hyper Rooms (High enemy density / 2x Elites).

## 5. World & Economy
- **Hyper Rooms:** Includes a **Pity System** (Chance increases every time a Hyper Room doesn't trigger).
- **Room Types:** Battle, Elite, Blacksmith (Upgrade/Reroll), Shop.

## 6. Technical Implementation (for LLM)
- `Player.gd`: State machine with `is_idle` check and Stat-to-Speed/Evasion Logscaling.
- `CombatCalculator.gd`: Handles damage, stat scaling, and the 80% Evasion cap.
- `StatsManager.gd`: Logic for `1x/2x/3x` rolls and `luck_weight`.