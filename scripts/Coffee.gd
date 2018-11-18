extends Area2D

func _ready():
	pass

func _on_Coffee_body_entered(body):
	if body.get_name() == "Player":
		queue_free()
		body.coffeePoints = body.coffeePoints + 1
		body.totalScore = body.totalScore + 5
		body.speed = 400
		get_tree().get_root().get_node("World").find_node("CoffeeVal").text = "x " + str(body.coffeePoints)
		get_tree().get_root().get_node("World").find_node("ScoreCount").text = str(body.totalScore)
