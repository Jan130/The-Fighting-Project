extends Node2D

onready var player = $Player

var screen_size

var screen_touched = false
var lastTouch

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			screen_touched = true
			lastTouch = event.position
		else:
			screen_touched = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_velocity = Vector2.ZERO
	
	if screen_touched:
		if lastTouch.x > screen_size.x / 2:
			player_velocity.x += 1
		else:
			player_velocity.x -= 1
	player.move(player_velocity, delta)
