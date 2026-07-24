#!/usr/bin/env python3
"""Generate key item JSON files for PMD: New Era mod."""
import json
import os

REPO_DIR = '/home/z/my-project/pmd-newera-repo'
ITEM_DIR = os.path.join(REPO_DIR, 'Data', 'Item')

ITEMS = {
    # Berries
    'berry_oran': {"Name": {"DefaultText": "Oran Berry", "LocalTexts": {"fr": "Baie Oran"}}, "Description": "A Berry that restores 10 HP when eaten.", "Category": "berry"},
    'berry_sitrus': {"Name": {"DefaultText": "Sitrus Berry", "LocalTexts": {"fr": "Baie Sitrus"}}, "Description": "A Berry that restores 30 HP when eaten.", "Category": "berry"},
    'berry_pecha': {"Name": {"DefaultText": "Pecha Berry", "LocalTexts": {"fr": "Baie Pecha"}}, "Description": "Cures Poison status.", "Category": "berry"},
    'berry_cheri': {"Name": {"DefaultText": "Cheri Berry", "LocalTexts": {"fr": "Baie Cheri"}}, "Description": "Cures Paralysis status.", "Category": "berry"},
    'berry_rawst': {"Name": {"DefaultText": "Rawst Berry", "LocalTexts": {"fr": "Baie Baie"}}, "Description": "Cures Burn status.", "Category": "berry"},
    'berry_chesto': {"Name": {"DefaultText": "Chesto Berry", "LocalTexts": {"fr": "Baie Willia"}}, "Description": "Cures Sleep status.", "Category": "berry"},
    'berry_aspear': {"Name": {"DefaultText": "Aspear Berry", "LocalTexts": {"fr": "Baie Kika"}}, "Description": "Cures Freeze status.", "Category": "berry"},
    'berry_lum': {"Name": {"DefaultText": "Lum Berry", "LocalTexts": {"fr": "Baie Maron"}}, "Description": "Cures all status conditions.", "Category": "berry"},
    'berry_leppa': {"Name": {"DefaultText": "Leppa Berry", "LocalTexts": {"fr": "Baie Maron"}}, "Description": "Restores 10 PP to all moves.", "Category": "berry"},
    
    # Seeds
    'seed_reviver': {"Name": {"DefaultText": "Reviver Seed", "LocalTexts": {"fr": "Graine Renaissance"}}, "Description": "Automatically revives you when you faint.", "Category": "seed"},
    'seed_plain': {"Name": {"DefaultText": "Plain Seed", "LocalTexts": {"fr": "Graine Ordinaire"}}, "Description": "A seed that restores a small amount of HP.", "Category": "seed"},
    'seed_sleep': {"Name": {"DefaultText": "Sleep Seed", "LocalTexts": {"fr": "Graine Sommeil"}}, "Description": "Puts an enemy to sleep when thrown.", "Category": "seed"},
    'seed_warp': {"Name": {"DefaultText": "Warp Seed", "LocalTexts": {"fr": "Graine Distorsion"}}, "Description": "Warps you to another floor.", "Category": "seed"},
    'seed_vile': {"Name": {"DefaultText": "Vile Seed", "LocalTexts": {"fr": "Graine Pourrie"}}, "Description": "Lowers the level of a Pokemon hit by 1.", "Category": "seed"},
    'seed_blast': {"Name": {"DefaultText": "Blast Seed", "LocalTexts": {"fr": "Graine Explosion"}}, "Description": "Deals damage to all nearby enemies when thrown.", "Category": "seed"},
    'seed_ice': {"Name": {"DefaultText": "Freeze Seed", "LocalTexts": {"fr": "Graine Glace"}}, "Description": "Freezes an enemy when thrown.", "Category": "seed"},
    
    # Orbs
    'orb_escape': {"Name": {"DefaultText": "Escape Orb", "LocalTexts": {"fr": "Orbe Fuite"}}, "Description": "Instantly escapes from the dungeon.", "Category": "orb"},
    'orb_scanner': {"Name": {"DefaultText": "Scanner Orb", "LocalTexts": {"fr": "Orbe Scanner"}}, "Description": "Reveals the locations of all items on the floor.", "Category": "orb"},
    'orb_luminous': {"Name": {"DefaultText": "Luminous Orb", "LocalTexts": {"fr": "Orbe Lumineux"}}, "Description": "Lights up the entire floor.", "Category": "orb"},
    'orb_totter': {"Name": {"DefaultText": "Totter Orb", "LocalTexts": {"fr": "Orbe Vertige"}}, "Description": "Confuses all enemies on the floor.", "Category": "orb"},
    'orb_trawl': {"Name": {"DefaultText": "Trawl Orb", "LocalTexts": {"fr": "Orbe Filet"}}, "Description": "Pulls all items on the floor toward you.", "Category": "orb"},
    'orb_slumber': {"Name": {"DefaultText": "Slumber Orb", "LocalTexts": {"fr": "Orbe Sommeil"}}, "Description": "Puts all enemies on the floor to sleep.", "Category": "orb"},
    
    # Key Items (Story)
    'key_dimensional_anchor': {"Name": {"DefaultText": "Dimensional Anchor", "LocalTexts": {"fr": "Ancre Dimensionnelle"}}, "Description": "An ancient device that stabilizes dimensional boundaries. Found in the Underground City. It resonates with the hero's soul.", "Category": "key_item"},
    'key_time_crest': {"Name": {"DefaultText": "Time Crest", "LocalTexts": {"fr": "Creste Temporelle"}}, "Description": "A fragment of Dialga's power. Allows control over temporal energy. Earned after purifying the corrupted Dialga.", "Category": "key_item"},
    'key_space_pearl': {"Name": {"DefaultText": "Space Pearl", "LocalTexts": {"fr": "Perle Spatiale"}}, "Description": "A fragment of Palkia's power. Allows manipulation of spatial dimensions. Gifted by Palkia in the Space Between.", "Category": "key_item"},
    'key_origin_plate': {"Name": {"DefaultText": "Origin Plate", "LocalTexts": {"fr": "Plaque Originelle"}}, "Description": "The ultimate artifact. Channel of Arceus's creation power. Required to seal the Primordial Chaos.", "Category": "key_item"},
    'key_dream_torch': {"Name": {"DefaultText": "Dream Torch", "LocalTexts": {"fr": "Torche Reve"}}, "Description": "A torch that burns with dream energy. Essential for navigating the Dream Dimension and purifying nightmares.", "Category": "key_item"},
    'key_ancient_recording': {"Name": {"DefaultText": "Ancient Recording", "LocalTexts": {"fr": "Enregistrement Ancien"}}, "Description": "A prehistoric recording from the first Collapse. Contains information about the hero's past life and the original sealing.", "Category": "key_item"},
    'key_guardian_seal': {"Name": {"DefaultText": "Guardian Seal", "LocalTexts": {"fr": "Sceau Gardien"}}, "Description": "A seal placed by the ancient Claydol guardian. Protects against dimensional distortion.", "Category": "key_item"},
    'key_temporal_shard': {"Name": {"DefaultText": "Temporal Shard", "LocalTexts": {"fr": "Eclat Temporel"}}, "Description": "A shard of crystallized time. Evidence of the dimensional Collapse affecting reality.", "Category": "key_item"},
    'key_griseous_orb': {"Name": {"DefaultText": "Griseous Orb", "LocalTexts": {"fr": "Orbe Griseous"}}, "Description": "The orb that allows Giratina to change form. Symbol of the Distortion World's balance.", "Category": "key_item"},
    
    # Food
    'food_apple': {"Name": {"DefaultText": "Apple", "LocalTexts": {"fr": "Pomme"}}, "Description": "A juicy apple that restores 10 HP.", "Category": "food"},
    'food_big_apple': {"Name": {"DefaultText": "Big Apple", "LocalTexts": {"fr": "Grosse Pomme"}}, "Description": "A large apple that restores 30 HP.", "Category": "food"},
    
    # Throwable
    'throw_gravelerock': {"Name": {"DefaultText": "Gravelerock", "LocalTexts": {"fr": "Roche"}}, "Description": "A rock that deals damage when thrown. Can hit from a distance.", "Category": "throwable"},
    'throw_geo_pebble': {"Name": {"DefaultText": "Geo Pebble", "LocalTexts": {"fr": "Caillou"}}, "Description": "A small pebble that deals minor damage when thrown.", "Category": "throwable"},
    'throw_stick': {"Name": {"DefaultText": "Stick", "LocalTexts": {"fr": "Batonn"}}, "Description": "A stick that can be thrown to hit enemies.", "Category": "throwable"},
    'throw_golden_seed': {"Name": {"DefaultText": "Golden Seed", "LocalTexts": {"fr": "Graine Doree"}}, "Description": "A seed of extraordinary value. Temporarily boosts stats when held.", "Category": "throwable"},
    
    # Gummi
    'gummi_clear': {"Name": {"DefaultText": "Clear Gummi", "LocalTexts": {"fr": "Gelatine Transparente"}}, "Description": "A Gummi that raises all stats slightly. The type of Gummi determines which stats.", "Category": "gummi"},
    'gummi_gold': {"Name": {"DefaultText": "Gold Gummi", "LocalTexts": {"fr": "Gelatine Or"}}, "Description": "A rare Gummi that raises all stats significantly.", "Category": "gummi"},
}

def make_item_json(item_id, item_data):
    return {
        "Version": "0.7.18.1",
        "Object": {
            "$type": "PMDC.Data.ItemData, PMDC",
            "Name": item_data["Name"],
            "Released": True,
            "Comment": item_data.get("Description", ""),
            "Desc": {"DefaultText": item_data.get("Description", ""), "LocalTexts": {}},
            "SortOrder": hash(item_id) % 1000,
        }
    }

def main():
    os.makedirs(ITEM_DIR, exist_ok=True)
    
    index = {
        "Version": "0.7.18.1",
        "Object": {
            "$type": "System.Collections.Generic.Dictionary`2[[System.String, System.Private.CoreLib],[RogueEssence.Data.EntrySummary, RogueEssence]], System.Private.CoreLib"
        }
    }
    
    for item_id, item_data in ITEMS.items():
        filepath = os.path.join(ITEM_DIR, f"{item_id}.json")
        with open(filepath, 'w', encoding='utf-8') as f:
            json.dump(make_item_json(item_id, item_data), f, indent=2, ensure_ascii=False)
        
        index["Object"][item_id] = {
            "$type": "RogueEssence.Data.ItemEntrySummary, RogueEssence",
            "Name": item_data["Name"],
            "Released": True,
            "Comment": item_data.get("Description", "")[:100],
            "SortOrder": hash(item_id) % 1000,
        }
        print(f"  Created: {item_id}.json")
    
    index_path = os.path.join(ITEM_DIR, 'index.idx')
    with open(index_path, 'w', encoding='utf-8') as f:
        json.dump(index, f, indent=2, ensure_ascii=False)
    
    print(f"\nDone! {len(ITEMS)} item files + index.idx")

if __name__ == '__main__':
    main()
