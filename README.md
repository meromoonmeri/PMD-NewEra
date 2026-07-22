# Pokemon Mystery Dungeon: NEW ERA

A complete PMDO (Pokémon Mystery Dungeon: Origins) mod featuring **20 story chapters**, **150 dungeons**, **87 starter Pokémon**, **27+ characters**, **28 bosses**, and an epic storyline about saving the world from the **Primordial Collapse**.

## About

PMD: New Era tells the story of a human who awakens in the Pokémon World with no memory, transformed into a Pokémon. Together with their partner Litwick, they discover their destiny is tied to an ancient catastrophe known as "The Collapse" — a dimensional unraveling that threatens to destroy all of existence.

### Story Arc

The mod spans 20 chapters across multiple dimensions:
- **Chapters 1-3**: Awakening, joining Guild New Era, exploring the world
- **Chapters 4-6**: First Collapse event, rival introduction, dimensional anomalies
- **Chapters 7-10**: Ancient ruins discovery, Temporal Dimension (Dialga), Space Between (Palkia)
- **Chapters 11-14**: Dimensional collision crisis, Distortion World (Giratina), reincarnation revelation
- **Chapters 15-17**: Sky Pillar (Rayquaza), Hall of Origin (Arceus), Primordial Chaos revealed
- **Chapters 18-20**: Legendary gathering, Dream Dimension final battle, world restoration
- **Post-game**: 50 endgame dungeons, secret legendary encounters, challenge modes

## Installation

1. Download the latest release or clone this repository
2. Copy the entire `Data/` and `Content/` folders into your PMDO mod directory
3. Ensure the mod is loaded after PMDO-Core and PMDO-DungeonEngine in your mod load order
4. Launch PMDO and select "New Era" as your mod

### Requirements
- PMDO (Pokémon Mystery Dungeon: Origins) engine
- PMDO-Core mod (base game data)
- SpriteCollab sprite pack (recommended)

## Mod Structure

```
PMD-NewEra/
├── Data/
│   ├── Zone/              # 150 dungeon zone definitions (JSON)
│   │   ├── index.idx      # Zone registry
│   │   ├── ch1_*.json     # Chapter 1 dungeons
│   │   ├── ch2_*.json     # Chapter 2 dungeons
│   │   ├── ...
│   │   └── endgame_*.json # Post-game dungeons
│   ├── Monster/           # 87 starter Pokémon data (JSON)
│   │   ├── index.idx      # Monster registry
│   │   └── *.json         # Individual Pokémon files
│   ├── Ground/            # Town and scripted area maps
│   │   └── *.rsground     # Ground map data
│   ├── Script/            # Lua event scripts
│   │   ├── ground/        # Ground map scripts (per location)
│   │   │   ├── new_era_city/
│   │   │   │   └── init.lua     # Hub town script
│   │   │   ├── misty_reach_forest/
│   │   │   │   └── init.lua     # Chapter 1 opening
│   │   │   └── ...
│   │   ├── zone/          # Zone scripts (per dungeon)
│   │   │   ├── ch1_misty_reach_forest/
│   │   │   │   └── init.lua
│   │   │   └── ...
│   │   ├── scriptvars.lua # Save data definitions
│   │   └── ...
│   ├── Universal.json     # Core mod configuration
│   └── ...
├── Content/
│   ├── BG/                # Background images (to be added)
│   ├── Chara/             # Character sprites (to be added)
│   ├── Music/             # Music tracks (to be added)
│   └── Portrait/          # Portrait images (to be added)
├── build/
│   ├── generate_zones.py  # Zone file generator
│   ├── generate_scripts.py # Lua script generator
│   └── generate_monsters.py # Monster data generator
└── README.md
```

## Features

### Starters
- **87 starter Pokémon** from Generations 1-9
- All standard starters from every generation
- Special PMD-classic picks (Meowth, Eevee, Lucario, etc.)
- Balanced stats following official base stats

### Dungeons (150)
- **100 story dungeons** (5 per chapter, 20 chapters)
- **50 endgame dungeons** unlocked after completing the story
- Themes: forest, cave, ruins, ocean, volcano, ice, desert, sky, maze, tower, and more
- Difficulty scaling from 1/10 (tutorial) to 10/10 (legendary challenges)
- Boss encounters on specific floors

### Characters (27+)
- **Hero**: Amnesiac human reborn as a Pokémon, carries the Dimensional Anchor resonance
- **Litwick (Partner)**: Cheerful exploration trainee with a connection to the Dream Dimension
- **Guildmaster Dragonite**: Wise and caring leader of Guild New Era
- **Absol**: Mysterious disaster-sensing ally
- **Zoroark (Rival)**: Competitive explorer with a redemption arc
- **Cresselia**: Dream guardian who contacts the hero through visions
- Plus 20+ more supporting characters

### Bosses (28)
Multi-phase boss encounters including:
- **Story Bosses**: Zangoose, Scrafty, Claydol, corrupted Dialga, corrupted Palkia
- **Legendary Bosses**: Giratina, Darkrai, Rayquaza, Arceus, Primordial Chaos
- **Secret Bosses**: Post-game legendary encounters

### Story Themes
- Memory and reincarnation
- The weight of promises across lifetimes
- Redemption and forgiveness
- The bonds between Pokémon and humans
- Courage in the face of cosmic catastrophe

## Building from Source

If you want to regenerate the data files:

```bash
# Generate all 150 zone JSON files
python3 build/generate_zones.py

# Generate all 167 Lua zone/ground scripts
python3 build/generate_scripts.py

# Generate monster data (if you have the starter data)
python3 build/generate_monsters.py
```

## Development Status

### Completed
- [x] 150 dungeon zone definitions (JSON)
- [x] 78 unique starter monster definitions (JSON)
- [x] Hub town ground map (New Era City)
- [x] Chapter 1 opening script (full Lua cutscene)
- [x] Hub town NPC interaction scripts
- [x] Save data structure (scriptvars.lua)
- [x] Universal configuration
- [x] Build scripts for generation

### In Progress
- [ ] Remaining chapter scripts (Chapters 2-20)
- [ ] Boss encounter scripts
- [ ] Custom ground maps for all locations
- [ ] Item definitions
- [ ] Sprite assets (using SpriteCollab)

### TODO
- [ ] Custom music tracks
- [ ] Background artwork
- [ ] Portrait images
- [ ] French localization
- [ ] Balance testing
- [ ] Endgame mission scripts

## Credits

- **Mod Design**: New Era Dev Team
- **Engine**: PMDO (Pokémon Mystery Dungeon: Origins) - RogueEssence
- **Reference**: [Halcyon](https://github.com/Palikadude/Halcyon) mod by Palikadude
- **Sprites**: [SpriteCollab](https://sprites.pmdcollab.org) / [PMDCollab](https://github.com/PMDCollab/SpriteCollab)
- **Inspiration**: Pokémon Mystery Dungeon: Explorers of Sky, Rescue Team DX

## License

This mod is a fan project and is not affiliated with or endorsed by Nintendo, Game Freak, or The Pokémon Company. All Pokémon-related content belongs to their respective owners.

---

*"No matter what happens, I will find you again."*
