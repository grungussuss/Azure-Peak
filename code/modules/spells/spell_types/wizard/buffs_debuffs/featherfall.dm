/obj/effect/proc_holder/spell/invoked/featherfall
	name = "Featherfall"
	desc = "Grant yourself and any creatures adjacent to you some defense against falls."
	cost = 1
	xp_gain = TRUE
	school = "transmutation"
	releasedrain = 50
	chargedrain = 0
	chargetime = 10 SECONDS
	recharge_time = 2 MINUTES
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = TRUE
	spell_tier = 1 // Not directly combat useful
	invocation = "Lenis Cadere"
	invocation_type = "whisper"
	glow_color = GLOW_COLOR_BUFF
	glow_intensity = GLOW_INTENSITY_LOW
	charging_slowdown = 2
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	overlay_state = "jump"

/obj/effect/proc_holder/spell/invoked/featherfall/cast(list/targets, mob/user = usr)

	user.visible_message("[user] mutters an incantation and a dim pulse of light radiates out from them.")

	for(var/mob/living/L in range(1, usr))
		L.apply_status_effect(/datum/status_effect/buff/featherfall)

	return TRUE
