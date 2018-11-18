extends KinematicBody2D

var speed = 100
var velocity = Vector2()

func _ready():
	velocity.x = speed
	velocity.y = speed
	move_and_collide(velocity)

func _process(delta):
	pass
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
