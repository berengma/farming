
local S = farming.intllib

-- rye seeds
minetest.register_node("farming:seed_rye", {
	description = S("Rye Seed"),
	tiles = {"farming_rye_seed.png"},
	inventory_image = "farming_rye_seed.png",
	wield_image = "farming_rye_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:rye_1")
	end,
})

-- harvested rye
minetest.register_craftitem("farming:rye", {
	description = S("Rye"),
	inventory_image = "farming_rye.png",
	groups = {food_rye = 1, flammable = 2},
})

-- flour
minetest.register_craft({
	type = "shapeless",
	output = "farming:flour",
	recipe = {
		"farming:rye", "farming:rye", "farming:rye",
		"farming:rye", "farming:mortar_pestle"
	},
	replacements = {{"group:food_mortar_pestle", "farming:mortar_pestle"}},
})

-- rye definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_rye_1.png"},
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
minetest.register_node("farming:rye_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_rye_2.png"}
minetest.register_node("farming:rye_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_rye_3.png"}
minetest.register_node("farming:rye_3", table.copy(crop_def))

-- stage 4
crop_def.tiles = {"farming_rye_4.png"}
minetest.register_node("farming:rye_4", table.copy(crop_def))

-- stage 5
crop_def.tiles = {"farming_rye_5.png"}
minetest.register_node("farming:rye_5", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_rye_6.png"}
crop_def.drop = {
	items = {
		{items = {'farming:rye'}, rarity = 2},
		{items = {'farming:seed_rye'}, rarity = 2},
	}
}
minetest.register_node("farming:rye_6", table.copy(crop_def))

-- stage 7
crop_def.tiles = {"farming_rye_7.png"}
crop_def.drop = {
	items = {
		{items = {'farming:rye'}, rarity = 2},
		{items = {'farming:seed_rye'}, rarity = 1},
	}
}
minetest.register_node("farming:rye_7", table.copy(crop_def))

-- stage 8 (final)
crop_def.tiles = {"farming_rye_8.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:rye'}, rarity = 1},
		{items = {'farming:rye'}, rarity = 3},
		{items = {'farming:seed_rye'}, rarity = 1},
		{items = {'farming:seed_rye'}, rarity = 3},
	}
}
minetest.register_node("farming:rye_8", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:rye"] = {
	crop = "farming:rye",
	seed = "farming:seed_rye",
	minlight = 13,
	maxlight = 15,
	steps = 8
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:rye",
	burntime = 1,
})

minetest.override_item("farming:rye", {
	groups = {food_rye = 1, flammable = 4}
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:flour",
	recipe = {
		"farming:rye", "farming:rye", "farming:rye", "farming:rye",
		"farming:mortar_pestle"
	},
	replacements = {{"group:food_mortar_pestle", "farming:mortar_pestle"}},
})