extends Area2D

func _ready():
	pass

func _on_Sticker_body_entered(body):
	if body.get_name() == "Player":
		queue_free()
		body.hardwarePoints = body.hardwarePoints + 1
		body.totalScore = body.totalScore + 3
		get_tree().get_root().get_node("World").find_node("HardwareVal").text = "x " + str(body.hardwarePoints)
		get_tree().get_root().get_node("World").find_node("ScoreCount").text = str(body.totalScore)