extends CanvasLayer

var day = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()

func update_score(score):
	$Time.text = str(score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_score("Day: " + str(day) + " Time: " + str($Timer.get_time_left()))
	#update_score($Timer.)


func _on_timer_timeout():
	day += 1
