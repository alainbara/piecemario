class_name State extends Node

signal finished(next_state_path: String, data: Dictionary)

## Appelé par la state machine quand des inputs non gérés sont fait
func handle_input(_event: InputEvent) -> void:
	pass


## Appelé par la state machine dans la boucle de rendu de godot
func update(_delta: float) -> void:
	pass


## Pareil mais physique
func physics_update(_delta: float) -> void:
	pass


## Appelé quand l'état devient actif
## Le dictionnaire peut être utilisé lors de l'initialisation au besoin
func enter(previous_state_path: String, data := {}) -> void:
	pass


## Appelé quand l'état devient inactif. Utiliser cette fonction pour nettoyer l'état
func exit() -> void:
	pass
