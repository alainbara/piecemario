extends Node

const save_file_name: String = "user://save.json"
const default_dictionnary: Dictionary  = {"level_one" : true}

func save_game(data: Dictionary) -> void:
	var save_file: FileAccess = FileAccess.open(save_file_name, FileAccess.WRITE)
	if save_file == null:
		push_error("Erreur ouverture fichier")
		return
	var string_data: String = JSON.stringify(data)
	save_file.store_line(string_data)
	save_file.close()
	
func load_game() -> Dictionary:
	if FileAccess.file_exists(save_file_name):
		var save_file: FileAccess = FileAccess.open(save_file_name, FileAccess.READ)
		if save_file == null:
			push_error("Erreur ouverture fichier")
			return default_dictionnary
			
		var json = JSON.new()
		
		var string_data: String = save_file.get_line()
		if json.parse(string_data) == OK:
			json.parse(string_data)
			var data: Dictionary = json.get_data()
			save_file.close()
			
			return data
	push_error("Erreur ouverture fichier")
	return default_dictionnary
	
func reset_save() -> void:
	save_game(default_dictionnary)
