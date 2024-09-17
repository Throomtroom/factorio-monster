extends StaticBody2D

var mouseover = 0

func _on_mouse_entered() -> void:
	mouseover = 1


func _on_mouse_exited() -> void:
	mouseover = 0
	
func _process (_delta) ->void :
	if Input.is_action_just_pressed("casser") == true and mouseover == 1:
		queue_free()
