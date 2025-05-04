//Rot-cure for revival sickness healing and rot-penalty reversal.
/obj/item/reagent_containers/glass/bottle/rogue/rotcure
	list_reagents = list(/datum/reagent/rotcure = 10)	//Should be enough for 2 usages.

/datum/reagent/rotcure
	name = "Rot-Cure"
	description = "A putrid substance that appears to be in perpetual motion. It smells and looks of living-sludge."
	color = "#034212"
	overdose_threshold = 10		//Stops people from downing too much of it.
	metabolization_rate = 0.1

/datum/reagent/rotcure/overdose_process(mob/living/M)
	M.adjustOrganLoss(ORGAN_SLOT_HEART, 0.25*REM)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 0.5*REM)
	..()
	. = 1

/datum/reagent/rotcure/on_mob_life(mob/living/carbon/M)
	if(volume > 1.6)	//Roughly 1 sip.
		M.remove_status_effect(/datum/status_effect/debuff/rotted)	//Removes de-rot debuff, which is otherwise perminant.
		M.remove_status_effect(/datum/status_effect/debuff/revived)	//Removes the 15-minute temp revive debuff.
	..()
