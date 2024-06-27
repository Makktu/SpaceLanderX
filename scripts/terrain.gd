extends AnimatableBody2D

var direction = 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += direction
	if position.x >= 700:
		direction = -2
	if position.x <= -10:
		direction = 2
