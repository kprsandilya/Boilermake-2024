extends CanvasLayer

var name_array = ["1",
				 	"2",
					"3",
					"4",
					"5",
					"6",
					"7",
					"8",
					"9",
					"10",
					"11",
					"12",
					"13",
					"14",
					"15",
					"16",
					"17",
					"18"]

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()
	for i in range(1,7):
		get_node("./" + "Col1-" + str(i)).text = name_array[i-1]
		get_node("./" + "Col2-" + str(i)).text = name_array[i+5]
		get_node("./" + "Col3-" + str(i)).text = name_array[i+11]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_shop_pressed():
	self.show()


func _on_hide_pressed():
	self.hide()
