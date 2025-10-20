extends Node

var LEVEL_SELECTOR_PATH := "res://scenes/menus/level_selector/level_selector.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func quitter() -> void:
	get_tree().quit()
	
func go_to_level_selector() -> void:
	get_tree().change_scene_to_file(LEVEL_SELECTOR_PATH)
