extends Node2D

@onready var background = $background

var ground_layer = 0

@onready var player_tile_pos : Vector2i = background.local_to_map($player.position)

var can_till_custom_data = "can_till"
var can_fertilize_custom_data = "can_fertilize"
var can_seed_corn_custom_data = "can_seed_corn"
var can_seed_carrot_custom_data = "can_seed_carrot"
var can_seed_turnip_custom_data = "can_seed_turnip"
var can_seed_strawberry_custom_data = "can_seed_strawberry"
var can_seed_cabbage_custom_data = "can_seed_cabbage"
var can_water_corn_custom_data = "can_water_corn"
var can_water_carrot_custom_data = "can_water_carrot"
var can_water_turnip_custom_data = "can_water_turnip"
var can_water_strawberry_custom_data = "can_water_strawberry"
var can_water_cabbage_custom_data = "can_water_cabbage"
var can_harvest_corn_custom_data = "can_harvest_corn"
var can_harvest_carrot_custom_data = "can_harvest_carrot"
var can_harvest_turnip_custom_data = "can_harvest_turnip"
var can_harvest_cabbage_custom_data = "can_harvest_cabbage"
var can_harvest_strawberry_custom_data = "can_harvest_strawberry"

var player_1_money = 10000000
var fertilizer = 0
var prestige = 0
var seed_array = [0,0,0,0,0]
var total_time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()

func time():
	if ($Timer.get_time_left() < 10.5):
		$background.set_layer_enabled(1, true)
	else:
		$background.set_layer_enabled(1, false)
		


func subtract(amount):
	if (player_1_money - amount >= 0):
		player_1_money -= amount
		match(amount):
			10:
				fertilizer += 1
			25:
				seed_array[0] += 1
			30:
				seed_array[1] += 1
			40:
				seed_array[2] += 1
			55:
				seed_array[3] += 1
			75:
				seed_array[4] += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_input(delta)
	time()
	var nodes = get_tree().get_nodes_in_group("HUD")
	for node in nodes:
		if node.has_method("get_prestige") && prestige < node.get_prestige():
			prestige = node.get_prestige()

func _input(event):
	total_time += str(event).to_float()
	player_tile_pos = background.local_to_map(background.to_local($player.position))
	
	var tile_data : TileData = background.get_cell_tile_data(ground_layer, player_tile_pos)
	var source_id = 0
	var atlas_coord = Vector2i(0,0)
	
	var enable = get_tree().create_timer(.9)
	
	var loop_number = 1
	

	
	if Input.is_action_just_pressed("till"):
		
		tile_data = background.get_cell_tile_data(ground_layer, player_tile_pos)
		source_id = 0
		atlas_coord = Vector2i(4,7)
		
		if tile_data:
			var can_till = tile_data.get_custom_data(can_till_custom_data)
			if can_till:
				background.set_cell(ground_layer, player_tile_pos, source_id, atlas_coord)
	if Input.is_action_just_pressed("fertilize"):
		if fertilizer > 0:
			tile_data = background.get_cell_tile_data(ground_layer, player_tile_pos)
			source_id = 0
			atlas_coord = Vector2i(6, 9)
			
			if tile_data:
				var can_fertilize = tile_data.get_custom_data(can_fertilize_custom_data)
				if can_fertilize:
					get_tree().call_group("HUD", "subtract_item", 0)
					fertilizer -= 1
					background.set_cell(ground_layer, player_tile_pos, source_id, atlas_coord)
			
	if Input.is_action_just_pressed("plant_corn"):
		if seed_array[0] > 0:
			tile_data = background.get_cell_tile_data(ground_layer, player_tile_pos)
			source_id = 0
			atlas_coord = Vector2i(8, 7)
			
			if tile_data:
				var can_seed_corn = tile_data.get_custom_data(can_seed_corn_custom_data)
				if can_seed_corn:
					get_tree().call_group("HUD", "subtract_item", 1)
					seed_array[0] -= 1
					background.set_cell(ground_layer, player_tile_pos, source_id, atlas_coord)
	if Input.is_action_just_pressed("plant_carrot"):
		if seed_array[1] > 0:
			tile_data = background.get_cell_tile_data(ground_layer, player_tile_pos)
			source_id = 0
			atlas_coord = Vector2i(9, 8)
			
			if tile_data:
				var can_seed_carrot = tile_data.get_custom_data(can_seed_carrot_custom_data)
				if can_seed_carrot:
					get_tree().call_group("HUD", "subtract_item", 2)
					seed_array[1] -= 1
					background.set_cell(ground_layer, player_tile_pos, source_id, atlas_coord)
	if Input.is_action_just_pressed("plant_turnip"):
		if seed_array[2] > 0:
			tile_data = background.get_cell_tile_data(ground_layer, player_tile_pos)
			source_id = 0
			atlas_coord = Vector2i(12, 9)
			
			if tile_data:
				var can_seed_turnip = tile_data.get_custom_data(can_seed_turnip_custom_data)
				if can_seed_turnip:
					get_tree().call_group("HUD", "subtract_item", 3)
					seed_array[2] -= 1
					background.set_cell(ground_layer, player_tile_pos, source_id, atlas_coord)
	if Input.is_action_just_pressed("plant_strawberry"):
		if seed_array[3] > 0:
			tile_data = background.get_cell_tile_data(ground_layer, player_tile_pos)
			source_id = 0
			atlas_coord = Vector2i(6, 11)
			
			if tile_data:
				var can_seed_strawberry = tile_data.get_custom_data(can_seed_strawberry_custom_data)
				if can_seed_strawberry:
					get_tree().call_group("HUD", "subtract_item", 4)
					seed_array[3] -= 1
					background.set_cell(ground_layer, player_tile_pos, source_id, atlas_coord)
	if Input.is_action_just_pressed("plant_cabbage"):
		if seed_array[4] > 0:
			tile_data = background.get_cell_tile_data(ground_layer, player_tile_pos)
			source_id = 0
			atlas_coord = Vector2i(5, 12)
			
			if tile_data:
				var can_seed_cabbage = tile_data.get_custom_data(can_seed_cabbage_custom_data)
				if can_seed_cabbage:
					get_tree().call_group("HUD", "subtract_item", 5)
					seed_array[4] -= 1
					background.set_cell(ground_layer, player_tile_pos, source_id, atlas_coord)
	
	if Input.is_action_just_pressed("water_corn"):
		tile_data = background.get_cell_tile_data(ground_layer, player_tile_pos)
		source_id = 0
		var stage_1 = Vector2i(10, 7)
		var stage_2 = Vector2i(12, 7)
		var stage_3 = Vector2i(7, 8)
		var stage_4 = Vector2i(7,8)
		var stage_5 = Vector2i(6, 7)
		var stages = [stage_1, stage_2, stage_3, stage_4, stage_5]
		var corn_tile_pos = player_tile_pos
		
		
		if tile_data:
			var can_water = tile_data.get_custom_data(can_water_corn_custom_data)
			if can_water:
				var current_time : int = total_time
				can_water = false
				var number = 0
				while can_water == false:
					await get_tree().create_timer(10).timeout
					background.set_cell(ground_layer, corn_tile_pos, source_id, stages[number])
					if number == 4:
						can_water = true
					number += 1
				background.set_cell(ground_layer, corn_tile_pos, source_id, stages[4])
					
	if Input.is_action_just_pressed("water_carrot"):
		tile_data = background.get_cell_tile_data(ground_layer, player_tile_pos)
		source_id = 0
		var stage_1 = Vector2i(11, 8)
		var stage_2 = Vector2i(8, 9)
		var stage_3 = Vector2i(10, 9)
		var stage_4 = Vector2i(10,9)
		var stage_5 = Vector2i(6, 7)
		var stages = [stage_1, stage_2, stage_3, stage_4, stage_5]
		var carrot_tile_pos = player_tile_pos
		
		
		if tile_data:
			var can_water = tile_data.get_custom_data(can_water_carrot_custom_data)
			if can_water:
				var current_time : int = total_time
				can_water = false
				var number = 0
				while can_water == false:
					await get_tree().create_timer(10).timeout
					background.set_cell(ground_layer, carrot_tile_pos, source_id, stages[number])
					if number == 4:
						can_water = true
					number += 1
				background.set_cell(ground_layer, carrot_tile_pos, source_id, stages[4])
	
	if Input.is_action_just_pressed("water_turnip"):
		tile_data = background.get_cell_tile_data(ground_layer, player_tile_pos)
		source_id = 0
		var stage_1 = Vector2i(7, 10)
		var stage_2 = Vector2i(9, 10)
		var stage_3 = Vector2i(11, 10)
		var stage_4 = Vector2i(11,10)
		var stage_5 = Vector2i(6, 7)
		var stages = [stage_1, stage_2, stage_3, stage_4, stage_5]
		var turnip_tile_pos = player_tile_pos
		
		
		if tile_data:
			var can_water = tile_data.get_custom_data(can_water_turnip_custom_data)
			if can_water:
				var current_time : int = total_time
				can_water = false
				var number = 0
				while can_water == false:
					await get_tree().create_timer(10).timeout
					background.set_cell(ground_layer, turnip_tile_pos, source_id, stages[number])
					if number == 4:
						can_water = true
					number += 1
				background.set_cell(ground_layer, turnip_tile_pos, source_id, stages[4])
	
	if Input.is_action_just_pressed("water_strawberry"):
		tile_data = background.get_cell_tile_data(ground_layer, player_tile_pos)
		source_id = 0
		var stage_1 = Vector2i(8, 11)
		var stage_2 = Vector2i(5, 10)
		var stage_3 = Vector2i(4, 9)
		var stage_4 = Vector2i(4, 9)
		var stage_5 = Vector2i(6, 7)
		var stages = [stage_1, stage_2, stage_3, stage_4, stage_5]
		var strawberry_tile_pos = player_tile_pos
		
		
		if tile_data:
			var can_water = tile_data.get_custom_data(can_water_strawberry_custom_data)
			if can_water:
				var current_time : int = total_time
				can_water = false
				var number = 0
				while can_water == false:
					await get_tree().create_timer(10).timeout
					background.set_cell(ground_layer, strawberry_tile_pos, source_id, stages[number])
					if number == 4:
						can_water = true
					number += 1
				background.set_cell(ground_layer, strawberry_tile_pos, source_id, stages[4])

	if Input.is_action_just_pressed("water_cabbage"):
		tile_data = background.get_cell_tile_data(ground_layer, player_tile_pos)
		source_id = 0
		var stage_1 = Vector2i(7, 12)
		var stage_2 = Vector2i(9, 12)
		var stage_3 = Vector2i(4, 11)
		var stage_4 = Vector2i(4,11)
		var stage_5 = Vector2i(6, 7)
		var stages = [stage_1, stage_2, stage_3, stage_4, stage_5]
		var cabbage_tile_pos = player_tile_pos
		
		
		if tile_data:
			var can_water = tile_data.get_custom_data(can_water_cabbage_custom_data)
			if can_water:
				var current_time : int = total_time
				can_water = false
				var number = 0
				while can_water == false:
					await get_tree().create_timer(10).timeout
					background.set_cell(ground_layer, cabbage_tile_pos, source_id, stages[number])
					if number == 4:
						can_water = true
					number += 1
				background.set_cell(ground_layer, cabbage_tile_pos, source_id, stages[4])
	if Input.is_action_just_pressed("harvest_corn"):
		tile_data = background.get_cell_tile_data(ground_layer, player_tile_pos)
		source_id = 0
		var corn_tile_pos = player_tile_pos
		atlas_coord = Vector2i(6, 7)
		
		if tile_data:
			var can_harvest_corn = tile_data.get_custom_data(can_harvest_corn_custom_data)
			if can_harvest_corn:
				get_tree().call_group("HUD", "add_money", 50 * (pow(1.01, prestige)))
				player_1_money += 50 * (pow(1.01, prestige))
				background.set_cell(ground_layer, corn_tile_pos, source_id, atlas_coord)
	
	if Input.is_action_just_pressed("harvest_carrot"):
		tile_data = background.get_cell_tile_data(ground_layer, player_tile_pos)
		source_id = 0
		var carrot_tile_pos = player_tile_pos
		atlas_coord = Vector2i(6, 7)
		
		if tile_data:
			var can_harvest_carrot = tile_data.get_custom_data(can_harvest_carrot_custom_data)
			if can_harvest_carrot:
				get_tree().call_group("HUD", "add_money", 60 * (pow(1.01, prestige)))
				player_1_money += 60 * (pow(1.01, prestige))
				background.set_cell(ground_layer, carrot_tile_pos, source_id, atlas_coord)
	
	if Input.is_action_just_pressed("harvest_turnip"):
		tile_data = background.get_cell_tile_data(ground_layer, player_tile_pos)
		source_id = 0
		var turnip_tile_pos = player_tile_pos
		atlas_coord = Vector2i(6, 7)
		
		if tile_data:
			var can_harvest_turnip = tile_data.get_custom_data(can_harvest_turnip_custom_data)
			if can_harvest_turnip:
				get_tree().call_group("HUD", "add_money", 80 * (pow(1.01, prestige)))
				player_1_money += 80 * (pow(1.01, prestige))
				background.set_cell(ground_layer, turnip_tile_pos, source_id, atlas_coord)
				
	if Input.is_action_just_pressed("harvest_cabbage"):
		tile_data = background.get_cell_tile_data(ground_layer, player_tile_pos)
		source_id = 0
		var cabbage_tile_pos = player_tile_pos
		atlas_coord = Vector2i(6, 7)
		
		if tile_data:
			var can_harvest_cabbage = tile_data.get_custom_data(can_harvest_cabbage_custom_data)
			if can_harvest_cabbage:
				get_tree().call_group("HUD", "add_money", 110 * (pow(1.01, prestige)))
				player_1_money += 110 * (pow(1.01, prestige))
				background.set_cell(ground_layer, cabbage_tile_pos, source_id, atlas_coord)
				
	if Input.is_action_just_pressed("harvest_strawberry"):
		tile_data = background.get_cell_tile_data(ground_layer, player_tile_pos)
		source_id = 0
		var strawberry_tile_pos = player_tile_pos
		atlas_coord = Vector2i(6, 7)
		
		if tile_data:
			var can_harvest_strawberry = tile_data.get_custom_data(can_harvest_strawberry_custom_data)
			if can_harvest_strawberry:
				get_tree().call_group("HUD", "add_money", 150 * (pow(1.01, prestige)))
				player_1_money += 150 * (pow(1.01, prestige))
				background.set_cell(ground_layer, strawberry_tile_pos, source_id, atlas_coord)
