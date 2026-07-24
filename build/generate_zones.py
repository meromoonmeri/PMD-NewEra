#!/usr/bin/env python3
"""Generate PMDO Zone JSON files for PMD: New Era mod."""
import json
import re
import os

REPO_DIR = '/home/z/my-project/pmd-newera-repo'
SOURCE_FILE = '/home/z/my-project/src/data/dungeons.ts'
ZONE_DIR = os.path.join(REPO_DIR, 'Data', 'Zone')
OUTPUT_INDEX = os.path.join(ZONE_DIR, 'index.idx')

MUSIC_MAP = {
    'forest': 'Mystifying Forest.ogg', 'beach': 'Seaside_Stroll.ogg',
    'cave': 'In The Depths of the Pit.ogg', 'ruins': 'Anima Core.ogg',
    'volcano': 'Boulder Quarry.ogg', 'ice': 'Snow_Way_Out.ogg',
    'desert': 'Boulder Quarry.ogg', 'ocean': 'Craggy Coast.ogg',
    'sky': 'Goodnight.ogg', 'maze': 'File Select.ogg',
    'tower': 'Boulder Quarry.ogg', 'legendary': 'Boss Battle!.ogg',
    'water': 'Craggy Coast.ogg', 'mountain': 'Boulder Quarry.ogg',
    'swamp': 'In The Depths of the Pit.ogg', 'mystery': 'Anima Core.ogg',
    'crystal': 'Anima Core.ogg', 'spirit': 'Goodnight.ogg',
    'shadow': 'In The Depths of the Pit.ogg', 'dream': 'Goodnight.ogg',
    'distortion': 'Anima Core.ogg', 'temporal': 'Mystifying Forest.ogg',
    'spatial': 'Anima Core.ogg', 'collapse': 'Boss Battle!.ogg',
    'abyss': 'In The Depths of the Pit.ogg', 'glacier': 'Snow_Way_Out.ogg',
    'prison': 'In The Depths of the Pit.ogg', 'nightmare': 'Boss Battle!.ogg',
    'abyssal': 'In The Depths of the Pit.ogg', 'mystic': 'Anima Core.ogg',
    'divine': 'Goodnight.ogg', 'chaos': 'Boss Battle!.ogg',
}

def get_time_limit(difficulty):
    if difficulty <= 2: return 1500
    elif difficulty <= 4: return 1800
    elif difficulty <= 6: return 2000
    elif difficulty <= 8: return 2500
    else: return 3000

def get_cell_params(floors):
    if floors <= 5: return 10, 10, 2, 3, 3
    elif floors <= 10: return 8, 8, 3, 4, 3
    elif floors <= 20: return 7, 7, 4, 5, 3
    else: return 6, 6, 5, 5, 3

def get_music(theme):
    for key, val in MUSIC_MAP.items():
        if key in theme.lower():
            return val
    return 'Mystifying Forest.ogg'

def sanitize_name(name):
    return re.sub(r'[^a-z0-9]+', '_', name.lower()).strip('_')

def parse_dungeons(filepath):
    with open(filepath, 'r') as f:
        content = f.read()
    
    # Find all dungeon objects using regex
    # Pattern: { id: N, name: '...', ... }
    dungeons = []
    
    # Split by opening brace of each dungeon object
    parts = re.split(r'\n\s*{\s*\n', content)
    
    for part in parts:
        id_m = re.search(r'id:\s*(\d+)', part)
        name_m = re.search(r"name:\s*'([^']+)'", part)
        if not id_m or not name_m:
            name_m2 = re.search(r'name:\s*"([^"]+)"', part)
            if name_m2:
                name_m = name_m2
            else:
                continue
        
        d = {}
        d['id'] = int(id_m.group(1))
        d['name'] = name_m.group(1)
        
        ch_m = re.search(r'chapter:\s*(\d+)', part)
        d['chapter'] = int(ch_m.group(1)) if ch_m else None
        
        fl_m = re.search(r'floors:\s*(\d+)', part)
        d['floors'] = int(fl_m.group(1)) if fl_m else 5
        
        diff_m = re.search(r'(?:^|\n)\s*difficulty:\s*(\d+)', part)
        d['difficulty'] = int(diff_m.group(1)) if diff_m else 1
        
        theme_m = re.search(r"theme:\s*'([^']+)'", part)
        if not theme_m:
            theme_m = re.search(r'theme:\s*"([^"]+)"', part)
        d['theme'] = theme_m.group(1) if theme_m else 'forest'
        
        desc_m = re.search(r"description:\s*`([^`]+)`", part, re.DOTALL)
        if desc_m:
            d['description'] = desc_m.group(1).strip().replace('\n', ' ')[:200]
        else:
            d['description'] = ''
        
        dungeons.append(d)
    
    return dungeons

def make_zone_json(d):
    floors = d['floors']
    difficulty = d['difficulty']
    theme = d['theme']
    cell_w, cell_h, cell_x, cell_y, cell_wall = get_cell_params(floors)
    time_limit = get_time_limit(difficulty)
    music = get_music(theme)
    chapter = d.get('chapter')
    ch_str = f"Chapter {chapter}" if chapter else "Endgame"
    
    return {
        "Version": "0.7.16.0",
        "Object": {
            "$type": "RogueEssence.Data.ZoneData, RogueEssence",
            "Name": {"DefaultText": d['name'], "LocalTexts": {}},
            "Released": True,
            "Comment": f"{ch_str} - {floors} floors, difficulty {difficulty}/10",
            "NoEXP": False, "Level": -1, "LevelCap": False,
            "TeamRestrict": False, "TeamSize": -1,
            "MoneyRestrict": False, "BagRestrict": -1, "BagSize": -1,
            "Persistent": False, "Rescues": 0, "Rogue": 0,
            "Segments": [{
                "$type": "RogueEssence.LevelGen.RangeDictSegment, RogueEssence",
                "Floors": {
                    "nodes": [{
                        "Item": {
                            "$type": "RogueEssence.LevelGen.GridFloorGen, RogueEssence",
                            "GenSteps": [
                                {"Key": {"str": [-6]}, "Value": {"$type": "PMDC.LevelGen.MapDataStep`1[[RogueEssence.LevelGen.MapGenContext, RogueEssence]], PMDC", "Music": music, "TimeLimit": time_limit, "TileSight": 0, "CharSight": 0, "ClampCamera": False}},
                                {"Key": {"str": [-5]}, "Value": {"$type": "RogueElements.InitGridPlanStep`1[[RogueEssence.LevelGen.MapGenContext, RogueEssence]], RogueElements", "CellWidth": cell_w, "CellHeight": cell_h, "CellX": cell_x, "CellY": cell_y, "CellWall": cell_wall, "Wrap": False}},
                                {"Key": {"str": [-4]}, "Value": {"$type": "RogueElements.GridPathBranch`1[[RogueEssence.LevelGen.MapGenContext, RogueEssence]], RogueElements", "RoomRatio": {"Min": 70, "Max": 91}, "BranchRatio": {"Min": 0, "Max": 25}, "NoForcedBranches": False, "GenericRooms": {"$type": "RogueElements.SpawnList`1[[RogueElements.RoomGen`1[[RogueEssence.LevelGen.MapGenContext, RogueEssence]], RogueElements]], RogueElements", "$values": [{"Spawn": {"$type": "RogueElements.RoomGenRound`1[[RogueEssence.LevelGen.MapGenContext, RogueEssence]], RogueElements", "Width": {"Min": 5, "Max": 10}, "Height": {"Min": 5, "Max": 10}}, "Rate": 10}]}, "RoomComponents": [{"$type": "PMDC.LevelGen.ConnectivityRoom, PMDC", "Connection": 1}]}}
                            ]
                        }
                    }],
                    "Range": {"Min": 0, "Max": floors - 1}
                }
            }]
        }
    }

def make_index_entry(d, file_key):
    floors = d['floors']
    chapter = d.get('chapter')
    ch_str = f"Chapter {chapter}" if chapter else "Endgame"
    return {
        "$type": "RogueEssence.Data.ZoneEntrySummary, RogueEssence",
        "NoEXP": False, "Level": -1, "LevelCap": False, "KeepSkills": False,
        "TeamRestrict": False, "TeamSize": -1, "MoneyRestrict": False,
        "BagRestrict": -1, "BagSize": -1, "Rescues": 0,
        "CountedFloors": floors, "Rogue": 0, "Grounds": [],
        "Maps": [list(range(floors))],
        "Name": {"DefaultText": d['name'], "LocalTexts": {}},
        "Released": True,
        "Comment": f"{ch_str} - {floors} floors",
        "SortOrder": d['id']
    }

def main():
    print(f"Reading: {SOURCE_FILE}")
    dungeons = parse_dungeons(SOURCE_FILE)
    print(f"Parsed {len(dungeons)} dungeons")
    
    os.makedirs(ZONE_DIR, exist_ok=True)
    
    index = {
        "Version": "0.7.17.0",
        "Object": {
            "$type": "System.Collections.Generic.Dictionary`2[[System.String, System.Private.CoreLib],[RogueEssence.Data.EntrySummary, RogueEssence]], System.Private.CoreLib"
        }
    }
    
    for d in dungeons:
        chapter = d.get('chapter')
        file_key = f"ch{chapter}_{sanitize_name(d['name'])}" if chapter else f"endgame_{sanitize_name(d['name'])}"
        
        zone = make_zone_json(d)
        filepath = os.path.join(ZONE_DIR, f"{file_key}.json")
        with open(filepath, 'w', encoding='utf-8') as f:
            json.dump(zone, f, indent=2, ensure_ascii=False)
        
        index["Object"][file_key] = make_index_entry(d, file_key)
    
    with open(OUTPUT_INDEX, 'w', encoding='utf-8') as f:
        json.dump(index, f, indent=2, ensure_ascii=False)
    
    print(f"\nDone! {len(dungeons)} zone files + index.idx")

if __name__ == '__main__':
    main()
