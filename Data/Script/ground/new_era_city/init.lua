--[[
    PMD: New Era - Main Ground Script (New Era City Hub)
    This is the main hub town script where players return between dungeons.
]]--
require 'common'

local new_era_city = {}
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
function new_era_city.Init(map)
    DEBUG.EnableDbgCoro()
    print('=>> Init new_era_city <<=')
    MapStrings = COMMON.AutoLoadLocalizedStrings()
    COMMON.RespawnAllies(true)
    -- Show chapter title on first visit
    if SV.ChapterProgression.Chapter >= 1 and not SV.Chapter1.ArrivedAtCity then
        SV.Chapter1.ArrivedAtCity = true
    end
end

function new_era_city.Enter(map)
    new_era_city.PlotScripting()
end

function new_era_city.Exit(map)
end

function new_era_city.Update(map)
end

function new_era_city.GameLoad(map)
    new_era_city.PlotScripting()
end

function new_era_city.GameSave(map)
end

function new_era_city.PlotScripting()
    local hero = CH('PLAYER')
    local chapter = SV.ChapterProgression.Chapter
    
    SOUND:PlayBGM('Treasure_Town.ogg', true)
    GAME:FadeIn(40)
    
    -- Chapter-specific hub events
    if chapter >= 1 then
        -- Show appropriate dialogue based on story progress
    end
end

-------------------------------
-- NPC Interactions
-------------------------------
function new_era_city.Guildmaster_Dragonite_Action(chara, activator)
    local hero = CH('PLAYER')
    GAME:CutsceneMode(true)
    UI:SetSpeaker(Guildmaster_Dragonite)
    
    local chapter = SV.ChapterProgression.Chapter
    
    if chapter == 0 or not SV.Chapter1.ArrivedAtCity then
        UI:WaitShowDialogue("Bienvenue, petit. Je suis le Maître de Guilde Drattak.")
        UI:WaitShowDialogue("Voici la Cité Nouvelle Ère, le cœur de notre guilde d'exploration.")
        UI:WaitShowDialogue("Si tu souhaites rejoindre la guilde, parle à Lockpin au bureau.")
    elseif chapter <= 3 then
        UI:WaitShowDialogue("Comment se passe ton exploration ? Le tableau d'affichage a de nouvelles missions.")
    elseif chapter >= 4 and chapter <= 10 then
        UI:WaitShowDialogue("Ce sont des temps difficiles. L'Effondrement nous menace tous.")
        UI:WaitShowDialogue("Mais j'ai foi en toi et ton équipe. Reste fort.")
    elseif chapter >= 11 and chapter <= 18 then
        UI:WaitShowDialogue("La crise dimensionnelle s'aggrave de jour en jour.")
        UI:WaitShowDialogue("S'il te plaît, fais ce qui doit être fait. Le monde compte sur toi.")
    elseif chapter >= 19 then
        UI:WaitShowDialogue("Tout est en équilibre précaire maintenant.")
        UI:WaitShowDialogue("Va dans la Dimension des Rêves. Arrête le Chaos Primordial.")
    elseif chapter >= 20 and SV.Chapter20.Complete then
        UI:WaitShowDialogue("Tu l'as fait. Le monde est sauvé.")
        UI:WaitShowDialogue("Merci, du fond du cœur.")
    end
    
    GAME:CutsceneMode(false)
end

function new_era_city.Lopunny_Action(chara, activator)
    GAME:CutsceneMode(true)
    UI:SetSpeaker(Lopunny)
    
    if not SV.Chapter2.JoinedGuild then
        UI:WaitShowDialogue("Oh ! Un nouveau visage ! Tu es ici pour rejoindre la guilde ?")
        UI:WaitShowDialogue("Formidable ! Laisse-moi inscrire ton équipe d'exploration tout de suite !")
        UI:ChoiceMenuYesNo("Prêt à inscrire ton équipe ?",
            function(result)
                if result then
                    SV.Chapter2.JoinedGuild = true
                    SV.ChapterProgression.Chapter = 2
                    UI:WaitShowDialogue("Excellent ! Bienvenue à la Guilde Nouvelle Ère !")
                    UI:WaitShowDialogue("Consulte le tableau d'affichage pour ta première mission.")
                else
                    UI:WaitShowDialogue("Prends ton temps ! Je serai là quand tu seras prêt.")
                end
            end)
    else
        UI:WaitShowDialogue("Ravi de te voir ! Il y a toujours de nouvelles missions sur le tableau.")
        UI:WaitShowDialogue("Reste prudent là-dehors !")
    end
    
    GAME:CutsceneMode(false)
end

function new_era_city.Cinccino_Action(chara, activator)
    GAME:CutsceneMode(true)
    UI:SetSpeaker(Cinccino)
    UI:WaitShowDialogue("Bienvenue dans mon café ! Tu veux manger quelque chose ?")
    UI:WaitShowDialogue("Le Soufflé Baie est ma spécialité. Ça te remettra l'énergie !")
    GAME:CutsceneMode(false)
end

function new_era_city.Chansey_Action(chara, activator)
    GAME:CutsceneMode(true)
    UI:SetSpeaker(Chansey)
    UI:WaitShowDialogue("Oh mon Dieu ! Tu es blessé ? Laisse-moi te soigner.")
    UI:WaitShowDialogue("Voilà voilà. Tu es complètement guéri maintenant !")
    GAME:CutsceneMode(false)
end

function new_era_city.Gothitelle_Action(chara, activator)
    GAME:CutsceneMode(true)
    UI:SetSpeaker(Gothitelle)
    
    local chapter = SV.ChapterProgression.Chapter
    if chapter < 4 then
        UI:WaitShowDialogue("Bienvenue à la bibliothèque. Le savoir est le plus grand trésor.")
        UI:WaitShowDialogue("N'hésite pas à feuilleter. J'ai des textes sur tous les sujets imaginables.")
    elseif chapter >= 4 and chapter < 8 then
        UI:WaitShowDialogue("Tu devrais lire sur la Dimension Temporelle.")
        UI:WaitShowDialogue("Les textes anciens mentionnent quelque chose appelé 'L'Effondrement'...")
    elseif chapter >= 8 and chapter < 13 then
        UI:WaitShowDialogue("La vérité sur ta réincarnation... tout est ici dans ces textes.")
        UI:WaitShowDialogue("L'humain ancien qui a scellé le premier Effondrement.")
    else
        UI:WaitShowDialogue("Tout ce que nous craignions s'est réalisé.")
        UI:WaitShowDialogue("Mais tu portes l'espoir de deux vies.")
    end
    
    GAME:CutsceneMode(false)
end

function new_era_city.Scrafty_Action(chara, activator)
    GAME:CutsceneMode(true)
    UI:SetSpeaker(Scrafty)
    UI:WaitShowDialogue("Yo ! Tu veux t'entraîner ? Le dojo est toujours ouvert.")
    UI:WaitShowDialogue("Pas de douleur, pas de gain ! Voyons ce que tu as dans le ventre !")
    GAME:CutsceneMode(false)
end

function new_era_city.Meowstic_Action(chara, activator)
    GAME:CutsceneMode(true)
    UI:SetSpeaker(Meowstic)
    UI:WaitShowDialogue("Bienvenue... Je sens un grand destin t'entourer.")
    UI:WaitShowDialogue("Les étoiles murmurent une catastrophe à venir... et d'un héros qui peut l'empêcher.")
    GAME:CutsceneMode(false)
end

function new_era_city.Sunflora_Action(chara, activator)
    GAME:CutsceneMode(true)
    UI:SetSpeaker(Sunflora)
    UI:WaitShowDialogue("Oh bonjour ! Bienvenue au jardin !")
    UI:WaitShowDialogue("Sers-toi librement en baies. C'est gratuit pour les explorateurs !")
    GAME:CutsceneMode(false)
end

function new_era_city.Persian_Action(chara, activator)
    GAME:CutsceneMode(true)
    UI:SetSpeaker(Persian)
    UI:WaitShowDialogue("Banque et Stockage, à ton service !")
    UI:WaitShowDialogue("Ton argent et tes objets sont en sécurité ici, même si tu t'évanouis dans un donjon.")
    GAME:CutsceneMode(false)
end

function new_era_city.Absol_Action(chara, activator)
    GAME:CutsceneMode(true)
    UI:SetSpeaker(Absol)
    
    if SV.Chapter4.MetAbsol then
        UI:WaitShowDialogue("L'Effondrement s'intensifie. Je le sens.")
        UI:WaitShowDialogue("Mon sens du danger n'a jamais été aussi actif.")
        UI:WaitShowDialogue("Fais attention là-dehors, s'il te plaît.")
    else
        UI:WaitShowDialogue("...")
        UI:WaitShowDialogue("Tu portes une étrange résonance. Comme un souvenir d'une autre vie.")
    end
    
    GAME:CutsceneMode(false)
end

-------------------------------
-- Zone Transitions
-------------------------------
function new_era_city.Guild_Enter_Action(chara, activator)
    -- Transition to Guild Hall ground map
end

function new_era_city.Shop_Enter_Action(chara, activator)
    -- Open shop menu
end

return new_era_city
