class_name StateMachine extends Node

## Signal émis après un changement d'état
signal state_changed()

## Etat initial
@export var initial_state: State = null

## Etat actuel
@onready var state: State = (func get_inital_state() -> State:
	return initial_state if initial_state != null else get_child(0)
	).call()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# On se connecte au signal nommé "finished" de chaque état pour changer d'état
	for state_node: State in find_children("*", "State"):
		state_node.finished.connect(_transition_to_next_state)
	
	# On attend bien que le noeud parent soit complétement chargé pour commencer à faire des trucs
	await owner.ready
	state.enter("")
		

func _unhandled_input(event: InputEvent) -> void:
	state.handle_input(event)


func _process(delta: float) -> void:
	state.update(delta)


func _physics_process(delta: float) -> void:
	state.physics_update(delta)


func _transition_to_next_state(target_state_path: String, data: Dictionary = {}) -> void:
	if not has_node(target_state_path):
		printerr(owner.name + ": Trying to transition to state " + target_state_path + " but it does not exist.")
		return

	var previous_state_path := state.name
	state.exit()
	state = get_node(target_state_path)
	state.enter(previous_state_path, data)
	state_changed.emit()
