extends Node2D
class_name Spawner
@onready var timer: Timer = $Timer
@onready var marker_2d: Marker2D = $Marker2D

@export var mob_scene: PackedScene
@export var spawn_interval: float = 1.5       # seconds between ticks
@export var burst_size: int = 1               # how many per tick
@export var max_concurrent: int = 20

var alive = 0
func _ready() -> void:
	timer.timeout.connect(_on_timeout)



func start():
	timer.wait_time = max(0.05, spawn_interval)
	timer.start()

func stop():
	timer.stop()

#func spawn_now(count:int = 1) -> void:
	#for i in count:
		#if _alive >= max_concurrent: return
		#_spawn_one()

func _on_timeout() -> void:
	for i in burst_size:
		_spawn_one()

func _spawn_one():
	if alive < max_concurrent:
		var parent = get_parent()
		self.add_child(mob_scene.instantiate())
		#mob_scene.position = marker_2d.position
		alive +=1
