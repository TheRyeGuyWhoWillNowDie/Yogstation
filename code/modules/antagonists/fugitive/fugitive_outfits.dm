/datum/outfit/prisoner
	name = "Prison Escapee"
	uniform = /obj/item/clothing/under/rank/prisoner
	shoes = /obj/item/clothing/shoes/sneakers/orange
	r_pocket = /obj/item/kitchen/knife/carrotshiv
	var/list/rhand_items = list(
		/obj/item/storage/toolbox/mechanical,
		/obj/item/twohanded/spear,
		/obj/item/gun/ballistic/automatic/surplus,
		/obj/item/melee/baton/cattleprod
		) //Prisoners get a random item from this list

/datum/outfit/prisoner/post_equip(mob/living/carbon/human/H, visualsOnly=FALSE)
	if(visualsOnly)
		return
	H.fully_replace_character_name(null,"NTP #CC-0[rand(111,999)]") //same as the lavaland prisoner transport, but this time they are from CC, or CentCom
	var/chosen = pick(rhand_items)
	var/turf/T = get_turf(H)
	var/obj/item/I = new chosen(T)
	H.put_in_hands(I)

	if(istype(I, /obj/item/melee/baton/cattleprod)) //If they get a stunprod, they get one hit worth of charge.
		var/obj/item/stock_parts/cell/upgraded/C = new(T)
		C.charge = 2000
		H.put_in_hands(C)

/datum/outfit/yalp_cultist
	name = "Cultist of Yalp Elor"
	uniform = /obj/item/clothing/under/rank/chaplain
	suit = /obj/item/clothing/suit/chaplainsuit/holidaypriest
	gloves = /obj/item/clothing/gloves/color/red
	shoes = /obj/item/clothing/shoes/sneakers/black
	mask = /obj/item/clothing/mask/gas/tiki_mask/yalp_elor

/datum/outfit/waldo
	name = "Waldo"
	uniform = /obj/item/clothing/under/pants/jeans
	suit = /obj/item/clothing/suit/striped_sweater
	head = /obj/item/clothing/head/beanie/waldo
	shoes = /obj/item/clothing/shoes/sneakers/brown
	ears = /obj/item/radio/headset
	glasses = /obj/item/clothing/glasses/regular/circle

/datum/outfit/waldo/post_equip(mob/living/carbon/human/H, visualsOnly=FALSE)
	if(visualsOnly)
		return
	H.fully_replace_character_name(null,"Waldo")
	H.eye_color = "000"
	H.gender = MALE
	H.skin_tone = "caucasian3"
	H.hair_style = "Business Hair 3"
	H.facial_hair_style = "Shaved"
	H.hair_color = "000"
	H.facial_hair_color = H.hair_color

	var/list/no_drops = list()
	no_drops += H.get_item_by_slot(SLOT_SHOES)
	no_drops += H.get_item_by_slot(SLOT_W_UNIFORM)
	no_drops += H.get_item_by_slot(SLOT_WEAR_SUIT)
	no_drops += H.get_item_by_slot(SLOT_HEAD)
	no_drops += H.get_item_by_slot(SLOT_GLASSES)
	for(var/obj/item/trait_needed as anything in no_drops)
		ADD_TRAIT(trait_needed, TRAIT_NODROP, CURSED_ITEM_TRAIT(trait_needed.type))

	var/datum/action/cooldown/spell/aoe/knock/waldos_key = new(H.mind || H)
	waldos_key.Grant(H)

/datum/outfit/synthetic
	name = "Factory Error Synth"
	uniform = /obj/item/clothing/under/color/white
	ears = /obj/item/radio/headset
	r_pocket = /obj/item/reagent_containers/medspray/synthflesh

/datum/outfit/synthetic/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return
	var/obj/item/organ/eyes/robotic/glow/eyes = new()
	eyes.Insert(H, drop_if_replaced = FALSE)

/datum/outfit/spacepol
	name = "Spacepol Officer"
	uniform = /obj/item/clothing/under/rank/security/spacepol
	suit = /obj/item/clothing/suit/armor/vest/blueshirt
	belt = /obj/item/gun/ballistic/automatic/pistol/m1911
	head = /obj/item/clothing/head/helmet/police
	gloves = /obj/item/clothing/gloves/combat
	shoes = /obj/item/clothing/shoes/jackboots
	mask = /obj/item/clothing/mask/gas/sechailer/swat/spacepol
	glasses = /obj/item/clothing/glasses/sunglasses
	l_pocket = /obj/item/ammo_box/magazine/m45
	r_pocket = /obj/item/ammo_box/magazine/m45
	id = /obj/item/card/id
	back = /obj/item/storage/backpack
	box = /obj/item/storage/box/survival

/datum/outfit/russianhunters
	name = "Russian Bouny Hunter"
	uniform = /obj/item/clothing/under/soviet
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/bearpelt
	gloves = /obj/item/clothing/gloves/color/black
	mask = /obj/item/clothing/mask/gas
	r_hand = /obj/item/gun/ballistic/rifle/boltaction
	r_pocket = /obj/item/ammo_box/a762 
	mask = /obj/item/clothing/mask/gas
	back = /obj/item/storage/backpack
	box = /obj/item/storage/box/survival

/datum/outfit/spacepol/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return
	var/obj/item/card/id/W = H.wear_id
	W.assignment = "Police Officer"
	W.originalassignment = "Police Officer"
	W.registered_name = H.real_name
	W.update_label()
