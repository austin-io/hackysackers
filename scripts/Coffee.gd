extends Area2D

var audioPlayer

func _ready():
	audioPlayer = AudioStreamPlayer.new()
	add_child(audioPlayer)
	audioPlayer.stream = load("res://assets/Happy_Sound.wav")

func _on_Coffee_body_entered(body):
	
	if body.get_name() == "Player":
		audioPlayer.play()
		queue_free()
		body.coffeePoints = body.coffeePoints + 1
		body.totalScore = body.totalScore + 5
		get_tree().get_root().get_node("World").find_node("CoffeeVal").text = "x " + str(body.coffeePoints)
		get_tree().get_root().get_node("World").find_node("ScoreCount").text = str(body.totalScore)
		var stamina = get_tree().get_root().get_node("World").find_node("StaminaBar").value
		get_tree().get_root().get_node("World").find_node("StaminaBar").value = stamina + 10
