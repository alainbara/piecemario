extends FiniteStateCharacterState


# Called when the node enters the scene tree for the first time.
func enter(previous_state_path: String, data := {}) -> void:
	player.velocity.y = -player.jump_impulse



func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("move_left", "move_right")
	player.velocity.x = player.speed * input_direction_x

	player.velocity.y += player.gravity * delta
	player.move_and_slide()

	if player.is_on_floor() and (Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right")):
		finished.emit(RUNNING)
	elif player.is_on_floor() and is_equal_approx(input_direction_x, 0.0):
		finished.emit(IDLE)
	#if Input.is_action_just_pressed("glide"):
		#finished.emit(GLIDING)
	#elif player.velocity.y >= 0:
		#finished.emit(FALLING)
