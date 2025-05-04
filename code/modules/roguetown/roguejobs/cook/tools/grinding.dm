#define BASE_GRIND_TIME 2 SECONDS
/obj/structure/fluff/millstone
	name = "millstone"
	desc = "A millstone used to grind grain into flour."
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "millstone"
	density = TRUE
	anchored = TRUE
	blade_dulling = DULLING_BASH
	max_integrity = 400
	var/list/obj/item/to_grind = list()

/obj/structure/fluff/millstone/attackby(obj/item/W, mob/living/user, params)
	var/datum/skill/craft/cooking/cs = user?.mind?.get_skill_level(/datum/skill/craft/cooking)
	var/scaled_grind_time = BASE_GRIND_TIME / get_cooktime_divisor(cs)
	if(W.mill_result)
		if(do_after(user, scaled_grind_time, target = src))
			new W.mill_result(get_turf(loc))
			qdel(W)
	..()

#undef BASE_GRIND_TIME
