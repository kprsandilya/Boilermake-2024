extends CharacterBody2D

var speed = 50
var motion = Vector2.ZERO

# test comment
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.play("sidewalk")
		$AnimatedSprite2D.flip_h = true
		motion.x = speed
		motion.y = 0
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.play("sidewalk")
		$AnimatedSprite2D.flip_h = false
		motion.x = -speed
		motion.y = 0
	elif Input.is_action_pressed("ui_down"):
		$AnimatedSprite2D.play("downwalk")
		motion.y = speed
		motion.x = 0
	elif Input.is_action_pressed("ui_up"): 
		$AnimatedSprite2D.play("upwalk")
		motion.y = -speed
		motion.x = 0
	else:
		$AnimatedSprite2D.play("idle")
		motion.x = 0
		motion.y = 0
	velocity = motion
	move_and_slide()


