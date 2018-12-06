extends Area2D

var audioPlayer

func _ready():
	audioPlayer = AudioStreamPlayer.new()
	add_child(audioPlayer)
	audioPlayer.stream = load("res://assets/Hurt_Sound.wav")

signal timer_end

func _wait( seconds ):
   self._create_timer(self, seconds, true, "_emit_timer_end_signal")
   yield(self,"timer_end")

func _emit_timer_end_signal():
   emit_signal("timer_end")

func _create_timer(object_target, float_wait_time, bool_is_oneshot, string_function):
   var timer = Timer.new()
   timer.set_one_shot(bool_is_oneshot)
   timer.set_timer_process_mode(0)
   timer.set_wait_time(float_wait_time)
   timer.connect("timeout", object_target, string_function)
   self.add_child(timer)
   timer.start()


func _on_BugArea_body_entered(body):
	if body.get_name() == "Player":
		audioPlayer.play()
		var completion = get_tree().get_root().get_node("World").find_node("CompletionBar").get_value()
		get_tree().get_root().get_node("World").find_node("CompletionBar").set_value(completion - 5)
		var stamina = get_tree().get_root().get_node("World").find_node("StaminaBar").get_value()
		get_tree().get_root().get_node("World").find_node("StaminaBar").set_value(stamina - 5)
		get_tree().get_root().get_node("World").find_node("BugPanel").show()
		queue_free()
		
		get_tree().get_root().get_node("World").find_node("BugPanel").hide()
		
