extends CharacterBody2D

@export var speed: float = 100.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var last_facing: String = "right"

func get_input() -> Vector2:
	var input_direction: Vector2 = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
	return input_direction

func handle_movement(input_direction: Vector2) -> void:
	velocity = input_direction * speed

func handle_animation(input_direction: Vector2) -> void:
	if input_direction.x != 0:
		if input_direction.x > 0:
			last_facing = "right"
			sprite.flip_h = false
			sprite.play("walk_side")
		else:
			last_facing = "left"
			sprite.flip_h = true
			sprite.play("walk_side")
	elif input_direction.y != 0:
		if input_direction.y > 0:
			last_facing = "down"
			sprite.play("walk_down")
		else:
			last_facing = "up"
			sprite.play("walk_up")
	
	if input_direction == Vector2.ZERO:
		match last_facing:
			"up":
				sprite.play("idle_up")
			"down":
				sprite.play("idle_down")
			"left":
				sprite.flip_h = true
				sprite.play("idle_side")
			"right":
				sprite.flip_h = false
				sprite.play("idle_side")

func _physics_process(delta):
	var input_direction: Vector2 = get_input()
	handle_animation(input_direction)
	handle_movement(input_direction)
	move_and_slide()
