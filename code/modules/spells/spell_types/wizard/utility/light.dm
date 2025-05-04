/obj/effect/proc_holder/spell/self/light
	name = "Light"
	desc = "Summons a condensed orb of light."
	overlay_state = "null"
	releasedrain = 50
	chargetime = 1
	recharge_time = 30 SECONDS
	warnie = "spellwarning"
	movement_interrupt = FALSE
	no_early_release = FALSE
	chargedloop = null
	sound = 'sound/magic/whiteflame.ogg'
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1
	miracle = FALSE

	invocation = "Fiat lux."
	invocation_type = "whisper" //can be none, whisper, emote and shout

	var/obj/item/item
	var/item_type = /obj/item/flashlight/flare/light
	var/delete_old = TRUE //TRUE to delete the last summoned object if it's still there, FALSE for infinite item stream weeeee

/obj/effect/proc_holder/spell/self/light/cast(list/targets, mob/user = usr)
	if (delete_old && item && !QDELETED(item))
		QDEL_NULL(item)
	if(user.dropItemToGround(user.get_active_held_item()))
		user.put_in_hands(make_item(), TRUE)
		user.visible_message(span_info("An orb of light condenses in [user]'s hand!"), span_info("You condense an orb of pure light!"))
	return TRUE

/obj/effect/proc_holder/spell/self/light/Destroy()
	if(item)
		qdel(item)
	return ..()

/obj/effect/proc_holder/spell/self/light/proc/make_item()
	item = new item_type
	var/mutable_appearance/magic_overlay = mutable_appearance('icons/obj/projectiles.dmi', "gumball")
	item.add_overlay(magic_overlay)
	return item

/obj/item/flashlight/flare/light
	name = "condensed light"
	desc = "An orb of condensed light."
	w_class = WEIGHT_CLASS_NORMAL
	light_outer_range = 10
	light_color = LIGHT_COLOR_WHITE
	force = 10
	icon = 'icons/roguetown/rav/obj/cult.dmi'
	icon_state = "sphere0"
	item_state = "sphere0"
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	light_color = "#ffffff"
	on_damage = 10
	flags_1 = null
	possible_item_intents = list(/datum/intent/use)
	slot_flags = ITEM_SLOT_HIP
	var/datum/looping_sound/torchloop/soundloop
	max_integrity = 200
	fuel = 10 MINUTES
	light_depth = 0
	light_height = 0

/obj/item/flashlight/flare/light5e/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.7,"sx" = -9,"sy" = 3,"nx" = 12,"ny" = 4,"wx" = -6,"wy" = 5,"ex" = 3,"ey" = 6,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 2,"sturn" = 2,"wturn" = -2,"eturn" = -2,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/flashlight/flare/light/Initialize()
	. = ..()
	soundloop = new(list(src), FALSE)
	on = TRUE
	START_PROCESSING(SSobj, src)

/obj/item/flashlight/flare/light/update_brightness(mob/user = null)
	..()
	item_state = "[initial(item_state)]"

/obj/item/flashlight/flare/light/process()
	item_state = "[initial(item_state)]"
	on = TRUE
	update_brightness()
	open_flame(heat)
	if(!fuel || !on)
		//turn_off()
		STOP_PROCESSING(SSobj, src)
		if(!fuel)
			item_state = "[initial(item_state)]"
		return
	if(!istype(loc, /obj/machinery/light/rogue/torchholder))
		if(!ismob(loc))
			if(prob(23))
				//turn_off()
				STOP_PROCESSING(SSobj, src)
				return

/obj/item/flashlight/flare/light/turn_off()
	playsound(src.loc, 'sound/items/firesnuff.ogg', 100)
	soundloop.stop()
	STOP_PROCESSING(SSobj, src)
	..()
	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_hands()
		M.update_inv_belt()
	damtype = BRUTE
	qdel(src)

/obj/item/flashlight/flare/light/update_brightness(mob/user = null)
	..()
	if(on)
		item_state = "[initial(item_state)]"
	else
		item_state = "[initial(item_state)]"
