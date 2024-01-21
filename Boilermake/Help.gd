extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_hide_pressed():
	self.hide()
	get_node("../Timer").set_paused(false)

func _on_help_button_pressed():
	self.show()
	get_node("../Timer").set_paused(true)
