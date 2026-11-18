extends Node2D

@export var speed: float = 300.0


func _process(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	position.x += direction * speed * delta
