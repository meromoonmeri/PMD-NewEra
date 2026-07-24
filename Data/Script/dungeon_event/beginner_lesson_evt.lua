require 'common'

beginner_lesson_evt = {}

--ledian is the 3rd party member
function beginner_lesson_evt.FindLedian()
--this check is needed as Ledian joins the team for floor 4 to allow team mode to work
	if GAME:GetPlayerGuestCount() == 0 then 
		return GAME:GetPlayerPartyMember(1)
	else
		return GAME:GetPlayerGuestMember(0)
	end
end


--owner is the owner of the effect. For example, if the code is for lefties recovery, then the owner might be say, aqua ring, the item lefties, or the ability regenerator (if it worked like that)
--ownerChar is the character that has the particular status/item/ability/whatever. Whoever has the lefties.
--character is the character with the item/ability/status. Whoever has the lefties, they are the target of the effect
--args is a list of arguments passed to the script (see the arg table in the SingleCharScriptEvent effect)
function beginner_lesson_evt.Floor_1_Intro(owner, ownerChar, character, args)
	--progression flag is the number of speeches given by ledian. the functions in this document follow the order they're given in the dungeon
	local chara = beginner_lesson_evt.FindLedian()
	UI:SetSpeaker(chara)
	UI:WaitShowDialogue("Hwacha ![pause=0] Bienvenue dans la zone d'apprentissage du dojo ![pause=0] Il est temps pour votre première leçon !")
	UI:WaitShowDialogue("Hoiyah ![pause=0] Sur cet étage, vous apprendrez beaucoup sur les bases de l'exploration de donjons !")
	UI:WaitShowDialogue("Les volontaires plus loin vont soit démontrer des sujets d'apprentissage,[pause=10] soit servir d'obstacles à surmonter !")
	UI:WaitShowDialogue("Assurez-vous de lire les panneaux laissés par mon meilleur élève ![pause=0] Ils contiennent des connaissances vitales essentielles pour l'exploration de donjons !")
	UI:WaitShowDialogue("Vous pouvez me parler à tout moment pour réinitialiser l'étage si vous êtes bloqué ![pause=0] N'ayez pas peur,[pause=10] mon élève !")
	UI:WaitShowDialogue("En avant ![pause=0] Il y a beaucoup à apprendre,[pause=10] kya !")
	SV.Tutorial.Progression = 1
end

function beginner_lesson_evt.Floor_2_Intro(owner, ownerChar, character, args)
	local chara = beginner_lesson_evt.FindLedian()
	UI:SetSpeaker(chara)
	UI:WaitShowDialogue("Hwacha ![pause=0] Sur cet étage, vous apprendrez les différentes altérations d'état que vous rencontrerez dans vos voyages !")
	UI:WaitShowDialogue("Les altérations d'état sont des bonus ou malus qui affectent la capacité d'un Pokémon au combat !")
	UI:WaitShowDialogue("Les volontaires plus loin vont démontrer des capacités qui appliquent des altérations d'état ![pause=0] Attaquez-les et ils utiliseront leur capacité !")
	SV.Tutorial.Progression = 2
end


function beginner_lesson_evt.Floor_3_Intro(owner, ownerChar, character, args)
	local hero = GAME:GetPlayerPartyMember(0)
	if SV.Tutorial.Progression == 3 then --set hunger and belly to 0 if ledian already cut hunger but you haven't passed the trial yet
		--set player hp to half, belly to 0
		hero.HP = hero.MaxHP / 2
		hero.Fullness = 0
	end
	
	local chara = beginner_lesson_evt.FindLedian()
	if SV.Tutorial.Progression == 2 then 
		chara.CharDir = Direction.Up
	end
	UI:SetSpeaker(chara)
	UI:WaitShowDialogue("Hwacha ![pause=0] Cet étage vous apprendra l'utilisation sage et appropriée des objets !")
	UI:WaitShowDialogue("Wahtah ![pause=0] Votre première épreuve commence ici !")
	--ledian assaults you, but only on entering the floor
	if SV.Tutorial.Progression == 2 then
		--todo: tidy up when Audino adds calls for dungeon animations
		GAME:WaitFrames(10)
		local ledianAction = RogueEssence.Dungeon.CharAnimAction()
		ledianAction.BaseFrameType = 8 --chop
		ledianAction.AnimLoc = chara.CharLoc
		ledianAction.CharDir = chara.CharDir
		TASK:WaitTask(chara:StartAnim(ledianAction))
		SOUND:PlayBattleSE('DUN_Attack')
		GAME:WaitFrames(10)
		local heroAction = RogueEssence.Dungeon.CharAnimAction()
		heroAction.BaseFrameType = 4 --hurt
		heroAction.AnimLoc = hero.CharLoc
		heroAction.CharDir = hero.CharDir
		TASK:WaitTask(hero:StartAnim(heroAction))
		SOUND:PlayBattleSE('DUN_Hit_Neutral')
		hero.HP = hero.MaxHP / 2
		hero.Fullness = 0
		GAME:WaitFrames(10)
		TASK:WaitTask(hero:StartAnim(heroAction))
		GAME:WaitFrames(10)
		TASK:WaitTask(hero:StartAnim(heroAction))
		GAME:WaitFrames(20)
	end
	
	UI:WaitShowDialogue("J'ai réduit votre santé de moitié et votre ventre est complètement vide !")
	UI:WaitShowDialogue("Utilisez la nourriture et les baies dans cette pièce pour retrouver votre force afin de continuer !")
	SV.Tutorial.Progression = 3
end

function beginner_lesson_evt.Floor_3_Wand_Speech(owner, ownerChar, character, args)
	local chara = beginner_lesson_evt.FindLedian()
	local item = RogueEssence.Dungeon.InvItem('orb_cleanse')
	UI:SetSpeaker(chara)
	UI:WaitShowDialogue("Hwacha ![pause=0] Il est maintenant temps d'apprendre les baguettes et les orbes !")
	UI:WaitShowDialogue("Ce sont des objets polyvalents qui peuvent manipuler les ennemis ou être utilitaires ![pause=0] Utiles contre les ennemis que vous ne souhaitez pas combattre.")
	UI:WaitShowDialogue("Hoiyah ![pause=0] Le volontaire bloquant le chemin est très fort ! Vous ne pouvez pas le combattre directement !")
	UI:WaitShowDialogue("Vous devez utiliser une baguette pour le déplacer ![pause=0] Mais la baguette est collante !")
	UI:WaitShowDialogue("Les objets collants ne peuvent pas être utilisés ![pause=0] Vous devez utiliser un " .. item:GetDisplayName() .. " pour les nettoyer !")
	UI:WaitShowDialogue("Oohcha ![pause=0] Votre prochaine épreuve commence maintenant !")
	SV.Tutorial.Progression = 4
end

function beginner_lesson_evt.Floor_3_HeldItem_Speech(owner, ownerChar, character, args)
	local chara = beginner_lesson_evt.FindLedian()
	local item = RogueEssence.Dungeon.InvItem('held_band_of_passage')
	UI:SetSpeaker(chara)
	UI:WaitShowDialogue("Hwacha ![pause=0] Excellent travail jusqu'ici, mon élève ![pause=0] Il est temps d'apprendre les objets tenus !")
	UI:WaitShowDialogue("Wahtah ![pause=0] Des objets comme les bandes et écharpes peuvent être donnés à un Pokémon pour obtenir des effets utiles !")
	UI:WaitShowDialogue("Certains objets augmentent les stats tandis que d'autres empêchent certaines altérations d'état !")
	UI:WaitShowDialogue("Hoiyah ![pause=0] Pour cette épreuve,[pause=10] vous devez vous équiper d'un " .. item:GetDisplayName() .. " et continuer !")
	UI:WaitShowDialogue("Vous ne pourrez pas continuer sans vous équiper de la bande !")
	SV.Tutorial.Progression = 5
end 

function beginner_lesson_evt.Floor_3_ThrownReviver_Speech(owner, ownerChar, character, args)
	local chara = beginner_lesson_evt.FindLedian()
	UI:SetSpeaker(chara)
	local sticks = STRINGS:Format('\\uE0A1')..'[color=#FFCEFF]Sticks[color]'
	local stick = STRINGS:Format('\\uE0A1')..'[color=#FFCEFF]Stick[color]'
	local rock = STRINGS:Format('\\uE0A0')..'[color=#FFCEFF]Gravelerock[color]'
	local seed = STRINGS:Format('\\uE0A4')..'[color=#FFCEFF]Reviver Seeds[color]'
	UI:WaitShowDialogue("Hwacha ![pause=0] Certains objets comme les " .. sticks .. " et " .. rock .. " peuvent être lancés sur les ennemis pour infliger des dégâts !")
	UI:WaitShowDialogue("Ils sont utiles pour blesser des ennemis éloignés ![pause=0] Attention à ne pas les lancer sur vos alliés !")
	UI:WaitShowDialogue("Hoiyah ![pause=0] Je veux aussi vous parler des " .. seed .. " !")
	UI:WaitShowDialogue("Ils sont rares,[pause=10] mais ils vous permettent de ranimer un allié qui vient de s'évanouir !")
	UI:WaitShowDialogue("Ils sont inestimables dans les voyages difficiles ![pause=0] Utilisez-les avec sagesse !")
	UI:WaitShowDialogue("Wahtah ![pause=0] Pour cette épreuve,[pause=10] vous devez lancer un " .. stick .. " sur le volontaire plus loin !")
	UI:WaitShowDialogue("Ensuite,[pause=10] vous devez utiliser un " .. seed .. " pour nous ranimer après la puissante contre-attaque du volontaire !")
	UI:WaitShowDialogue("Oohcha ![pause=0] Ça peut être effrayant,[pause=10] mais vous ne devez montrer aucune peur face au danger,[pause=10] mon élève !") 
	SV.Tutorial.Progression = 6
end 

function beginner_lesson_evt.Floor_4_Intro(owner, ownerChar, character, args)
	--move ledian into the actual team for the team mode section 
	if SV.Tutorial.Progression < 7 then
		p = GAME:GetPlayerGuestMember(0)
		GAME:RemovePlayerGuest(0)
		GAME:AddPlayerTeam(p)
		p:RefreshTraits()
		--todo: update this when audino adds an update
		_DUNGEON:RegenerateTurnMap()
	end
	
	local chara = beginner_lesson_evt.FindLedian()
	UI:SetSpeaker(chara)
	UI:WaitShowDialogue("Hwacha ![pause=0] Cet étage vous apprendra les types de terrains que vous rencontrerez dans les donjons !")
	UI:WaitShowDialogue("Les terrains incluent des obstacles comme l'eau, la lave et les murs !")
	UI:WaitShowDialogue("Hoiyah ![pause=0] Vous devez apprendre comment le terrain affecte la navigation en donjon pour être de bons aventuriers !")
	SV.Tutorial.Progression = 7
end

function beginner_lesson_evt.Floor_4_Key_Speech(owner, ownerChar, character, args)
	local chara = beginner_lesson_evt.FindLedian()
	UI:SetSpeaker(chara)
	UI:WaitShowDialogue("Hwacha ![pause=0] C'est le moment de l'épreuve de cet étage ![pause=0] Je me joins à votre équipe pour celle-ci !")
	UI:WaitShowDialogue("Il y a des clés à travers différents types de terrains dans la prochaine pièce !")
	UI:WaitShowDialogue("Vous devez utiliser le Mode Équipe pour me diriger à travers les terrains pour récupérer les clés et pouvoir avancer !")
	UI:WaitShowDialogue("Hoiyah ![pause=0] Appuyez sur " .. STRINGS:LocalKeyString(7)  .. " pour activer le Mode Équipe ![pause=0] J'attends vos directives,[pause=10] mon élève !")
	SV.Tutorial.Progression = 8
end 

function beginner_lesson_evt.Floor_5_Intro(owner, ownerChar, character, args)
	--move Ledian back to the guest table
	if SV.Tutorial.Progression < 9 then
		p = GAME:GetPlayerPartyMember(1)
		GAME:RemovePlayerTeam(1)
		GAME:AddPlayerGuest(p)
		p:RefreshTraits()
		--todo: update this when audino adds an update
		_DUNGEON:RegenerateTurnMap()
	end
	
	local chara = beginner_lesson_evt.FindLedian()
	UI:SetSpeaker(chara)
	UI:WaitShowDialogue("Hwacha ![pause=0] C'est le dernier étage ![pause=0] Votre épreuve finale vous attend !")
	UI:WaitShowDialogue("Utilisez les Noigrumes pour recruter le bon volontaire,[pause=10] et demandez-lui d'ouvrir le chemin vers les escaliers !")
	UI:WaitShowDialogue("Vous pouvez le faire,[pause=10] mon élève ![pause=0] Utilisez tout ce que vous avez appris et vous réussirez ![pause=0] Hoiyah !")
	SV.Tutorial.Progression = 9
end





--be sure to check function BATTLE_SCRIPT.SenseiInteract(owner, ownerChar, context, args)
--in the event lua for ledian's interact script
	
	
	
