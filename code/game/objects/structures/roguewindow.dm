
/obj/structure/roguewindow
	name = "window"
	desc = "A glass window."
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "window-solid"
	layer = TABLE_LAYER
	density = TRUE
	anchored = TRUE
	opacity = FALSE
	max_integrity = 200
	integrity_failure = 0.5
	var/base_state = "window-solid"
	var/lockdir = 0
	var/brokenstate = 0
	blade_dulling = DULLING_BASHCHOP
	pass_flags = LETPASSTHROW
	climb_time = 20
	climb_offset = 10
	attacked_sound = 'sound/combat/hits/onglass/glasshit.ogg'
	break_sound = "glassbreak"
	destroy_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'

/obj/structure/roguewindow/Initialize()
	update_icon()
	..()

/obj/structure/roguewindow/obj_destruction(damage_flag)
	message_admins("Window destroyed. [ADMIN_JMP(src)]")
	log_admin("Window destroyed at X:[src.x] Y:[src.y] Z:[src.z] in area: [get_area(src)]")
	..()

/obj/structure/roguewindow/attacked_by(obj/item/I, mob/living/user)
	..()
	if(obj_broken || obj_destroyed)
		var/obj/effect/track/structure/new_track = new(get_turf(src))
		new_track.handle_creation(user)

/obj/structure/roguewindow/update_icon()
	if(brokenstate)
		icon_state = "[base_state]br"
		return
	icon_state = "[base_state]"

/obj/structure/roguewindow/openclose/OnCrafted(dirin)
	dirin = turn(dirin, 180)
	lockdir = dirin
	. = ..(dirin)

/obj/structure/roguewindow/stained
	icon_state = null
	base_state = null
	opacity = TRUE
	max_integrity = 200 
	integrity_failure = 0.5

/obj/structure/roguewindow/stained/silver
	icon_state = "stained-silver"
	base_state = "stained-silver"

/obj/structure/roguewindow/stained/yellow
	icon_state = "stained-yellow"
	base_state = "stained-yellow"
	
/obj/structure/roguewindow/stained/zizo
	icon_state = "stained-zizo"
	base_state = "stained-zizo"

/obj/structure/roguewindow/openclose
	icon_state = "woodwindowdir"
	base_state = "woodwindow"
	opacity = TRUE
	max_integrity = 200
	integrity_failure = 0.5

/obj/structure/roguewindow/openclose/OnCrafted(dirin)
	dir = turn(dirin, 180)
	lockdir = dir

/obj/structure/roguewindow/openclose/Initialize()
	..()
	lockdir = dir
	icon_state = base_state

/obj/structure/roguewindow/openclose/reinforced
	desc = "A glass window. This one looks reinforced with a metal mesh."
	icon_state = "reinforcedwindowdir"
	base_state = "reinforcedwindow"
	max_integrity = 800
	integrity_failure = 0.1

/obj/structure/roguewindow/openclose/reinforced/OnCrafted(dirin)
	dir = turn(dirin, 180)
	lockdir = dir

/obj/structure/roguewindow/openclose/reinforced/Initialize()
	..()
	lockdir = dir
	icon_state = base_state

/obj/structure/roguewindow/openclose/reinforced/brick
	desc = "A glass window. This one looks reinforced with a metal frame."
	icon_state = "brickwindowdir"
	base_state = "brickwindow"
	max_integrity = 1000	//Better than reinforced by a bit; metal frame.

/obj/structure/roguewindow/openclose/reinforced/brick/OnCrafted(dirin)
	dir = turn(dirin, 180)
	lockdir = dir

/obj/structure/roguewindow/openclose/reinforced/brick/Initialize()
	..()
	lockdir = dir
	icon_state = base_state

/obj/structure/roguewindow/openclose/Initialize()
	lockdir = dir
	icon_state = base_state
	GLOB.TodUpdate += src
	..()

/obj/structure/roguewindow/openclose/Destroy()
	GLOB.TodUpdate -= src
	return ..()

/obj/structure/roguewindow/openclose/update_tod(todd)
	update_icon()

/obj/structure/roguewindow/openclose/update_icon()
	var/isnight = FALSE
	if(GLOB.tod == "night")
		isnight = TRUE
	if(brokenstate)
		if(isnight)
			icon_state = "[base_state]br"
		else
			icon_state = "w-[base_state]br"
		return
	if(climbable)
		if(isnight)
			icon_state = "[base_state]op"
		else
			icon_state = "w-[base_state]op"
	else
		if(isnight)
			icon_state = "[base_state]"
		else
			icon_state = "w-[base_state]"

/obj/structure/roguewindow/openclose/attack_right(mob/user)
	if(get_dir(src,user) == lockdir)
		if(brokenstate)
			to_chat(user, span_warning("It's broken, that would be foolish."))
			return
		if(climbable)
			close_up(user)
		else
			open_up(user)
	else
		to_chat(user, span_warning("The window doesn't close from this side."))

/obj/structure/roguewindow/proc/open_up(mob/user)
	visible_message(span_info("[user] opens [src]."))
	playsound(src, 'sound/foley/doors/windowup.ogg', 100, FALSE)
	climbable = TRUE
	opacity = FALSE
	update_icon()

/obj/structure/roguewindow/proc/force_open()
	playsound(src, 'sound/foley/doors/windowup.ogg', 100, FALSE)
	climbable = TRUE
	opacity = FALSE
	update_icon()

/obj/structure/roguewindow/proc/close_up(mob/user)
	visible_message(span_info("[user] closes [src]."))
	playsound(src, 'sound/foley/doors/windowdown.ogg', 100, FALSE)
	climbable = FALSE
	opacity = TRUE
	update_icon()

/obj/structure/roguewindow/CanPass(atom/movable/mover, turf/target)
	if(istype(mover) && (mover.pass_flags & PASSTABLE) && climbable)
		return 1
	if(isliving(mover))
		if(mover.throwing)
			if(!climbable)
				take_damage(10)
			if(brokenstate)
				return 1
	else if(isitem(mover))
		var/obj/item/I = mover
		if(I.throwforce >= 10)
			take_damage(10)
			if(brokenstate)
				return 1
		else
			return !density
	return ..()

/obj/structure/roguewindow/attackby(obj/item/W, mob/user, params)
	return ..()

/obj/structure/roguewindow/attack_paw(mob/living/user)
	attack_hand(user)

/obj/structure/roguewindow/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(brokenstate)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	if(HAS_TRAIT(user, TRAIT_BASHDOORS))
		src.take_damage(15)
		return
	src.visible_message(span_info("[user] knocks on [src]."))
	add_fingerprint(user)
	playsound(src, 'sound/misc/glassknock.ogg', 100)

/obj/structure/roguewindow/obj_break(damage_flag)
	if(!brokenstate)
		attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
		message_admins("Window broken. [ADMIN_JMP(src)]")
		log_admin("Window broken at X:[src.x] Y:[src.y] Z:[src.z] in area: [get_area(src)]")
		loud_message("A loud crash of a window getting broken rings out", hearing_distance = 14)
		new /obj/item/natural/glass/shard (get_turf(src))
		new /obj/effect/decal/cleanable/debris/glassy(get_turf(src))
		climbable = TRUE
		brokenstate = TRUE
		opacity = FALSE
	update_icon()
	..()
