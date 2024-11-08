extends Node

func _ready():
	get_viewport().size = DisplayServer.screen_get_size()
	get_tree().get_root().connect("go_back_requested", goback)
	var goals_settings = Advancements.load_goals_settings()
	$Controladvance/eazy/score.text = str(goals_settings.eazy)
	$Controladvance/normal/score.text = str(goals_settings.normal)
	$Controladvance/hard/score.text = str(goals_settings.hard)
	$Controladvance/eazy_h/score.text = str(goals_settings.eazy_h)
	$Controladvance/normal_h/score.text = str(goals_settings.normal_h)

func goback():
	$Controllevel.hide()
	$Controldiffbot.hide()
	$Controladvance.hide()
	$Controlleave.show()

func _on_plays_pressed():
	$Controllevel.hide()
	$Controldiffbot.show()

func _on_yesleave_pressed():
	get_tree().quit()

func _on_noleave_pressed():
	$Controlleave.hide()
	$Controllevel.show()

func _on_weaky_pressed():
	$Controllevel.hide()
	$Controlleave.show()

func _on_friends_pressed():
	Difficulty.save_difficulty_settings("player_speed", 800)
	Difficulty.save_difficulty_settings("player_size", 4)
	get_tree().change_scene_to_file("res://Scenes/2pmode.tscn")
func _on_settings_pressed():
	get_tree().change_scene_to_file("res://Scenes/settings.tscn")
func _on_colormenu_pressed():
	get_tree().change_scene_to_file("res://Scenes/ColorMenu.tscn")

func _on_back_to_menu_pressed():
	$Controldiffbot.hide()
	$Controladvance.hide()
	$Controllevel.show()


func _on_difficultb_1_pressed():
	Difficulty.save_difficulty_settings("player_speed", 900)
	Difficulty.save_difficulty_settings("bot_speed", 220)
	Difficulty.save_difficulty_settings("player_size", 4)
	Difficulty.save_difficulty_settings("bot_size", 2)
	Difficulty.save_difficulty_settings("bot_name", 'Легкий бот')
	get_tree().change_scene_to_file("res://Scenes/botgame.tscn")

func _on_difficultb_2_pressed():
	Difficulty.save_difficulty_settings("player_speed", 820)
	Difficulty.save_difficulty_settings("bot_speed", 420)
	Difficulty.save_difficulty_settings("player_size", 3)
	Difficulty.save_difficulty_settings("bot_size", 3)
	Difficulty.save_difficulty_settings("bot_name", 'Средний бот')
	get_tree().change_scene_to_file("res://Scenes/botgame.tscn")

func _on_difficultb_3_pressed():
	Difficulty.save_difficulty_settings("player_speed", 800)
	Difficulty.save_difficulty_settings("bot_speed", 600)
	Difficulty.save_difficulty_settings("player_size", 2.5)
	Difficulty.save_difficulty_settings("bot_size", 3)
	Difficulty.save_difficulty_settings("bot_name", 'Тяжелый бот')
	get_tree().change_scene_to_file("res://Scenes/botgame.tscn")

func _on_difficulth_1_pressed():
	Difficulty.save_difficulty_settings("player_speed", 900)
	Difficulty.save_difficulty_settings("bot_speed", 250)
	Difficulty.save_difficulty_settings("player_size", 3)
	Difficulty.save_difficulty_settings("bot_size", 2)
	Difficulty.save_difficulty_settings("bot_name", 'Легкий бот')
	get_tree().change_scene_to_file("res://Scenes/chaosez.tscn")

func _on_difficulth_2_pressed():
	Difficulty.save_difficulty_settings("player_speed", 820)
	Difficulty.save_difficulty_settings("bot_speed", 350)
	Difficulty.save_difficulty_settings("player_size", 3)
	Difficulty.save_difficulty_settings("bot_size", 2.5)
	Difficulty.save_difficulty_settings("bot_name", 'Средний бот')
	get_tree().change_scene_to_file("res://Scenes/chaosnormal.tscn")


func _on_advancements_pressed() -> void:
	$Controllevel.hide()
	$Controladvance.show()
