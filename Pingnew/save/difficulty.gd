extends Node

var config = ConfigFile.new()
const settings_file_path = "user://difficulty"

func _ready():
	if !FileAccess.file_exists(settings_file_path):
		config.set_value("difficulty", "player_speed", 700)
		config.set_value("difficulty", "bot_speed", 500)
		config.set_value("difficulty", "player_size", 3)
		config.set_value("difficulty", "bot_size", 3)
		config.set_value("difficulty", "bot_name", 'eazy')
	else:
		config.load(settings_file_path)

func save_difficulty_settings(key: String, value):
	config.set_value("difficulty", key, value)
	config.save(settings_file_path)

func load_difficulty_settings():
	var difficulty_settings = {}
	for key in config.get_section_keys("difficulty"):
		difficulty_settings[key] = config.get_value("difficulty", key)
	return difficulty_settings
