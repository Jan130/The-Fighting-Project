extends Area2D

export var speed = 200

var screen_size
var previous_velocity

onready var _animation_player = $AnimationPlayer

onready var _collision_idle_right = $CollisionIdleRight
onready var _collision_idle_left = $CollisionIdleLeft

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	previous_velocity = Vector2.ZERO
	set_animation("idle_right")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func disable_collisions():
	_collision_idle_right.disabled = true
	_collision_idle_left.disabled = true

func set_animation(name : String):
	if name == "idle_right":
		disable_collisions()
		_animation_player.play("idle_right")
	elif name == "idle_left":
		disable_collisions()
		_animation_player.play("idle_left")

func move(velocity : Vector2, delta):
	if velocity != previous_velocity:
		if velocity.x == 0:
			pass
		elif velocity.x > 0:
			set_animation("idle_right")
		else:
			set_animation("idle_left")
		previous_velocity = velocity
	
	position += velocity * delta * speed
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func punch():
	print("punch")

func kick():
	print("kick")

func jump():
	print("jump")
