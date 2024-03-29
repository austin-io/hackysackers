extends KinematicBody2D

onready var ANI = get_node("./AnimatedSprite")

var motion = Vector2()
var speed = 400
var dx = 1
var dy = 1

func _ready():
	pass

func _process(delta):
	
	var animation = "idle"
	
	if(Input.is_action_pressed("ui_select")):
		dx = 2
		dy = 2
	else:
		dx = 1
		dy = 1
	
	if(Input.is_action_pressed("ui_right")):
		motion.x = speed * dx
		ANI.flip_h = false
		animation = "walking"
		
	elif(Input.is_action_pressed("ui_left")):
		motion.x = -speed * dx
		ANI.flip_h = true
		animation = "walking"
		
	else:
		motion.x = 0 * dx
		
	if(Input.is_action_pressed("ui_up")):
		motion.y = -speed * dy
		animation = "walking"
		
	elif(Input.is_action_pressed("ui_down")):
		motion.y = speed * dy
		animation = "walking"
		
	else:
		motion.y = 0 * dy
	
	ANI.play(animation)
	
	move_and_slide(motion)