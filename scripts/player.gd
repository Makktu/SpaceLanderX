extends CharacterBody2D

var top_speed = 200
var acceleration = 0.1
var input_vector : Vector2
var gravity = 10
var current_velocity

func get_input(delta):
	var input_vector = Vector2.ZERO
	if Input.is_action_pressed("thrust"):
		if is_on_floor():
			velocity.y -= 50
			velocity.x = 0
		input_vector.y += 1 
	if Input.is_action_pressed("thrust_left"):
		input_vector.x += 1
	if Input.is_action_pressed("thrust_right"):
		input_vector.x -= 1
	if input_vector.length() > 0:
		input_vector = input_vector.normalized()
	velocity += Vector2(input_vector.x * acceleration * top_speed * delta, -input_vector.y * acceleration * top_speed * delta)
	if velocity.length() > top_speed:
		if !(velocity.y > top_speed):
			velocity = velocity.normalized() * top_speed
		else:
			get_tree().reload_current_scene()
	if not is_on_floor():
		velocity.y += gravity * delta
	current_velocity = velocity.length()
	print(current_velocity)

func _physics_process(delta):
	get_input(delta)
	move_and_slide()
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		if collider is AnimatableBody2D:
			if current_velocity > 20:
				print("CRASHED!")
			else:
				print("LANDED SAFELY!")
	if is_on_floor():
		velocity = Vector2.ZERO

#########################################################################
#########################################################################
#########################################################################

#@onready var alert = $AudioStreamPlayer
#
#var acceleration = 100 #30
#var max_speed = 200
#var gravity = 12 #0 FOR FULL WEIGHTLESSNESS
#var rotation_speed = 5 #6
#var input_vector : Vector2
#var rotation_direction: int
#
	#
#func _physics_process(delta):
	#if Input.is_action_pressed("thrust_left") and rotation_direction != -1:
		#rotation_direction -= 1
	#if Input.is_action_pressed("thrust_right") and rotation_direction != 1:
		#rotation_direction += 1
	#if Input.is_action_just_released("thrust_left") or Input.is_action_just_released("thrust_right"):
		#rotation_direction = 0
		#
	#velocity += Vector2(input_vector.x * acceleration * delta, 0).rotated(rotation)
	#velocity.x = clamp(velocity.x, -max_speed, max_speed)
	#velocity.y = clamp(velocity.y, -max_speed, max_speed)
	#
	#rotation += rotation_direction * rotation_speed * delta	
	#
	#input_vector.x = Input.get_action_strength("thrust")
	#input_vector.y = Input.get_action_strength("thrust_left")
	#
		## Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta 
	#
	#move_and_slide()
