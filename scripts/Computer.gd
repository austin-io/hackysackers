extends Area2D

var timer

func _ready():
	pass

func _on_Computer_body_entered(body):
	if body.get_name() == "Player":
		
		timer = Timer.new()
		timer.connect("timeout", self, "tick")
		add_child(timer)
		timer.wait_time = 1
		timer.start()


func tick():
	
	var stamina = get_tree().get_root().get_node("World").find_node("StaminaBar").value
	
	if stamina >= 15:
		stamina = get_tree().get_root().get_node("World").find_node("StaminaBar").value
		get_tree().get_root().get_node("World").find_node("StaminaBar").value = stamina - 7
	
		var completion = get_tree().get_root().get_node("World").find_node("CompletionBar").value
		get_tree().get_root().get_node("World").find_node("CompletionBar").value = completion + 2
	

func _on_Computer_body_exited(body):
	if body.get_name() == "Player":
		timer.stop()
