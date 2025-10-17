extends FiniteStateCharacterState

func enter(previous_state_path: String, data := {}) -> void:
	player.reset_double_jumps()
	player.animation_player.play("run")

func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("move_left", "move_right")
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.gravity * delta
	player.move_and_slide()
	player.animation_player.flip_h = player.velocity.x < 0
	#TODO garder l'orientation apres une marche
	if Input.is_action_just_pressed("move_up") and player.is_on_floor():
		finished.emit(JUMPING)
	elif is_equal_approx(input_direction_x, 0.0):
		finished.emit(IDLE)
	elif not player.is_on_floor():
		finished.emit(FALLING)
