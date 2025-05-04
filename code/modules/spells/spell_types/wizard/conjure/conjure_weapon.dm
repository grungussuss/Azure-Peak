#define CONJURE_DURATION 15 MINUTES

/obj/effect/proc_holder/spell/invoked/conjure_weapon
	name = "Conjure Weapon"
	desc = "Conjure a weapon of your choice in your hand or on the ground.\n\
	The weapon lasts for 15 minutes - but will refresh its duration infinitely when in the hand of an Arcyne user.\n\
	At 12 int or above, conjure steel-tier weapons, otherwise conjure iron-tier weapons. Melee weapons only."
	overlay_state = "conjure_weapon"
	sound = list('sound/magic/whiteflame.ogg')

	releasedrain = 60
	chargedrain = 1
	chargetime = 10 SECONDS // This is meant to make mid-combat summoning harder.
	no_early_release = TRUE
	recharge_time = 5 MINUTES // Not meant to be spammed or used as a mega support spell to outfit an entire party

	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = TRUE
	antimagic_allowed = FALSE
	charging_slowdown = 3
	cost = 1
	spell_tier = 2 // Spellblade tier.

	invocation = "Arma Exoriantur!"
	invocation_type = "shout"
	glow_color = GLOW_COLOR_METAL
	glow_intensity = GLOW_INTENSITY_LOW

	var/list/iron_weapons = list(
		"Iron Short Sword" = /obj/item/rogueweapon/sword/iron/short,
		"Iron Messer" = /obj/item/rogueweapon/sword/iron/messer,
		"Zweihander" = /obj/item/rogueweapon/greatsword/zwei,
		"Cudgel" = /obj/item/rogueweapon/mace/cudgel,
		"Iron Warhammer" = /obj/item/rogueweapon/mace/warhammer,
		"Iron Dagger" = /obj/item/rogueweapon/huntingknife/idagger,
		"Iron Axe" = /obj/item/rogueweapon/stoneaxe/woodcut,
		"Iron Greataxe" = /obj/item/rogueweapon/greataxe,
		"Iron Flail" = /obj/item/rogueweapon/flail,
		"Iron Spear" = /obj/item/rogueweapon/spear,
		"Whip" = /obj/item/rogueweapon/whip,
	)
	// There's no way I am putting Lucerne in iron tier I am gonna misclassify it as steel on purpose

	// Trying to keep the list manageable so 1 / 2 iconic thing from each family is fine
	var/list/steel_weapons = list(
		"Steel Sabre" = /obj/item/rogueweapon/sword/sabre,
		"Steel Rapier" = /obj/item/rogueweapon/sword/rapier,
		"Bastard Sword" = /obj/item/rogueweapon/sword/long,
		"Zweihander" = /obj/item/rogueweapon/greatsword/grenz,
		"Battle Axe" = /obj/item/rogueweapon/stoneaxe/battle,
		"Steel Dagger" = /obj/item/rogueweapon/huntingknife/idagger/steel,
		"Halberd" = /obj/item/rogueweapon/halberd,
		"Steel Warhammer" = /obj/item/rogueweapon/mace/warhammer/steel,
		"Steel Flail" = /obj/item/rogueweapon/flail/sflail,
		"Whip" = /obj/item/rogueweapon/whip,
	)

/obj/effect/proc_holder/spell/invoked/conjure_weapon/cast(list/targets, mob/living/user = usr)
	var/list/weapons = iron_weapons
	if(user.STAINT >= 12)
		weapons = steel_weapons
	var/weapon_choice = input(user, "Choose a weapon", "Conjure Weapon") as anything in weapons
	if(!weapon_choice)
		return
	weapon_choice = weapons[weapon_choice]

	var/obj/item/rogueweapon/R = new weapon_choice(user.drop_location())
	R.AddComponent(/datum/component/conjured_item, CONJURE_DURATION)
	user.put_in_hands(R)
	return TRUE


#undef CONJURE_DURATION
