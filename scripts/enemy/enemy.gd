extends CharacterBody2D

@onready var animation_component: AnimationComponent = $AnimationComponent
@onready var enemy_idle: EnemyIdle = $StateMachine/EnemyIdle

func _physics_process(delta):
	move_and_slide()
