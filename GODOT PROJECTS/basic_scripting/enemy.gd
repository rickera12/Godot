extends Node

var health: int
var start_position : Vector2

func _ready() -> void:
	health = getHealth()
	start_position = getStartPositon()

func _physics_process(delta: float) -> void:
	if health > 0:
		health -= 1
		
func getHealth() -> int:
	return 200
	
func getStartPositon() -> Vector2:
	return Vector2(1, 2)
