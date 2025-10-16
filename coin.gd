extends StaticBody2D
signal coin_picked_up


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$AnimatedSprite2D.animation = "default"
	$AnimatedSprite2D.play()

func _on_coin_entered(area: Area2D) -> void:
	print(area.name)
	coin_picked_up.emit(self)
	
