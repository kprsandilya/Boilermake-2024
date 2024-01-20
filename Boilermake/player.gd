extends CharacterBody2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var motion = Vector2.ZERO
var screen_size # Size of the game window.
var scaler = 6
var xscaler = scaler * 5
var yscaler = scaler * 7

func _ready():
	screen_size = get_viewport_rect().size

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
	if Input.is_action_pressed("ui_down"):
		$AnimatedSprite2D.play("downwalk")
		motion.y = speed
		if Input.is_action_just_released("ui_right") || Input.is_action_just_released("ui_left"):
			motion.x = 0
	elif Input.is_action_pressed("ui_up"): 
		$AnimatedSprite2D.play("upwalk")
		motion.y = -speed
		if Input.is_action_just_released("ui_right") || Input.is_action_just_released("ui_left"):
			motion.x = 0
		
	if (!Input.is_action_pressed("ui_right") && !Input.is_action_pressed("ui_left") 
		&& !Input.is_action_pressed("ui_down") && !Input.is_action_pressed("ui_up")):
		$AnimatedSprite2D.play("idle")
		motion.x = 0
		motion.y = 0
	velocity = motion
	position += velocity * delta
	position = position.clamp(Vector2(xscaler,yscaler), Vector2(screen_size.x - xscaler, screen_size.y - yscaler))
