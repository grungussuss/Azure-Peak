/obj/effect/proc_holder/spell/invoked/giants_strength
	name = "Giant's Strength"
	overlay_state = "giantsstrength"
	desc = "Strengthen the target. (+3 Strength)" // Design Note: +3 instead of +5 for direct damage stats
	cost = 2 // Direct DPS stats
	xp_gain = TRUE
	releasedrain = 60
	chargedrain = 1
	chargetime = 1 SECONDS
	recharge_time = 2 MINUTES
	warnie = "spellwarning"
	school = "transmutation"
	spell_tier = 2
	invocation = "Vis Gigantis"
	invocation_type = "whisper"
	glow_color = GLOW_COLOR_BUFF
	glow_intensity = GLOW_INTENSITY_LOW
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 2
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	range = 7

/obj/effect/proc_holder/spell/invoked/giants_strength/cast(list/targets, mob/user)
	var/atom/A = targets[1]
	if(!isliving(A))
		revert_cast()
		return

	var/mob/living/spelltarget = A
	playsound(get_turf(spelltarget), 'sound/magic/haste.ogg', 80, TRUE, soundping = TRUE)

	if(spelltarget != user)
		user.visible_message("[user] mutters an incantation and [spelltarget] 's skin hardens like stone.")
		to_chat(user, span_notice("With another person as a conduit, my spell's duration is doubled."))
		spelltarget.apply_status_effect(/datum/status_effect/buff/giants_strength/other)
	else
		user.visible_message("[user] mutters an incantation and their skin hardens.")
		spelltarget.apply_status_effect(/datum/status_effect/buff/giants_strength)

	return TRUE

#define GIANTSSTRENGTH_FILTER "giantsstrength_glow"
/atom/movable/screen/alert/status_effect/buff/giants_strength
	name = "Giant's Strength"
	desc = "My muscles are strengthened. (+3 Strength)"
	icon_state = "buff"

/datum/status_effect/buff/giants_strength
	var/outline_colour ="#8B0000" // Different from strength potion cuz red = strong
	id = "giantstrength"
	alert_type = /atom/movable/screen/alert/status_effect/buff/giants_strength
	effectedstats = list("strength" = 3)
	duration = 1 MINUTES

/datum/status_effect/buff/giants_strength/other
	duration = 2 MINUTES

/datum/status_effect/buff/giants_strength/on_apply()
	. = ..()
	var/filter = owner.get_filter(GIANTSSTRENGTH_FILTER)
	if (!filter)
		owner.add_filter(GIANTSSTRENGTH_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 200, "size" = 1))
	to_chat(owner, span_warning("My muscles strengthen."))


/datum/status_effect/buff/giants_strength/on_remove()
	. = ..()
	to_chat(owner, span_warning("My strength fades away..."))
	owner.remove_filter(GIANTSSTRENGTH_FILTER)

#undef GIANTSSTRENGTH_FILTER
