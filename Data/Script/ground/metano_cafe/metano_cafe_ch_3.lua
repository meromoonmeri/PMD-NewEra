require 'common'
require 'PartnerEssentials'
require 'GeneralFunctions'
require 'CharacterEssentials'

metano_cafe_ch_3 = {}

function metano_cafe_ch_3.SetupGround()
        if not SV.Chapter3.DefeatedBoss then
                local breloom, girafarig, gulpin, lickitung = 
                        CharacterEssentials.MakeCharactersFromList({
                                {'Breloom', 'Cafe_Table_9'},
                                {'Girafarig', 'Cafe_Table_10'},
                                {'Gulpin', 'Cafe_Table_2'},
                                {'Lickitung', 'Cafe_Table_1'}
                        })
        else
                local cleffa, aggron, gulpin, lickitung = 
                        CharacterEssentials.MakeCharactersFromList({
                                {'Cleffa', 'Cafe_Table_5'},
                                {'Aggron', 'Cafe_Table_6'},
                                {'Gulpin', 'Cafe_Table_2'},
                                {'Lickitung', 'Cafe_Table_1'}
                        })
        end
                
        GAME:FadeIn(20)
end

function metano_cafe_ch_3.Initial_Girafarig_Breloom_Conversation(chara, activator)
        local hero = CH('PLAYER')
        local partner = CH('Teammate1')
        local breloom = CH('Breloom')
        local girafarig = CH('Girafarig')
        
        GROUND:CharSetAnim(girafarig, 'None', true)
        GROUND:CharSetAnim(breloom, 'None', true)
        
        GROUND:CharTurnToChar(breloom, hero)
        GROUND:CharTurnToChar(girafarig, hero)
        
        GROUND:CharSetEmote(breloom, "happy", 0)
        GeneralFunctions.StartConversation(breloom, "Hé les deux,[pause=10] je savais bien que je vous retrouverais fainéants au café maintenant qu'il a rouvert,[pause=10] héhé !", "Happy")
        GROUND:CharSetEmote(breloom, "", 0)
        UI:WaitShowDialogue("Je plaisante ![pause=0] Qu'est-ce qui vous amène ici ?")
        
        GAME:WaitFrames(20)
        UI:SetSpeaker(partner)
        UI:WaitShowDialogue("Moi et " .. hero:GetDisplayName() .. " on voulait jeter un œil au café maintenant qu'il a rouvert.")
        UI:WaitShowDialogue("Et vous, qu'est-ce que vous faites ici ?")
        
        
        GAME:WaitFrames(20)
        GROUND:CharTurnToChar(partner, girafarig)
        GROUND:CharTurnToChar(hero, girafarig)
        UI:SetSpeaker(girafarig)
        UI:WaitShowDialogue("On voulait se détendre tous les trois avant de partir en expédition.")
        
        GAME:WaitFrames(20)
        GeneralFunctions.EmoteAndPause(partner, "Question", true)
        UI:SetSpeaker(partner)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Expédition ?")
        
        GAME:WaitFrames(20)
        GROUND:CharTurnToChar(partner, breloom)
        GROUND:CharTurnToChar(hero, breloom)    
        UI:SetSpeaker(breloom)
        UI:WaitShowDialogue("Ouaip.[pause=0] Ça fait un moment qu'on prévoit d'explorer des ruines dans une chaîne de montagnes lointaine.")
        UI:SetSpeakerEmotion("Inspired")
        UI:WaitShowDialogue("La rumeur dit qu'un secret incroyable se cache dans ces ruines !")
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Mais jusqu'ici,[pause=10] personne n'a rien trouvé à part de vieilles structures brisées qui ne font rien.")
        UI:WaitShowDialogue("Comme " .. girafarig:GetDisplayName() .. " et moi sommes des aventuriers plus expérimentés que la plupart,[pause=10] on a décidé d'essayer.")
        UI:WaitShowDialogue("Au départ,[pause=10] on ne devait pas partir en expédition avant quelques semaines...")
        UI:WaitShowDialogue("...Mais le Maître de la Guilde nous a demandé de partir dès que possible.")
        
        GAME:WaitFrames(20)
        UI:SetSpeaker(partner)
        UI:SetSpeakerEmotion("Inspired")
        GROUND:CharSetEmote(partner, "happy", 0)
        UI:WaitShowDialogue("Ouah ![pause=0] C'est trop cool ![pause=0] C'est ça, le genre d'aventure que je veux faire !")
        UI:WaitShowDialogue("J'ai hâte que moi et " .. hero:GetDisplayName() .. " on parte dans des aventures comme ça !")
        
        GAME:WaitFrames(20)
        GROUND:CharSetEmote(partner, "", 0)
        UI:SetSpeaker(girafarig)
        GROUND:CharTurnToChar(partner, girafarig)
        GROUND:CharTurnToChar(hero, girafarig)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Vous y arriverez un jour ![pause=0] Vous avez toute la guilde derrière vous qui vous encourage !")
        
        GAME:WaitFrames(20)
        GROUND:CharTurnToChar(partner, breloom)
        GROUND:CharTurnToChar(hero, breloom)
        UI:SetSpeaker(breloom)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Bonne chance pour le travail de la guilde en attendant ![pause=0] " .. girafarig:GetDisplayName() .. " et moi, on va se détendre ici jusqu'à notre départ.")
        
        
        GeneralFunctions.EndConversation(breloom)
        GROUND:CharTurnToChar(breloom, girafarig)
        GROUND:CharTurnToChar(girafarig, breloom)
        GROUND:CharEndAnim(breloom)
        GROUND:CharEndAnim(girafarig)
        SV.Chapter3.BreloomGirafarigConvo = true
end 


function metano_cafe_ch_3.Girafarig_Action(chara, activator)
        if SV.Chapter3.BreloomGirafarigConvo then 
                GeneralFunctions.StartConversation(chara, "Vous arriverez à notre niveau un jour ![pause=0] Vous avez toute la guilde derrière vous qui vous encourage !", "Happy")
                GeneralFunctions.EndConversation(chara)
        else 
                metano_cafe_ch_3.Initial_Girafarig_Breloom_Conversation(chara, activator)
        end
end 

function metano_cafe_ch_3.Breloom_Action(chara, activator)
        if SV.Chapter3.BreloomGirafarigConvo then 
                GeneralFunctions.StartConversation(chara, "Bonne chance pour le travail de la guilde ![pause=0] " .. CharacterEssentials.GetCharacterName("Girafarig") .. " et moi, on va se détendre ici jusqu'à notre départ.", "Happy")
                GeneralFunctions.EndConversation(chara)
        else 
                metano_cafe_ch_3.Initial_Girafarig_Breloom_Conversation(chara, activator)
        end
end 


function metano_cafe_ch_3.Lickitung_Action(chara, activator)
        if not SV.Chapter3.DefeatedBoss then
                GeneralFunctions.StartConversation(chara, "Avec le café rouvert,[pause=10] moi et " .. CharacterEssentials.GetCharacterName("Gulpin") .. " on peut reprendre nos boissons quotidiennes.")
                UI:WaitShowDialogue("Je suis un grand fan des boissons d'ici,[pause=10] mais " .. CharacterEssentials.GetCharacterName("Gulpin") .. " est un vrai passionné comparé à moi.")
        else
                local item = RogueEssence.Dungeon.InvItem('cafe_domi_blend')
                GeneralFunctions.StartConversation(chara, item:GetDisplayName() .. " est la spécialité de " .. CharacterEssentials.GetCharacterName("Shuckle") .. ".[pause=0] Malgré les ingrédients bizarres,[pause=10] c'est très bon pour la santé.")
                UI:WaitShowDialogue("Le goût,[pause=10] par contre,[pause=10] laisse à désirer...")
        end
        GeneralFunctions.EndConversation(chara)
end 

function metano_cafe_ch_3.Gulpin_Action(chara, activator)
        if not SV.Chapter3.DefeatedBoss then
                GeneralFunctions.StartConversation(chara, "Youpi ![pause=0] Boisson précieuse,[pause=10] tu es à nouveau mienne à savourer... !", "Happy")
        else
                GeneralFunctions.StartConversation(chara, "Mmmm...[pause=0] " .. STRINGS:Format('\\uE0A7').. "[color=#FFCEFF]Apple Cider[color]...[pause=0] So delicious and filling...", "Inspired")
        end
        GeneralFunctions.EndConversation(chara)
end 



function metano_cafe_ch_3.Cleffa_Action(chara, activator)
        local item = RogueEssence.Dungeon.InvItem('cafe_cheri_bomb')
        GeneralFunctions.StartConversation(chara, "Espèce d'idiote ![pause=0] C'est un café,[pause=10] " .. CharacterEssentials.GetCharacterName("Shuckle") .. " vend des boissons ![pause=0]\nBien sûr qu'on va boire le " .. item:GetDisplayName() .. " !", "Determined", false)
        UI:WaitShowDialogue("Si c'est instable,[pause=10] ça nous donnera un boost d'attaque ![pause=0]\nDonne-le-moi pour que je puisse porter ton poids mort !")
        GeneralFunctions.EndConversation(chara)
end

function metano_cafe_ch_3.Aggron_Action(chara, activator)
        local item = RogueEssence.Dungeon.InvItem('cafe_cheri_bomb')
        GeneralFunctions.StartConversation(chara, "Hé chef...[pause=0] J'ai eu ce " .. item:GetDisplayName() .. " de la part de " .. CharacterEssentials.GetCharacterName("Shuckle") .. "...", "Normal", false)
        UI:WaitShowDialogue("Il m'a dit de ne pas le boire,[pause=10] puisque c'est instable...[pause=0] On pourrait peut-être le lancer au lieu de le boire ?")
        GeneralFunctions.EndConversation(chara)
end