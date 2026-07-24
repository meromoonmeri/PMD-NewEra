#!/usr/bin/env python3
"""Generate Lua init scripts for all PMDO zones and grounds in PMD: New Era."""
import json
import os
import re

REPO_DIR = '/home/z/my-project/pmd-newera-repo'
DUNGEONS_SRC = '/home/z/my-project/src/data/dungeons.ts'
CHAPTERS_SRC = '/home/z/my-project/src/data/chapters.ts'
CHARACTERS_SRC = '/home/z/my-project/src/data/characters.ts'

GROUND_SCRIPTS_DIR = os.path.join(REPO_DIR, 'Data', 'Script', 'ground')
ZONE_SCRIPTS_DIR = os.path.join(REPO_DIR, 'Data', 'Script', 'zone')

def sanitize_name(name):
    return re.sub(r'[^a-z0-9]+', '_', name.lower()).strip('_')

def parse_dungeon_ids(filepath):
    """Parse dungeon IDs and names from the TS source."""
    with open(filepath, 'r') as f:
        content = f.read()
    
    dungeons = []
    parts = re.split(r'\n\s*{\s*\n', content)
    
    for part in parts:
        id_m = re.search(r'id:\s*(\d+)', part)
        name_m = re.search(r"name:\s*'([^']+)'", part)
        if not name_m:
            name_m = re.search(r'name:\s*"([^"]+)"', part)
        if not id_m or not name_m:
            continue
        
        ch_m = re.search(r'chapter:\s*(\d+)', part)
        dungeons.append({
            'id': int(id_m.group(1)),
            'name': name_m.group(1),
            'chapter': int(ch_m.group(1)) if ch_m else None,
        })
    
    return dungeons

ZONE_INIT_TEMPLATE = '''--[[
    PMD: New Era - Zone Script: {dungeon_name}
    {chapter_str}
]]--
require 'common'

local {zone_key} = {{}}

function {zone_key}.Init(zone)
    DEBUG.EnableDbgCoro()
    print('=>> Init {zone_key} <<=')
end

function {zone_key}.Enter(zone)
end

function {zone_key}.Exit(zone)
end

function {zone_key}.Update(zone)
end

return {zone_key}
'''

CHAPTER_GROUND_TEMPLATE = '''--[[
    PMD: New Era - Ground Script: {ground_name}
    {description}
]]--
require 'common'

local {ground_key} = {{}}
local MapStrings = {{}}

-------------------------------
-- Map Callbacks
-------------------------------
function {ground_key}.Init(map)
    DEBUG.EnableDbgCoro()
    print('=>> Init {ground_key} <<=')
    MapStrings = COMMON.AutoLoadLocalizedStrings()
end

function {ground_key}.Enter(map)
    {ground_key}.PlotScripting()
end

function {ground_key}.Exit(map)
end

function {ground_key}.Update(map)
end

function {ground_key}.GameLoad(map)
    {ground_key}.PlotScripting()
end

function {ground_key}.GameSave(map)
end

function {ground_key}.PlotScripting()
    -- Story-specific logic for {ground_name}
end

return {ground_key}
'''

def main():
    print("Reading dungeon data...")
    dungeons = parse_dungeon_ids(DUNGEONS_SRC)
    print(f"Found {len(dungeons)} dungeons")
    
    # Generate zone Lua scripts for each dungeon
    created_zones = 0
    for d in dungeons:
        chapter = d.get('chapter')
        name = d['name']
        zone_key = f"ch{chapter}_{sanitize_name(name)}" if chapter else f"endgame_{sanitize_name(name)}"
        ch_str = f"Chapter {chapter}" if chapter else "Endgame"
        
        script_dir = os.path.join(ZONE_SCRIPTS_DIR, zone_key)
        os.makedirs(script_dir, exist_ok=True)
        
        content = ZONE_INIT_TEMPLATE.format(
            dungeon_name=name,
            chapter_str=ch_str,
            zone_key=zone_key,
        )
        
        filepath = os.path.join(script_dir, 'init.lua')
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        
        created_zones += 1
    
    print(f"Created {created_zones} zone Lua scripts")
    
    # Generate ground Lua scripts for key locations
    ground_locations = [
        ('guild_hall', 'Guild Hall', 'The main hall of Guild New Era where missions are accepted.'),
        ('guild_heros_room', 'Hero Room', 'The personal quarters of the exploration team.'),
        ('guild_dining_room', 'Guild Dining Room', 'Communal dining area for guild members.'),
        ('cafe', 'Cinccino Cafe', 'The social hub of New Era City.'),
        ('hospital', 'Pokemon Hospital', 'Chansey medical facility.'),
        ('library', 'Gothitelle Library', 'Knowledge center with restricted section.'),
        ('dojo', 'Exploration Dojo', 'Training facility run by Scrafty.'),
        ('park', 'Sunflora Park', 'Peaceful garden area.'),
        ('bank', 'Bank and Storage', 'Persian financial institution.'),
        ('market', 'Market District', 'Shopping area for items and equipment.'),
        ('fortune_parlor', 'Meowstic Fortune Parlor', 'Mysterious fortune telling shop.'),
        ('residential', 'Residential Area', 'Living quarters for civilians.'),
        ('ancient_ruins', 'Ancient Ruins', 'Archaeological site from the first Collapse era.'),
        ('sky_bridge', 'Sky Bridge', 'Gateway to sky dungeons, built by Rayquaza.'),
        ('dream_altar', 'Dream Altar', 'Gateway to the Dream Dimension.'),
        ('evacuation_camp', 'Hero Camp', 'Emergency settlement during dimensional crisis.'),
        ('first_hilltop', 'First Hilltop', 'Where the hero first saw New Era City.'),
    ]
    
    created_grounds = 0
    for ground_key, ground_name, description in ground_locations:
        script_dir = os.path.join(GROUND_SCRIPTS_DIR, ground_key)
        os.makedirs(script_dir, exist_ok=True)
        
        content = CHAPTER_GROUND_TEMPLATE.format(
            ground_name=ground_name,
            description=description,
            ground_key=ground_key,
        )
        
        filepath = os.path.join(script_dir, 'init.lua')
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        
        created_grounds += 1
    
    print(f"Created {created_grounds} ground Lua scripts")
    print(f"Total: {created_zones + created_grounds} Lua scripts generated")

if __name__ == '__main__':
    main()
