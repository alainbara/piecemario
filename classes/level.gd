class_name Level extends Node

@onready var coins_list: Array[Coin]
var player: FiniteStateCharacter

# Called when the node enters the scene tree for the first time.
func _ready() -> void: 
	get_coins()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var clean_list = clean(coins_list)
	var coins_list = clean_list
	if (coins_list.is_empty()):
		pass
	
	
func get_coins() -> void:
	for coin: Coin in find_children("*", "Coin"):
		coins_list.append(coin)
	print(coins_list)
	
func clean(dirty_array: Array) -> Array:
	var clean_array := []
	for item in dirty_array:
		if is_instance_valid(item):
			clean_array.append(item)
	return clean_array
	 
