
local S = farming.intllib

-- oat seeds
minetest.register_node("farming:seed_oat", {
	description = S("Oat Seed"),
	tiles = {"farming_oat_seed.png"},
	inventory_image = "farming_oat_seed.png",
	wield_image = "farming_oat_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:oat_1")
	end,
})

-- harvested oat
minetest.register_craftitem("farming:oat", {
	description = S("Oat"),
	inventory_image = "farming_oat.png",
	groups = {food_oat = 1, flammable = 2},
})

-- flour
minetest.register_craft({
	type = "shapeless",
	output = "farming:flour",
	recipe = {
		"farming:oat", "farming:oat", "farming:oat",
		"farming:oat", "farming:mortar_pestle"
	},
	replacements = {{"group:food_mortar_pestle", "farming:mortar_pestle"}},
})

-- oat definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_oat_1.png"},
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 3,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = default.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("farming:oat_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_oat_2.png"}
minetest.register_node("farming:oat_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_oat_3.png"}
minetest.register_node("farming:oat_3", table.copy(crop_def))

-- stage 4
crop_def.tiles = {"farming_oat_4.png"}
minetest.register_node("farming:oat_4", table.copy(crop_def))

-- stage 5
crop_def.tiles = {"farming_oat_5.png"}
minetest.register_node("farming:oat_5", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_oat_6.png"}
crop_def.drop = {
	items = {
		{items = {'farming:oat'}, rarity = 2},
		{items = {'farming:seed_oat'}, rarity = 2},
	}
}
minetest.register_node("farming:oat_6", table.copy(crop_def))

-- stage 7
crop_def.tiles = {"farming_oat_7.png"}
crop_def.drop = {
	items = {
		{items = {'farming:oat'}, rarity = 2},
		{items = {'farming:seed_oat'}, rarity = 1},
	}
}
minetest.register_node("farming:oat_7", table.copy(crop_def))

-- stage 8 (final)
crop_def.tiles = {"farming_oat_8.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:oat'}, rarity = 1},
		{items = {'farming:oat'}, rarity = 3},
		{items = {'farming:seed_oat'}, rarity = 1},
		{items = {'farming:seed_oat'}, rarity = 3},
	}
}
minetest.register_node("farming:oat_8", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:oat"] = {
	crop = "farming:oat",
	seed = "farming:seed_oat",
	minlight = 13,
	maxlight = 15,
	steps = 8
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:oat",
	burntime = 1,
})



minetest.override_item("farming:oat", {
	groups = {food_oats = 1, flammable = 4}
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:flour",
	recipe = {
		"farming:oat", "farming:oat", "farming:oat", "farming:oat",
		"farming:mortar_pestle"
	},
	replacements = {{"group:food_mortar_pestle", "farming:mortar_pestle"}},
})
