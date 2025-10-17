class_name FiniteStateCharacter extends CharacterBody2D



## Horizontal speed in pixels per second.
@export var speed := 150.0
## Vertical acceleration in pixel per second squared.
@export var gravity := 3800.0
## Vertical speed applied when jumping.
@export var jump_impulse := 600.0

@export var glide_max_speed := 1000.0
@export var glide_acceleration := 1000.0
@export var glide_gravity := 400.0
@export var glide_jump_impulse := 800.0

@export var double_jumps := 1

@onready var fsm := $CharacterStateMachine


var animation_player: AnimatedSprite2D
var jump_sound: AudioStreamPlayer2D
var coin_sound: AudioStreamPlayer2D
var double_jump_anim: AnimatedSprite2D

func _ready() -> void:
	animation_player = $AnimatedSprite2D
	double_jump_anim = $DoubleJumpAnimation
	coin_sound = $CoinSound
	jump_sound = $JumpSound
	


func _process(_delta: float) -> void:
	pass
	#label.text = fsm.state.name
	
func _on_coin_picked_up(coin) -> void:
	coin.queue_free()
	coin_sound.play()

func has_double_jumps() -> bool:
	return double_jumps > 0
	
func reset_double_jumps() -> void:
	double_jumps = 1
