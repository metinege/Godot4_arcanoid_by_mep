extends StaticBody2D

var direction

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		position.x -= 10
		direction = -1
	elif Input.is_action_pressed("ui_right"):
		position.x += 10
		direction = 1
	else:
		direction = 0
	
	position.x = clamp(position.x,-500,500)
