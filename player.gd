extends CharacterBody2D

@export var speed: int = 250
@export var acceleration: int = 5
@export var jump_speed: int = -speed * 2
@export var gravity: int = speed * 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	handle_input()
	update_movement(delta)
	update_animation()
	move_and_slide()
	

func handle_input() -> void:
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_speed
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction == 0:
		velocity.x = move_toward(velocity.x, 0, acceleration)
	else:
		velocity.x = move_toward(velocity.x, speed * direction, acceleration)
		
func update_movement(delta: float):
	velocity.y += gravity * delta
	
func update_animation():
	if velocity.x == 0:
		$AnimatedSprite2D.animation = "idle"
		$AnimatedSprite2D.play()
		return
		
	$AnimatedSprite2D.animation = "run"
	$AnimatedSprite2D.play()
	
	
