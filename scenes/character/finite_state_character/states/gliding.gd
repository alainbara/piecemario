extends FiniteStateCharacterState



func physics_update(_delta: float) -> void:
	var input_dir = Input.get_axis("move_left", "move_right")
	player.velocity.x = player.speed * input_dir
	player.velocity.y += player.gravity/50 * _delta
	player.move_and_slide()
	
	if Input.is_action_just_released("move_up"): 
		finished.emit(FALLING)
	elif player.has_double_jumps() and Input.is_action_just_pressed("move_up"):
		player.double_jumps -= 1
		finished.emit(JUMPING)
	elif player.is_on_floor():
		finished.emit(IDLE)
