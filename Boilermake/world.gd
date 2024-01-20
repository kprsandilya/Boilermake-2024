extends Node2D

@onready var background = $background

var ground_layer = 0

@onready var player_tile_pos : Vector2i = background.local_to_map($player.position)

var can_till_custom_data = "can_till"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_input(delta)


func _input(event):
	player_tile_pos = background.local_to_map(background.to_local($player.position))
		
	if Input.is_action_just_pressed("till"):
		var tile_data : TileData = background.get_cell_tile_data(ground_layer, player_tile_pos)
		
		var source_id = 0
		var atlas_coord = Vector2i(4,7)
		
		if tile_data:
			var can_till = tile_data.get_custom_data(can_till_custom_data)
			if can_till:
				background.set_cell(ground_layer, player_tile_pos, source_id, atlas_coord)