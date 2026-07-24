require 'common'
require 'PartnerEssentials'
require 'GeneralFunctions'
require 'CharacterEssentials'

metano_cafe_ch_4 = {}

function metano_cafe_ch_4.SetupGround()
        if not SV.Chapter4.FinishedGrove then
                local gulpin, lickitung, linoone = 
                        CharacterEssentials.MakeCharactersFromList({
                                {'Gulpin', 'Cafe_Table_2'},
                                {'Lickitung', 'Cafe_Table_1'},
                                {'Linoone', 'Cafe_Table_14'}
                        })
        else
                local gulpin, lickitung, mareep, cranidos = 
                        CharacterEssentials.MakeCharactersFromList({
                                {'Gulpin', 'Cafe_Table_2'},
                                {'Lickitung', 'Cafe_Table_1'},
                                {'Mareep', 'Cafe_Table_9'},
                                {'Cranidos', 'Cafe_Table_10'}
                        })
        end
                
        GAME:FadeIn(20)
end



function metano_cafe_ch_4.Lickitung_Action(chara, activator)
        if not SV.Chapter4.FinishedGrove then
                local item = RogueEssence.Dungeon.InvItem('cafe_endurance_tonic')
                GeneralFunctions.StartConversation(chara, "Tu as entendu la nouvelle ?[pause=0] " .. CharacterEssentials.GetCharacterName("Shuckle") .. " vient d'ajouter une nouvelle boisson au menu.")
                UI:WaitShowDialogue("Il l'appelle " .. item:GetDisplayName() .. ".[pause=0] Il dit que ça aide à tenir bon dans les situations difficiles.")
        else
                GeneralFunctions.StartConversation(chara, "En plus de ses boissons,[pause=10] " .. CharacterEssentials.GetCharacterName("Shuckle") .. " vend aussi une spécialité du jour à part.")
                UI:WaitShowDialogue("La spécialité n'est pas toujours géniale,[pause=10] mais parfois il propose des trucs qu'on ne trouve nulle part ailleurs.")
        end
        GeneralFunctions.EndConversation(chara)
end 

function metano_cafe_ch_4.Gulpin_Action(chara, activator)
        if not SV.Chapter4.FinishedGrove then
                local item = RogueEssence.Dungeon.InvItem('cafe_endurance_tonic')
                GeneralFunctions.StartConversation(chara, "C'est si bon...[pause=0] Quand je bois du " .. item:GetDisplayName() .. "...[pause=10] j'ai l'impression que rien ne peut m'arrêter...", "Inspired")
        else
                local item = RogueEssence.Dungeon.InvItem('food_apple_perfect')
                GeneralFunctions.StartConversation(chara, "Une fois,[pause=10] " .. CharacterEssentials.GetCharacterName("Shuckle") .. " a proposé un " .. item:GetDisplayName() .. " comme spécialité du jour !", "Normal")
                UI:SetSpeakerEmotion("Inspired")
                UI:WaitShowDialogue("C'était si bon...[pause=0] Mmmm...[pause=0] J'en salive rien qu'en y pensant...")
                UI:SetSpeakerEmotion("Sad")
                UI:WaitShowDialogue("Mais ça fait un moment qu'il n'en a plus vendu...[pause=0] Oh,[pause=10] misère...")
        end
        GeneralFunctions.EndConversation(chara)
end 

function metano_cafe_ch_4.Linoone_Action(chara, activator)
        if not SV.Chapter4.FinishedGrove then
                GeneralFunctions.StartConversation(chara, "Je suis encore en train de lire ce livre sur les donjons mystères.[pause=0] Ce chapitre parle des escaliers dans les donjons.")
                UI:WaitShowDialogue("Il dit que même si tous les donjons mystères ont des escaliers qui mènent vers l'avant,[pause=10] certains ont aussi des escaliers qui mènent vers l'arrière.")
                UI:WaitShowDialogue("Le type d'escaliers qui mène vers l'avant dépend de si c'est un donjon ascendant ou descendant.")
                UI:WaitShowDialogue("...Ça n'a aucun sens, quand même.")
                UI:WaitShowDialogue("Les donjons mystères se trouvent dans des endroits comme des grottes et des forêts, d'après ce que je comprends.")
                UI:WaitShowDialogue("Qu'est-ce que des escaliers feraient au milieu d'un endroit pareil ?[pause=0] Les donjons mystères sont vraiment bizarres.")
        else
                --N/A
        end
        GeneralFunctions.EndConversation(chara)
                
end


function metano_cafe_ch_4.Cranidos_Action(chara, activator)
        if not SV.Chapter4.FinishedGrove then
                --N/A
        else
                if not SV.Chapter4.CranidosBlush then
                        GeneralFunctions.StartConversation(chara, "Même avec l'expédition qui approche,[pause=10] je préfère continuer à traquer les fugitifs plutôt que me reposer ici.")
                        UI:WaitShowDialogue("Mais c'est ce que " .. CharacterEssentials.GetCharacterName("Mareep") .. " veut faire.[pause=0] Et passer du temps avec elle comme ça, c'est pas mal non plus...")
                        GAME:WaitFrames(40)
                        GeneralFunctions.EmoteAndPause(chara, "Exclaim", true)
                        GROUND:CharSetEmote(cranidos, "sweating", 1)
                        UI:SetSpeakerEmotion("Surprised")
                        UI:WaitShowDialogue("E-euh ![pause=0] J-je veux dire...")
                        GAME:WaitFrames(20)
                        --TODO: Get a blushing portrait for cranidos here! :3
                        UI:SetSpeakerEmotion("Stunned")
                        UI:WaitShowDialogue("V-vous n'avez rien de mieux à faire que de flemmarder ici, les bleus ?[pause=0] Allez faire quelque chose d'utile pour une fois !")
                        SV.Chapter4.CranidosBlush = true
                else 
                        GeneralFunctions.StartConversation(chara, "H-hé...[pause=0] S'il te plaît, ne lui dis pas ce que j'ai dit tout à l'heure...", "Stunned")
                end
        end
        GeneralFunctions.EndConversation(chara)
                
end

function metano_cafe_ch_4.Mareep_Action(chara, activator)
        if not SV.Chapter4.FinishedGrove then
                --N/A
        else
                GeneralFunctions.StartConversation(chara, "Salut vous deux ![pause=0] Moi et " .. CharacterEssentials.GetCharacterName("Cranidos") .. " on se détend ici jusqu'au début de l'expédition !", "Happy")
                UI:SetSpeakerEmotion("Normal")
                UI:WaitShowDialogue("Une fois qu'on sera partis,[pause=10] ça fera longtemps avant qu'on puisse revenir en ville,[pause=10] alors il faut se détendre tant qu'on le peut !")
        end
        GeneralFunctions.EndConversation(chara)
                
end
