extends Area2D

func _ready():
	pass

func _on_Sticker_body_entered(body):
	if body.get_name() == "Player":
		queue_free()
		body.stickerPoints = body.stickerPoints + 1
		#get_tree().get_root().get_node("World").find_node("PointsValue").text = str(body.stickerPoints)