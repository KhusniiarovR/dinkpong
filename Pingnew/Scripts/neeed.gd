extends ColorRect


var score := [0,0]
const paddle_speed: int = 600
const paddle_enemy_speed : int = 750

func _ready():
	get_viewport().size = DisplayServer.screen_get_size()
	var color_settings = Configcolor.load_color_settings()
	$player1/ColorRect.color = color_settings.color1
	#$player2/ColorRect.color = color_settings.color2
	$cpuez/ColorRect.color = color_settings.color3
	#$cpu/ColorRect.color = color_settings.color3


func _on_balltimer_timeout():
	$ball.new_ball()

func _on_scoreleft_1_body_entered(_body):
	$lucky.play()
	score[0] += 1
	$score/player2score.text = str(score[0])
	$balltimer.start()

func _on_scoreleft_body_entered(_body):
	$loh.play()
	score[0] += 1
	$score/player2score.text = str(score[0])
	$balltimer.start()


func _on_scoreright_body_entered(_body):
	$loh.play()
	score[1] += 1
	$score/playerscore.text = str(score[1])
	$balltimer.start()
