extends Node

var LEVELS_PATH := "res://scenes/levels/"

var levels_list: Dictionary[String, String]

var level_container: GridContainer

var dict : Dictionary

#TODO :  AFFICHER LES NIVEAUX + GERER LA TRANSI ENTRE LES MENUS!

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_container = $Node2/LevelContainer
	dict = SaveManager.load_game()
	loadLevelsList()
	displayLevelsList()


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
			
			
func displayLevelsList() -> void:
	for level in levels_list:
		var level_folder = level
		var level_file = levels_list[level]
		print(level_folder, level_file)
		var button := Button.new()
		button.text = level_folder
		button.pressed.connect(go_to_level.bind(level_folder, level_file))
		if dict[level_folder]:
			button.add_theme_color_override("Normal", Color(255, 0, 0))
			
		level_container.add_child(button)
	
func go_to_level(level_folder: String, level_file: String):
	get_tree().change_scene_to_file(LEVELS_PATH+level_folder+"/"+level_file)
	

	
