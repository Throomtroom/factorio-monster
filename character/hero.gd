extends CharacterBody2D


const SPEED = 300.0


func _physics_process(delta):
	var direction = Vector2(
		int(Input.is_action_pressed("right")) -int(Input.is_action_pressed("left")),
		int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up")) 
	)
	velocity = direction * SPEED
	velocity.normalized()
	move_and_slide()
