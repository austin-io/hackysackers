extends Area2D

func _ready():
	pass

func _on_Sticker_body_entered(body):
	if body.get_name() == "Player":
		queue_free()
		body.stickerPoints = body.stickerPoints + 1
		body.totalScore = body.totalScore + 2
		get_tree().get_root().get_node("World").find_node("StickersVal").text = "x " + str(body.stickerPoints)
		get_tree().get_root().get_node("World").find_node("ScoreCount").text = str(body.totalScore)