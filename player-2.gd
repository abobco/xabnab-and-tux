extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()
var player = 'p2 '
# 

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed(player + 'right'):
		velocity.x += 1
	if Input.is_action_pressed(player + 'left'):
		velocity.x -= 1
	if Input.is_action_pressed(player + 'down'):
		velocity.y += 1
	if Input.is_action_pressed(player + 'up'):
		velocity.y -= 1
	if  velocity.length_squared() > 0:
		$AnimatedSprite.play("default")
#	else:
#		$AnimatedSprite.play("stumble")
		# $AnimatedSprite.frame = 0
	velocity = velocity.normalized() * speed
	
	# check for joypads 
#	if Input.get_connected_joypads().size() == 0:
#		look_at(get_global_mouse_position())
#	else :
	var lookDir = Vector2()
	var sensitivity = 10
	lookDir.x = sensitivity* Input.get_action_strength("look right") - Input.get_action_strength("look left")
	lookDir.y = -sensitivity* Input.get_action_strength("look up") + Input.get_action_strength("look down")
		
		# look_at(global_position + lookDir)
	look_at(global_position + velocity)

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
