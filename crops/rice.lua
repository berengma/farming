
local S = farming.intllib

-- rice seeds
minetest.register_node("farming:seed_rice", {
	description = S("Rice Seed"),
	tiles = {"farming_rice_seed.png"},
	inventory_image = "farming_rice_seed.png",
	wield_image = "farming_rice_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:rice_1")
	end,
})

-- harvested rice
minetest.register_craftitem("farming:rice", {
	description = S("Rice"),
	inventory_image = "farming_rice.png",
	groups = {food_rice = 1, flammable = 2},
})

-- flour
minetest.register_craft({
	type = "shapeless",
	output = "farming:flour",
	recipe = {
		"farming:rice", "farming:rice", "farming:rice",
		"farming:rice", "farming:mortar_pestle"
	},
	replacements = {{"group:food_mortar_pestle", "farming:mortar_pestle"}},
})

-- rice definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"farming_rice_1.png"},
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
minetest.register_node("farming:rice_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"farming_rice_2.png"}
minetest.register_node("farming:rice_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"farming_rice_3.png"}
minetest.register_node("farming:rice_3", table.copy(crop_def))

-- stage 4
crop_def.tiles = {"farming_rice_4.png"}
minetest.register_node("farming:rice_4", table.copy(crop_def))

-- stage 5
crop_def.tiles = {"farming_rice_5.png"}
minetest.register_node("farming:rice_5", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"farming_rice_6.png"}
crop_def.drop = {
	items = {
		{items = {'farming:rice'}, rarity = 2},
		{items = {'farming:seed_rice'}, rarity = 2},
	}
}
minetest.register_node("farming:rice_6", table.copy(crop_def))

-- stage 7
crop_def.tiles = {"farming_rice_7.png"}
crop_def.drop = {
	items = {
		{items = {'farming:rice'}, rarity = 2},
		{items = {'farming:seed_rice'}, rarity = 1},
	}
}
minetest.register_node("farming:rice_7", table.copy(crop_def))

-- stage 8 (final)
crop_def.tiles = {"farming_rice_8.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {'farming:rice'}, rarity = 1},
		{items = {'farming:rice'}, rarity = 3},
		{items = {'farming:seed_rice'}, rarity = 1},
		{items = {'farming:seed_rice'}, rarity = 3},
	}
}
minetest.register_node("farming:rice_8", table.copy(crop_def))

-- add to registered_plants
farming.registered_plants["farming:rice"] = {
	crop = "farming:rice",
	seed = "farming:seed_rice",
	minlight = 13,
	maxlight = 15,
	steps = 8
}

-- Fuel

minetest.register_craft({
	type = "fuel",
	recipe = "farming:rice",
	burntime = 1,
})

minetest.override_item("farming:rice", {
	groups = {food_rice = 1, flammable = 4}
})

minetest.register_craftitem("farming:rice_bread", {
	description = "Rice Bread",
	inventory_image = "farming_rice_bread.png",
	on_use = minetest.item_eat(5),
	groups = {food_rice_bread = 1, flammable = 2},
})

minetest.register_craftitem("farming:rice_flour", {
	description = "Rice Flour",
	inventory_image = "farming_rice_flour.png",
	groups = {food_rice_flour = 1, flammable = 1},
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:rice_flour",
	recipe = {
		"farming:rice", "farming:rice", "farming:rice", "farming:rice",
		"farming:mortar_pestle"
	},
	replacements = {{"group:food_mortar_pestle", "farming:mortar_pestle"}},
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "farming:rice_bread",
	recipe = "farming:rice_flour"
})

-- Fuels

minetest.register_craft({
	type = "fuel",
	recipe = "farming:rice_bread",
	burntime = 1,
})