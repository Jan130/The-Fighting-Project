extends Node2D

onready var player = $Player

var screen_touched = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			screen_touched = true
		else:
			screen_touched = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_velocity = Vector2.ZERO
	if Input.is_action_pressed("UiRight"):
		player_velocity.x += 1
	if Input.is_action_pressed("UiLeft"):
		player_velocity.x -= 1
	player.move(player_velocity, delta)
