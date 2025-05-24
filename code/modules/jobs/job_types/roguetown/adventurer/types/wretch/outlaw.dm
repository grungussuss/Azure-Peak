/datum/advclass/wretch/outlaw
	name = "Outlaw"
	tutorial = "You're a seasoned criminal known for your heinous acts, your face plastered on wanted posters across the region. A life of theft, robbery, and ill-gotten-gains comes naturally to you."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/wretch/outlaw
	category_tags = list(CTAG_WRETCH)
	traits_applied = list(TRAIT_STEELHEARTED, TRAIT_OUTLANDER, TRAIT_MEDIUMARMOR, TRAIT_DODGEEXPERT, TRAIT_OUTLAW) //Maybe seperate Marmor and DE between the classes but meh
	classes = list("Cutpurse" = "You are the person folk fear at night - use your cunning and speed to strike fast and get out with your spoils before anyone notices.",
					"Marauder"= "You are a brigand and a pillager - you prefer to get your coins with direct means from unfortunate victims.")


/datum/outfit/job/roguetown/wretch/outlaw/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list("Cutpurse","Marauder")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)

		if("Cutpurse")
			to_chat(H, span_warning("You are the person folk fear at night - use your cunning and speed to strike fast and get out with your spoils before anyone notices."))
			head = /obj/item/clothing/head/roguetown/helmet/kettle
			pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
			armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat
			cloak = /obj/item/clothing/cloak/raincloak/mortus
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
			backr = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
			backl = /obj/item/storage/backpack/rogue/satchel
			belt = /obj/item/storage/belt/rogue/leather
			gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
			shoes = /obj/item/clothing/shoes/roguetown/boots
			neck = /obj/item/clothing/neck/roguetown/gorget
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
			mask = /obj/item/clothing/mask/rogue/ragmask/black
			beltr = /obj/item/quiver/bolts
			r_hand = /obj/item/rogueweapon/mace/cudgel //From thief PR
			backpack_contents = list(/obj/item/storage/belt/rogue/pouch/coins/poor = 1, /obj/item/lockpickring/mundane = 1, /obj/item/flashlight/flare/torch/lantern/prelit = 1, /obj/item/rope/chain = 1, /obj/item/storage/roguebag = 1, /obj/item/ammo_casing/caseless/rogue/bolt/water = 3)
			H.mind.adjust_skillrank(/datum/skill/misc/tracking, 5, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE) //A bonus rather than something to be encouraged
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 6, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 5, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/stealing, 5, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 5, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/traps, 5, TRUE)
			H.cmode_music = 'sound/music/combat_vaquero.ogg'
			var/weapons = list("Rapier","Dagger", "Whip")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			H.set_blindness(0)
			switch(weapon_choice)
				if("Rapier")
					H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
					beltl = /obj/item/rogueweapon/sword/rapier
				if("Dagger")
					H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
					beltl = /obj/item/rogueweapon/huntingknife/idagger/silver/elvish
				if ("Whip")
					H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
					beltl = /obj/item/rogueweapon/whip
			H.change_stat("perception", 1)
			H.change_stat("endurance", 2)
			H.change_stat("speed", 3)

		if("Marauder")
			to_chat(H, span_warning("You are a brigand and a pillager - you prefer to get your coins with direct means from unfortunate victims."))
			head = /obj/item/clothing/head/roguetown/helmet
			pants = /obj/item/clothing/under/roguetown/chainlegs
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
			cloak = /obj/item/clothing/cloak/stabard/dungeon
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
			backl = /obj/item/storage/backpack/rogue/satchel
			belt = /obj/item/storage/belt/rogue/leather
			gloves = /obj/item/clothing/gloves/roguetown/angle
			shoes = /obj/item/clothing/shoes/roguetown/boots
			neck = /obj/item/clothing/neck/roguetown/chaincoif
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
			mask = /obj/item/clothing/mask/rogue/ragmask/black
			r_hand = /obj/item/rogueweapon/mace/cudgel //From thief PR
			backpack_contents = list(/obj/item/storage/belt/rogue/pouch/coins/poor = 1, /obj/item/flashlight/flare/torch/lantern/prelit = 1, /obj/item/rope/chain = 1, /obj/item/storage/roguebag = 1)
			H.mind.adjust_skillrank(/datum/skill/misc/tracking, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 6, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/stealing, 4, TRUE)
			H.cmode_music = 'sound/music/combat_bandit_brigand.ogg'
			var/weapons = list("Mace + Heather Shield","Dagger + Crossbow", "Axe + Heather Shield", "Bardiche")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			H.set_blindness(0)
			switch(weapon_choice)
				if("Mace + Heather Shield")
					H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
					beltl = /obj/item/rogueweapon/mace/steel
					backr = /obj/item/rogueweapon/shield/heater
				if("Dagger + Crossbow")
					H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
					beltl = /obj/item/rogueweapon/huntingknife/idagger/silver/elvish
					backr = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
					beltr = /obj/item/quiver/bolts
				if ("Axe + Heather Shield")
					H.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
					beltl = /obj/item/rogueweapon/stoneaxe/battle
					backr = /obj/item/rogueweapon/shield/heater
				if ("Bardiche")
					H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
					l_hand = /obj/item/rogueweapon/halberd/bardiche
					backr = /obj/item/gwstrap
			H.change_stat("constitution", 3)
			H.change_stat("endurance", 2)
			H.change_stat("speed", 2)//Still the speed class
	wretch_select_bounty(H)
