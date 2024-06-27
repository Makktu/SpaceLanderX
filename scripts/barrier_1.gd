extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= 2.5

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
