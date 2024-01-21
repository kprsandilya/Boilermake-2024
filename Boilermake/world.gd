extends Node2D

@onready var background = $background

var ground_layer = 0

@onready var player_tile_pos : Vector2i = background.local_to_map($player.position)

var can_till_custom_data = "can_till"
var can_fertilize_custom_data = "can_fertilize"
var can_seed_corn_custom_data = "can_seed_corn"
var can_seed_carrot_custom_data = "can_seed_carrot"
var can_seed_turnip_custom_data = "can_seed_turnip"
var can_water_corn_custom_data = "can_water_corn"
var can_water_carrot_custom_data = "can_water_carrot"
var can_water_turnip_custom_data = "can_water_turnip"

var player_1_money = 100
var total_time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print(player_1_money)

func subtract(amount):
	if (player_1_money - amount >= 0):
		player_1_money -= amount

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_input(delta)


func _input(event):
	total_time += str(event).to_float()
	player_tile_pos = background.local_to_map(background.to_local($player.position))
	
	var tile_data : TileData = background.get_cell_tile_data(ground_layer, player_tile_pos)
	var source_id = 0
	var atlas_coord = Vector2i(0,0)
	
	if Input.is_action_just_pressed("till"):
		
		tile_data = background.get_cell_tile_data(ground_layer, player_tile_pos)
		source_id = 0
		atlas_coord = Vector2i(4,7)
		
		if tile_data:
			var can_till = tile_data.get_custom_data(can_till_custom_data)
			if can_till:
				background.set_cell(ground_layer, player_tile_pos, source_id, atlas_coord)
	if Input.is_action_just_pressed("fertilize"):
		tile_data = background.get_cell_tile_data(ground_layer, player_tile_pos)
		source_id = 0
		atlas_coord = Vector2i(6, 9)
		
		if tile_data:
			var can_fertilize = tile_data.get_custom_data(can_fertilize_custom_data)
			if can_fertilize:
				background.set_cell(ground_layer, player_tile_pos, source_id, atlas_coord)
			
	if Input.is_action_just_pressed("plant_corn"):
		tile_data = background.get_cell_tile_data(ground_layer, player_tile_pos)
		source_id = 0
		atlas_coord = Vector2i(8, 7)
		
		if tile_data:
			var can_seed_corn = tile_data.get_custom_data(can_seed_corn_custom_data)
			if can_seed_corn:
				background.set_cell(ground_layer, player_tile_pos, source_id, atlas_coord)
	if Input.is_action_just_pressed("plant_carrot"):
		tile_data = background.get_cell_tile_data(ground_layer, player_tile_pos)
		source_id = 0
		atlas_coord = Vector2i(9, 8)
		
		if tile_data:
			var can_seed_carrot = tile_data.get_custom_data(can_seed_carrot_custom_data)
			if can_seed_carrot:
				background.set_cell(ground_layer, player_tile_pos, source_id, atlas_coord)
	if Input.is_action_just_pressed("plant_turnip"):
		tile_data = background.get_cell_tile_data(ground_layer, player_tile_pos)
		source_id = 0
		atlas_coord = Vector2i(12, 9)
		
		if tile_data:
			var can_seed_turnip = tile_data.get_custom_data(can_seed_turnip_custom_data)
			if can_seed_turnip:
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
					print(corn_tile_pos)
					await get_tree().create_timer(10).timeout
					background.set_cell(ground_layer, corn_tile_pos, source_id, stages[number])
					number += 1
					if number == 3:
						can_water = true
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
					print(carrot_tile_pos)
					await get_tree().create_timer(10).timeout
					background.set_cell(ground_layer, carrot_tile_pos, source_id, stages[number])
					number += 1
					if number == 3:
						can_water = true
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
					print(turnip_tile_pos)
					await get_tree().create_timer(10).timeout
					background.set_cell(ground_layer, turnip_tile_pos, source_id, stages[number])
					number += 1
					if number == 3:
						can_water = true
				background.set_cell(ground_layer, turnip_tile_pos, source_id, stages[4])
