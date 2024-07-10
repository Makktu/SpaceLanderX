extends Node

@onready var music = $AudioStreamPlayer
@onready var timer = $"../Timer"
const TERRAIN = preload("res://scenes/terrain.tscn")

var pos_x = 150
var pos_y = 800

func _ready():
	music.play()
	spawn_next_barrier()

	
func random_float_number(lower_value = 1.0, upper_value = 10.0):
	var random_generator = RandomNumberGenerator.new()
	random_generator.randomize()
	var random_value = random_generator.randf_range(lower_value, upper_value)
	return random_value
	
	
func spawn_next_barrier():
	var random_x = random_float_number(-300, 300)
	var next_pos_y = pos_y + 200
	var next_pos_x = pos_x + random_float_number(-150, 150)
	if next_pos_x < -330:
		next_pos_x = -230
	if next_pos_x > 150:
		next_pos_x = 50
	var next_barrier = TERRAIN.instantiate()
	next_barrier.global_position.x = next_pos_x
	next_barrier.global_position.y = next_pos_y
	add_child(next_barrier)
	print(next_pos_x, " - ", next_pos_y)
	pos_x = next_pos_x
	pos_y = next_pos_y
	timer.start()


func _on_timer_timeout():
	# random chance of not spawning a barrier
	if random_float_number(0, 100) > 80:
		pos_y += 200
		timer.start()
	else:
		spawn_next_barrier()
