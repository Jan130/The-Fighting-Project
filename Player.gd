extends Area2D

export var speed = 200

var screen_size
var previous_velocity

onready var _animation_player = $AnimationPlayer

onready var _collision_idle = $CollisionIdle
onready var _collision_kick = $CollisionKick
onready var _collision_punch_right = $CollisionPunchRight
onready var _collision_punch_left = $CollisionPunchLeft
onready var _collision_hurt = $CollisionHurt
onready var _collision_jump = $CollisionJump
onready var _collision_walk = $CollisionWalk

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	previous_velocity = Vector2.ZERO
	set_animation("idle_right")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func disable_collisions():
	_collision_idle.disabled = true
	_collision_kick.disabled = true
	_collision_punch_right.disabled = true
	_collision_punch_left.disabled = true
	_collision_hurt.disabled = true
	_collision_jump.disabled = true
	_collision_walk.disabled = true

func set_animation(name : String):
	if name == "idle_right":
		disable_collisions()
		_animation_player.play("idle_right")
	elif name == "idle_left":
		disable_collisions()
		_animation_player.play("idle_left")
	elif name == "kick_right":
		disable_collisions()
		_animation_player.play("kick_right")
	elif name == "kick_left":
		disable_collisions()
		_animation_player.play("kick_left")
	elif name == "punch_right":
		disable_collisions()
		_animation_player.play("punch_right")
	elif name == "punch_left":
		disable_collisions()
		_animation_player.play("punch_left")
	elif name == "hurt_right":
		disable_collisions()
		_animation_player.play("hurt_right")
	elif name == "hurt_left":
		disable_collisions()
		_animation_player.play("hurt_left")
	elif name == "jump_right":
		disable_collisions()
		_animation_player.play("jump_right")
	elif name == "jump_left":
		disable_collisions()
		_animation_player.play("jump_left")
	elif name == "walk_right":
		disable_collisions()
		_animation_player.play("walk_right")
	elif name == "walk_left":
		disable_collisions()
		_animation_player.play("walk_left")

func move(velocity : Vector2, delta):
	if velocity != previous_velocity:
		if velocity.x == 0:
			pass
		elif velocity.x > 0:
			set_animation("walk_right")
		else:
			set_animation("walk_left")
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
