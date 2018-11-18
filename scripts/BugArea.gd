extends Area2D

func _ready():
	pass

func _on_PersonArea_body_entered(body):
	if body.get_name() == "Player":
		get_node("Message1").popup()
		get_node("Message1/Timer").start()


func _on_PersonArea_body_exited(body):
	if body.get_name() == "Player":
		get_node("Message1").hide()
