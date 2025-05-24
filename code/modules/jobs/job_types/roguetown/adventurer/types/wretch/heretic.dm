/datum/advclass/wretch/heretic
	name = "Heretic"
	tutorial = "You are a heretic, spurned by the church, cast out from society - frowned upon by Psydon and his children for your faith."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/wretch/heretic
	category_tags = list(CTAG_WRETCH)
	traits_applied = list(TRAIT_STEELHEARTED, TRAIT_OUTLANDER, TRAIT_HEAVYARMOR, TRAIT_RITUALIST, TRAIT_OUTLAW)


/datum/outfit/job/roguetown/wretch/heretic/pre_equip(mob/living/carbon/human/H)
	if (!(istype(H.patron, /datum/patron/inhumen/zizo) || istype(H.patron, /datum/patron/inhumen/matthios) || istype(H.patron, /datum/patron/inhumen/graggar) || istype(H.patron, /datum/patron/inhumen/baotha)))
		to_chat(H, span_warning("My former deity frowned upon my practices. I have since turned to a new god."))
		H.set_patron(pick(/datum/patron/inhumen/zizo, /datum/patron/inhumen/matthios, /datum/patron/inhumen/graggar, /datum/patron/inhumen/baotha))
	H.mind.adjust_skillrank(/datum/skill/magic/holy, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.set_blindness(0)
	var/weapons = list("Bastard Sword","Mace","Flail")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	switch(weapon_choice)
		if("Bastard Sword")
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			beltr = /obj/item/rogueweapon/sword/long
		if("Mace")
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
			beltr = /obj/item/rogueweapon/mace/steel
		if("Flail")
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
			beltr = /obj/item/rogueweapon/flail/sflail
	H.change_stat("strength", 2)  // Heretic is by far the best class with access to rituals (as long as they play a god with ritual), holy and heavy armor. So they keep 7 points.
	H.change_stat("constitution", 2)
	H.change_stat("endurance", 1)
	if (istype (H.patron, /datum/patron/inhumen/zizo))
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/minion_order)
		ADD_TRAIT(H, TRAIT_GRAVEROBBER, TRAIT_GENERIC)
	head = /obj/item/clothing/head/roguetown/helmet/heavy/knight/black
	cloak = /obj/item/clothing/cloak/cape/crusader
	gloves = /obj/item/clothing/gloves/roguetown/chain/blk
	pants = /obj/item/clothing/under/roguetown/chainlegs/blk
	neck = /obj/item/clothing/neck/roguetown/gorget
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	armor = /obj/item/clothing/suit/roguetown/armor/plate/blk
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/blk
	belt = /obj/item/storage/belt/rogue/leather/steel
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/rogueweapon/shield/tower/metal
	beltl = /obj/item/roguekey/inhumen
	backpack_contents = list(/obj/item/storage/belt/rogue/pouch/coins/poor = 1, /obj/item/rogueweapon/huntingknife = 1, /obj/item/ritechalk = 1, /obj/item/flashlight/flare/torch/lantern/prelit = 1, /obj/item/rope/chain = 1)
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_miracles(H, cleric_tier = CLERIC_T1, passive_gain = CLERIC_REGEN_MINOR)	//Minor regen, can level up to T4.
	wretch_select_bounty(H)
