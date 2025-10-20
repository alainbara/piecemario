extends Node

var LEVELS_PATH := "res://scenes/levels/"

var levels_list: Dictionary[String, String]

#TODO :  AFFICHER LES NIVEAUX + GERER LA TRANSI ENTRE LES MENUS!

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	loadLevelsList()
	print(levels_list)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func loadLevelsList():
	var dir = DirAccess.open(LEVELS_PATH)
	var levels_dir_list = dir.get_directories()
	
	var res = []
	
	for folder in levels_dir_list:
		var files_packed_array = dir.open(LEVELS_PATH+folder).get_files()
		var files_array: Array[String]
		files_array.assign(files_packed_array)
		
		var file_scene = files_array.filter(
			func(element): return element.ends_with(".tscn"))
		
		if not file_scene.is_empty():
			levels_list[folder] = file_scene.get(0)
			
	
	

	
