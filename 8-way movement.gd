extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += 1
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	
	# check for joypads 
	if Input.get_connected_joypads().size() == 0:
		look_at(get_global_mouse_position())
	else :
		var lookDir = Vector2()
		var sensitivity = 10
		lookDir.x = sensitivity* Input.get_action_strength("look right") - Input.get_action_strength("look left")
		lookDir.y = -sensitivity* Input.get_action_strength("look up") + Input.get_action_strength("look down")
		
		look_at(global_position + lookDir)

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
