extends FiniteStateCharacterState


func enter(previous_state_path: String, data := {}) -> void:
	player.reset_double_jumps()
	player.velocity.x = 0.0
	player.animation_player.play("idle")

func physics_update(_delta: float) -> void:
	player.velocity.y += player.gravity * _delta
	player.move_and_slide()

	if Input.is_action_just_pressed("move_up") and player.is_on_floor():
		finished.emit(JUMPING)
	elif Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		finished.emit(RUNNING)
	elif not player.is_on_floor():
		finished.emit(FALLING)
