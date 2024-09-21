extends Area2D

var gen = 1024/128

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CollisionShape2D.set_debug_color(randi())




func _on_area_entered(area: Area2D) -> void:
	if area.name == "chunk_loader":
		get_parent()._gen(gen,position)
