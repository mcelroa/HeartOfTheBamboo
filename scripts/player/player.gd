extends CharacterBody2D

@export var speed: float = 100.0

@onready var animation_component: AnimationComponent = $AnimationComponent

func get_input() -> Vector2:
	var input_direction: Vector2 = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
	return input_direction

func handle_movement(input_direction: Vector2) -> void:
	velocity = input_direction * speed

func _physics_process(delta):
	var input_direction: Vector2 = get_input()
	animation_component.handle_animation(input_direction)
	handle_movement(input_direction)
	move_and_slide()
