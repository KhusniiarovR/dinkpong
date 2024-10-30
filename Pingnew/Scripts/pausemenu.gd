extends Control


func resume():
	get_tree().paused = false

func pause():
	get_tree().paused = true

func _on_continue_pressed():
	resume()
	$".".hide()


func _on_leave_pressed():
	resume()
	get_tree().change_scene_to_file("res://Scenes/start.tscn")

func _process(_delta):
	if Input.is_action_pressed("stop"):
		pause()
		$".".show()
