class_name AnimationComponent
extends Node

@export var sprite: AnimatedSprite2D

var last_facing: String = "right"

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
