extends KinematicBody2D

var motion = Vector2()
var speed = 300
var dx = 1
var dy = 1

func _ready():
	pass

func _process(delta):
	
	if(Input.is_action_pressed("ui_select")):
		dx = 4
		dy = 4
	else:
		dx = 1
		dy = 1
	
	if(Input.is_action_pressed("ui_right")):
		motion.x = speed * dx
	elif(Input.is_action_pressed("ui_left")):
		motion.x = -speed * dx
	else:
		motion.x = 0 * dx
		
	if(Input.is_action_pressed("ui_up")):
		motion.y = -speed * dy
	elif(Input.is_action_pressed("ui_down")):
		motion.y = speed * dy
	else:
		motion.y = 0 * dy
		
	move_and_slide(motion)