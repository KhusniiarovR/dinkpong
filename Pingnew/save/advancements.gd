extends Node

var config = ConfigFile.new()
const settings_file_path = "user://goals"

func _ready():
	if !FileAccess.file_exists(settings_file_path):
		config.set_value("wins", "eazy", 0)
		config.set_value("wins", "normal", 0)
		config.set_value("wins", "hard", 0)
		config.set_value("wins", "eazy_h", 0)
		config.set_value("wins", "normal_h", 0)
	else:
		config.load(settings_file_path)

func save_goals_settings(key: String, value):
	config.set_value("wins", key, value)
	config.save(settings_file_path)

func load_goals_settings():
	var goals_settings = {}
	for key in config.get_section_keys("wins"):
		goals_settings[key] = config.get_value("wins", key)
	return goals_settings
