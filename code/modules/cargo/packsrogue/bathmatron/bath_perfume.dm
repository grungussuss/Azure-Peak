#define CHEAP_PERFUME_PRICE 15
#define EXPENSIVE_PERFUME_PRICE 30

// Ofc Bathhouse sells perfumes
// Other server has it as random. I prefer it to not be random so people can get what they want.

/datum/supply_pack/rogue/bath_perfume
	group = "Perfumes"
	crate_name = "perfumery' crate"
	crate_type = /obj/structure/closet/crate/chest/merchant

/datum/supply_pack/rogue/bath_perfume/lavender
	name = "Lavender Perfume"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/lavender)

/datum/supply_pack/rogue/bath_perfume/cherry
	name = "Cherry Perfume"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/cherry)

/datum/supply_pack/rogue/bath_perfume/rose
	name = "Rose Perfume"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/rose)

/datum/supply_pack/rogue/bath_perfume/jasmine
	name = "Jasmine Perfume"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/jasmine)

/datum/supply_pack/rogue/bath_perfume/mint
	name = "Mint Perfume"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/mint)

/datum/supply_pack/rogue/bath_perfume/vanilla
	name = "Vanilla Perfume"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/vanilla)

/datum/supply_pack/rogue/bath_perfume/pear
	name = "Pear Perfume"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/pear)

/datum/supply_pack/rogue/bath_perfume/strawberry
	name = "Strawberry Perfume"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/strawberry)

/datum/supply_pack/rogue/bath_perfume/cinnamon
	name = "Cinnamon Perfume"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/cinnamon)

// "Premium" perfumes they are more expensive by default
// No special mechanical effects
/datum/supply_pack/rogue/bath_perfume/frankincense
	name = "Frankincense Perfume"
	cost = EXPENSIVE_PERFUME_PRICE
	contains = list(/obj/item/perfume/frankincense)

/datum/supply_pack/rogue/bath_perfume/sandalwood
	name = "Sandalwood Perfume"
	cost = EXPENSIVE_PERFUME_PRICE
	contains = list(/obj/item/perfume/sandalwood)

/datum/supply_pack/rogue/bath_perfume/myrrh
	name = "Myrrh Perfume"
	cost = EXPENSIVE_PERFUME_PRICE
	contains = list(/obj/item/perfume/myrrh)
