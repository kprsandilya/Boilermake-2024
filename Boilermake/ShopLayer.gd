extends CanvasLayer

var player_1_money = 10000000;

var fertilizer = 0
var prestige = 0
var seed_array = [0,0,0,0,0]

var name_array = ["10",
				 	"25",
					"30",
					"40",
					"55",
					"75",
					"200",
					"350",
					"450",
					"600",
					"900",
					"1500",
					"2000",
					"2750",
					"4000",
					"5500",
					"7500",
					"100000"]

var item_array = ["Fertilizer",
				 	"Corn Seeds",
					"Carrot Seeds",
					"Turnip Seeds",
					"Cabbage Seeds",
					"Strawberry Seeds",
					"Level 1 Prestige",
					"Level 2 Prestige",
					"Level 3 Prestige",
					"Level 4 Prestige",
					"Level 5 Prestige",
					"Level 6 Prestige",
					"Level 7 Prestige",
					"Level 8 Prestige",
					"Level 9 Prestige",
					"Level 10 Prestige",
					"Level 11 Prestige",
					"Level 12 Prestige"]

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(1,7):
		get_node("./" + "Col1-" + str(i)).text = "Purchase $: " + name_array[i-1]
		get_node("./" + "Col2-" + str(i)).text = "Purchase $: " + name_array[i+5]
		get_node("./" + "Col3-" + str(i)).text = "Purchase $: " + name_array[i+11]
	for i in range(1,19):
		get_node("./" + "Item" + str(i)).text = item_array[i-1]
	self.hide()	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("../" + "Money").text = str("Money: " + str(player_1_money) + "\n"
											+ "Prestige: " + str(prestige))
	get_node("../" + "Tools").text = str("Keybinds/Amounts\n"
											+ "F - Fertilizer: " + str(fertilizer) + "\n"
											+ "1 - Corn: " + str(seed_array[0]) + "\n"
											+ "2 - Carrot: " + str(seed_array[1]) + "\n")
	get_node("../" + "Tools2").text = str("\n3 - Turnip: " + str(seed_array[2]) + "\n"
											+ "4 - Cabbage: " + str(seed_array[3]) + "\n"
											+ "5 - Strawberry: " + str(seed_array[4]) + "\n")
func subtract(amount):
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
	if (player_1_money - amount >= 0):
		player_1_money -= amount

func subtract_item(index):
	if (index == 0):
		fertilizer -= 1
	match (index):
		1:
			seed_array[0] -= 1
		2:
			seed_array[1] -= 1
		3:
			seed_array[2] -= 1
		4:
			seed_array[3] -= 1
		5:
			seed_array[4] -= 1

func _on_shop_pressed():
	self.show()
	get_node("../Timer").set_paused(true)


func _on_hide_pressed():
	self.hide()
	get_node("../Timer").set_paused(false)


func _on_col_11_pressed():
	get_tree().call_group("world", "subtract", name_array[0].to_int())
	subtract(name_array[0].to_int())

func _on_col_12_pressed():
	get_tree().call_group("world", "subtract", name_array[1].to_int())
	subtract(name_array[1].to_int())

func _on_col_13_pressed():
	get_tree().call_group("world", "subtract", name_array[2].to_int())
	subtract(name_array[2].to_int())


func _on_col_14_pressed():
	get_tree().call_group("world", "subtract", name_array[3].to_int())
	subtract(name_array[3].to_int())


func _on_col_15_pressed():
	get_tree().call_group("world", "subtract", name_array[4].to_int())
	subtract(name_array[4].to_int())


func _on_col_16_pressed():
	get_tree().call_group("world", "subtract", name_array[5].to_int())
	subtract(name_array[5].to_int())


func _on_col_21_pressed():
	get_tree().call_group("world", "subtract", name_array[6].to_int())
	subtract(name_array[6].to_int())
	$"Col2-1".hide()
	prestige = 1


func _on_col_22_pressed():
	get_tree().call_group("world", "subtract", name_array[7].to_int())
	subtract(name_array[7].to_int())
	$"Col2-2".hide()
	prestige = 2


func _on_col_23_pressed():
	get_tree().call_group("world", "subtract", name_array[8].to_int())
	subtract(name_array[8].to_int())
	$"Col2-3".hide()
	prestige = 3


func _on_col_24_pressed():
	get_tree().call_group("world", "subtract", name_array[9].to_int())
	subtract(name_array[9].to_int())
	$"Col2-4".hide()
	prestige = 4


func _on_col_25_pressed():
	get_tree().call_group("world", "subtract", name_array[10].to_int())
	subtract(name_array[10].to_int())
	$"Col2-5".hide()
	prestige = 5


func _on_col_26_pressed():
	get_tree().call_group("world", "subtract", name_array[11].to_int())
	subtract(name_array[11].to_int())
	$"Col2-6".hide()
	prestige = 6


func _on_col_31_pressed():
	get_tree().call_group("world", "subtract", name_array[12].to_int())
	subtract(name_array[12].to_int())
	$"Col3-1".hide()
	prestige = 7


func _on_col_32_pressed():
	get_tree().call_group("world", "subtract", name_array[13].to_int())
	subtract(name_array[13].to_int())
	$"Col3-2".hide()
	prestige = 8


func _on_col_33_pressed():
	get_tree().call_group("world", "subtract", name_array[14].to_int())
	subtract(name_array[14].to_int())
	$"Col3-3".hide()
	prestige = 9


func _on_col_34_pressed():
	get_tree().call_group("world", "subtract", name_array[15].to_int())
	subtract(name_array[15].to_int())
	$"Col3-4".hide()
	prestige = 10


func _on_col_35_pressed():
	get_tree().call_group("world", "subtract", name_array[16].to_int())
	subtract(name_array[16].to_int())
	$"Col3-5".hide()
	prestige = 11


func _on_col_36_pressed():
	get_tree().call_group("world", "subtract", name_array[17].to_int())
	subtract(name_array[17].to_int())
	$"Col3-6".hide()
	prestige = 12
