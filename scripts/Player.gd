extends KinematicBody2D

var motion = Vector2()
var speed = 400
var dx = 1
var dy = 1

var stickerPoints = 0

func _ready():
	pass

func _process(delta):
	
	if(Input.is_action_pressed("ui_select")):
		dx = 3
		dy = 3
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