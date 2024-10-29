extends ColorRect

var score := [0,0]
func _ready():
	get_viewport().size = DisplayServer.screen_get_size()
	get_tree().get_root().connect("go_back_requested", goback)
	var color_settings = Configcolor.load_color_settings()
	$player1/ColorRect.color = color_settings.color1
	$cpu/ColorRect.color = color_settings.color3
	$ball/balltexture.modulate = color_settings.color4
	
func goback():
	if get_tree().paused:
		get_tree().paused = false
		get_tree().change_scene_to_file("res://Scenes/start.tscn")
	else:
		$pausemenu.show()
		get_tree().paused = true

func _on_balltimer_timeout():
	$startanim.play("timer_anim")
	await $startanim.animation_finished
	$ball.new_ball()

func _on_score_down_body_entered(_body):
	$audio/loh.play()
	score[1] += 1
	$score/player2score.text = str(score[1])
	$balltimer.start()

func _on_score_up_body_entered(_body):
	$audio/lucky.play()
	score[0] += 1
	$score/playerscore.text = str(score[0])
	$balltimer.start()

func _process(_delta):
	if score[0] == 3:
		get_tree().change_scene_to_file("res://Scenes/start.tscn")
	elif score[1] == 3:
		get_tree().change_scene_to_file("res://Scenes/start.tscn")