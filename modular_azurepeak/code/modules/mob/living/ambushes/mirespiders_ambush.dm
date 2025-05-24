/datum/ambush_config
	var/list/mob_types = list()

/datum/ambush_config/mirespiders_ambush
	mob_types = list(
		/mob/living/simple_animal/hostile/retaliate/rogue/mirespider = 4,
		/mob/living/simple_animal/hostile/rogue/mirespider_lurker = 1
	)

/datum/ambush_config/mirespiders_crawlers
	mob_types = list(
		/mob/living/simple_animal/hostile/retaliate/rogue/mirespider = 7,
	)

/datum/ambush_config/mirespiders_aragn
	mob_types = list(
		/mob/living/simple_animal/hostile/retaliate/rogue/mirespider = 2,
		/mob/living/simple_animal/hostile/rogue/mirespider_paralytic = 1
	)

/datum/ambush_config/mirespiders_unfair
	mob_types = list(
		/mob/living/simple_animal/hostile/rogue/mirespider_paralytic = 2,
		/mob/living/simple_animal/hostile/rogue/mirespider_lurker = 1
	)
