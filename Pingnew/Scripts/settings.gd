extends Control

@onready var dink_bus_id = AudioServer.get_bus_index("dink")
@onready var goal_bus_id = AudioServer.get_bus_index("goal")

func _ready():
	var audio_settings = Configfile.load_audio_settings()
	$container/dinkslider.value = min(audio_settings.dink, 1.0)
	$container/goalslider.value = min(audio_settings.goal, 1.0)
	var video_settings = Configfile.load_video_settings()
	$fullscreen.button_pressed = video_settings.fullscreen
	get_tree().get_root().connect("go_back_requested", goback)

func goback():
	get_tree().change_scene_to_file("res://Scenes/start.tscn")

func _on_back_to_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/start.tscn")


func _on_check_sounds_dink_pressed():
	$dink.play()


func _on_check_sounds_loh_pressed():
	$loh.play()

func _on_check_sounds_lucky_pressed():
	$lucky.play()


func _on_dinkslider_value_changed(value):
	AudioServer.set_bus_volume_db(dink_bus_id,linear_to_db(value))
	AudioServer.set_bus_mute(dink_bus_id, value < 0.05)


func _on_goalslider_value_changed(value):
	AudioServer.set_bus_volume_db(goal_bus_id,linear_to_db(value))
	AudioServer.set_bus_mute(goal_bus_id, value < 0.05)


func _on_dinkslider_drag_ended(value_changed):
	if value_changed:
		Configfile.save_audio_settings("dink",$container/dinkslider.value)


func _on_goalslider_drag_ended(value_changed):
	if value_changed:
		Configfile.save_audio_settings("goal",$container/goalslider.value )


func _on_fullscreen_toggled(toggled_on):
	Configfile.save_video_settings("fullscreen", toggled_on)
