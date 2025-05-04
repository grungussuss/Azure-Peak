/obj/effect/proc_holder/spell/invoked/ensnare
	name = "Ensnare"
	desc = "Tendrils of arcyne force hold anyone in a small area in place for a short while."
	cost = 1
	xp_gain = TRUE
	releasedrain = 20
	chargedrain = 1
	chargetime = 10
	recharge_time = 25 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE	
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	range = 6
	spell_tier = 3
	invocation = "Impedio!"
	invocation_type = "shout"
	glow_color = GLOW_COLOR_DISPLACEMENT
	glow_intensity = GLOW_INTENSITY_MEDIUM
	overlay_state = "ensnare"
	var/area_of_effect = 1
	var/duration = 5 SECONDS
	var/delay = 0.8 SECONDS

/obj/effect/proc_holder/spell/invoked/ensnare/cast(list/targets, mob/user = usr)
	var/turf/T = get_turf(targets[1])

	for(var/turf/affected_turf in view(area_of_effect, T))
		if(affected_turf.density)
			continue
		new /obj/effect/temp_visual/ensnare(affected_turf)

	addtimer(CALLBACK(src, PROC_REF(apply_slowdown), T, area_of_effect, duration, user), delay)
	playsound(T,'sound/magic/webspin.ogg', 50, TRUE)
	return TRUE
/obj/effect/proc_holder/spell/invoked/ensnare/proc/apply_slowdown(turf/T, area_of_effect, duration)
	for(var/mob/living/simple_animal/hostile/animal in range(area_of_effect, T))
		animal.Paralyze(duration, updating = TRUE, ignore_canstun = TRUE)	//i think animal movement is coded weird, i cant seem to stun them
	for(var/mob/living/L in range(area_of_effect, T))
		if(L.anti_magic_check())
			visible_message(span_warning("The tendrils of force can't seem to latch onto [L] "))  //antimagic needs some testing
			playsound(get_turf(L), 'sound/magic/magic_nulled.ogg', 100)
			return
		L.Immobilize(duration)
		L.OffBalance(duration)
		L.visible_message("<span class='warning'>[L] is held by tendrils of arcyne force!</span>")
		new /obj/effect/temp_visual/ensnare/long(get_turf(L))

/obj/effect/temp_visual/ensnare
	icon = 'icons/effects/effects.dmi'
	icon_state = "curseblob"
	duration = 1 SECONDS

/obj/effect/temp_visual/ensnare/long
	duration = 3 SECONDS
