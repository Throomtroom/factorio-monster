extends CharacterBody2D


const SPEED = 300.0


func _physics_process(_delta):
	var direction = Vector2(
		int(Input.is_action_pressed("right")) -int(Input.is_action_pressed("left")),
		int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up")) 
	)
	direction.normalized()
	velocity = direction * SPEED
	move_and_slide()
