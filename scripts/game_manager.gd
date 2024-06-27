extends Node

@onready var music = $AudioStreamPlayer
@onready var timer = $"../Timer"
const BARRIER_1 = preload("res://scenes/barrier_1.tscn")
const BARRIER_2 = preload("res://scenes/barrier_2.tscn")
const PLAYER = preload("res://scenes/player.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#music.play()
	#spawn_next_barrier()

	
func random_float_number(lower_value = 1.0, upper_value = 10.0):
	var random_generator = RandomNumberGenerator.new()
	random_generator.randomize()
	var random_value = random_generator.randf_range(lower_value, upper_value)
	return random_value
	
	
func spawn_next_barrier():
	var random_x = random_float_number(-200, 200)
	print(random_x)
	var start_pos = Vector2(300, 1285)
	var next_barrier = BARRIER_1.instantiate()
	add_child(next_barrier)
	#next_barrier.position = start_pos
	timer.start()


func _on_timer_timeout():
	spawn_next_barrier()
