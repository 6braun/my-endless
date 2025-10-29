extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 300.0

func _ready():
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	animated_sprite_2d.flip_h = true

func _physics_process(delta: float) -> void:
	velocity.x = delta * 10 * SPEED * -1
	move_and_slide()
