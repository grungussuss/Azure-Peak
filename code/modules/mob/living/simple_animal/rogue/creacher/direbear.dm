/mob/living/simple_animal/hostile/retaliate/rogue/direbear	//This way don't need new unqiue AI controller. Wolves are modular anyway.
	icon = 'icons/roguetown/mob/monster/direbear.dmi'
	name = "direbear"
	icon_state = "direbear"
	icon_living = "direbear"
	icon_dead = "direbear_dead"
	base_intents = list(/datum/intent/simple/bite/bear)
	botched_butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 1, 
									/obj/item/natural/hide = 1, 
									/obj/item/natural/fur/direbear = 1, 
									/obj/item/natural/bone = 3)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 2,
									/obj/item/natural/hide = 2,
									/obj/item/natural/fur/direbear = 1,
									/obj/item/alch/sinew = 2, 
									/obj/item/alch/bone = 1, 
									/obj/item/alch/viscera = 2,
									/obj/item/natural/bone = 4)
	perfect_butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 3,
									/obj/item/natural/hide = 3,
									/obj/item/natural/fur/direbear = 2,
									/obj/item/alch/sinew = 2, 
									/obj/item/alch/bone = 1, 
									/obj/item/alch/viscera = 2,
									/obj/item/natural/bone = 4,
									/obj/item/natural/head/direbear = 1)
	faction = list("wolfs")		//This mf will kill undead - won't kill wolves just to avoid it fighting too many types of ambushes.
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	melee_damage_lower = 30		// Ey, bo-bo!
	melee_damage_upper = 40		// We're gonna take his pick-in-ick basket!
	vision_range = 6		
	aggro_vision_range = 8
	environment_smash = ENVIRONMENT_SMASH_NONE
	retreat_distance = 0
	minimum_distance = 0
	milkies = FALSE
	footstep_type = FOOTSTEP_MOB_BAREFOOT
	pooptype = null
	health = 250	//Wolf is 120
	maxHealth = 250
	food_type = list(/obj/item/reagent_containers/food/snacks, 
				/obj/item/bodypart, 	//Woe be upon ye
				/obj/item/organ, 		//Woe be upon ye
				/obj/effect/decal/remains,
				)
	STACON = 12
	STASTR = 13
	STASPD = 9
	simple_detect_bonus = 40	//No sneaking by our boy..
	deaggroprob = 0
	defprob = 40
	del_on_deaggro = 2 MINUTES
	retreat_health = 0.3
	food = 0
	remains_type = /obj/effect/decal/remains/bear
	attack_sound = list('sound/vo/mobs/direbear/direbear_attack1.ogg','sound/vo/mobs/direbear/direbear_attack2.ogg','sound/vo/mobs/direbear/direbear_attack3.ogg')
	dodgetime = 30
	aggressive = 1
	stat_attack = UNCONSCIOUS	//You falling unconcious won't save you, little one..
	eat_forever = TRUE
	rot_type = null

//new ai, old ai off
	AIStatus = AI_OFF
	can_have_ai = FALSE
	ai_controller = /datum/ai_controller/volf	//Same as volf so it acts like a carnivorous bastard

/mob/living/simple_animal/hostile/retaliate/rogue/direbear/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/direbear/direbear_attack1.ogg')	//Placeholder till we get more sounds
		if("pain")
			return pick('sound/vo/mobs/direbear/direbear_death1.ogg')	//Placeholder till we get more sounds
		if("death")
			return pick('sound/vo/mobs/direbear/direbear_death1.ogg', 'sound/vo/mobs/direbear/direbear_death2.ogg')

/obj/effect/decal/remains/bear
	name = "remains"
	gender = PLURAL
	icon_state = "bones"
	icon = 'icons/roguetown/mob/monster/direbear.dmi'

/datum/intent/simple/bite/bear
	clickcd = RAT_ATTACK_SPEED	//Slightly slower than wolfs by .1
