extends CharacterBody2D


@export var SPEED = 300.0


func _physics_process(delta: float) -> void:
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	
	velocity.x = delta * 10 * SPEED
	move_and_slide()
