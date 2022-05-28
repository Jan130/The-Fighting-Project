extends Area2D

export var speed = 400
var screen_size

onready var _animation_player = $AnimationPlayer

onready var _collision_idle_right = $CollisionIdleRight
onready var _collision_idle_left = $CollisionIdleLeft

# Called when the node enters the scene tree for the first time.
func _ready():
	set_animation("idle_left")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func disable_collisions():
	_collision_idle_right.disabled = true
	_collision_idle_left.disabled = true

func set_animation(name):
	if name == "idle_right":
		disable_collisions()
		_animation_player.play("idle_right")
	elif name == "idle_left":
		disable_collisions()
		_animation_player.play("idle_left")
