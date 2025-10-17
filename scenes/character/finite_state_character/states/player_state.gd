class_name FiniteStateCharacterState extends State

const IDLE = "IDLE"
const RUNNING = "RUNNING"
const JUMPING = "JUMPING"
const FALLING = "FALLING"
const GLIDING = "GLIDING"

var player: FiniteStateCharacter


func _ready() -> void:
	await owner.ready
	player = owner as FiniteStateCharacter
	assert(player != null, "The PlayerState state type must be used only in the player scene. It needs the owner to be a Player node.")
