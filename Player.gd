extends Area2D

export var speed = 400
var screen_size

onready var _animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	_animation_player.play("idle_right")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
