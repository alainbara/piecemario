extends FiniteStateCharacterState


# Called when the node enters the scene tree for the first time.
func enter(previous_state_path: String, data := {}) -> void:
	player.animation_player.play("jump")
	player.jump_sound.play()
	player.velocity.y = -player.jump_impulse
	if player.double_jumps == 0:
		player.double_jump_anim.play("default")



func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("move_left", "move_right")
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.gravity * delta
	player.move_and_slide()


	if player.has_double_jumps() and Input.is_action_just_pressed("move_up"):
		player.double_jumps -= 1
		finished.emit(JUMPING)
	elif player.is_on_floor() and (Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right")):
		finished.emit(RUNNING)
	elif player.is_on_floor() and is_equal_approx(input_direction_x, 0.0):
		finished.emit(IDLE)
	elif Input.is_action_pressed("move_up"):
		finished.emit(GLIDING)
	elif player.velocity.y >= 0:
		finished.emit(FALLING)
