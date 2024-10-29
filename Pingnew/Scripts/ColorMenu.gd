extends Control

func _ready():
	get_tree().get_root().connect("go_back_requested", goback)
	var color_settings = Configcolor.load_color_settings()
	$Control1/ColorPicker1.color = color_settings.color1
	$Control1/ColorRect1.color = color_settings.color1
	$Control1/Label1.modulate = color_settings.color1
	$Control2/ColorPicker2.color = color_settings.color2
	$Control2/ColorRect2.color = color_settings.color2
	$Control2/Label2.modulate = color_settings.color2
	$Control3/ColorPicker3.color = color_settings.color3
	$Control3/ColorRect3.color = color_settings.color3
	$Control3/Label3.modulate = color_settings.color3
	$Control4/ColorPicker4.color = color_settings.color4
	$Control4/ColorRect4.color = color_settings.color4
	$Control4/Label4.modulate = color_settings.color4
	$Button1/Labelbutton1.modulate = color_settings.color1
	$Button2/Labelbutton2.modulate = color_settings.color2
	$Button3/Labelbutton3.modulate = color_settings.color3
	$Button4/Labelbutton4.modulate = color_settings.color4

func goback():
	get_tree().change_scene_to_file("res://Scenes/start.tscn")

func _on_color_picker1_color_changed(color):
	$Control1/ColorRect1.color = $Control1/ColorPicker1.color
	$Control1/Label1.modulate = $Control1/ColorPicker1.color
	$Button1/Labelbutton1.modulate = $Control1/ColorPicker1.color
	var _color1 = $Control1/ColorRect1.color
	Configcolor.save_color_settings("color1",$Control1/ColorRect1.color)


func _on_back_to_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/start.tscn")


func _on_color_picker2_color_changed(color):
	$Control2/ColorRect2.color = $Control2/ColorPicker2.color
	$Control2/Label2.modulate = $Control2/ColorPicker2.color
	$Button2/Labelbutton2.modulate = $Control2/ColorPicker2.color
	var _color2 = $Control2/ColorRect2.color
	Configcolor.save_color_settings("color2",$Control2/ColorRect2.color)

func _on_color_picker3_color_changed(color):
	$Control3/ColorRect3.color = $Control3/ColorPicker3.color
	$Control3/Label3.modulate = $Control3/ColorPicker3.color
	$Button3/Labelbutton3.modulate = $Control3/ColorPicker3.color
	var _color3 = $Control3/ColorRect3.color
	Configcolor.save_color_settings("color3",$Control3/ColorRect3.color)

func _on_color_picker4_color_changed(color):
	$Control4/ColorRect4.color = $Control4/ColorPicker4.color
	$Control4/Label4.modulate = $Control4/ColorPicker4.color
	$Button4/Labelbutton4.modulate = $Control4/ColorPicker4.color
	var _color4 = $Control4/ColorRect4.color
	Configcolor.save_color_settings("color4",$Control4/ColorRect4.color)



func _on_button_1_pressed():
	$Control2.hide()
	$Control3.hide()
	$Control4.hide()
	$Control1.show()


func _on_button_2_pressed():
	$Control1.hide()
	$Control3.hide()
	$Control4.hide()
	$Control2.show()


func _on_button_3_pressed():
	$Control1.hide()
	$Control2.hide()
	$Control4.hide()
	$Control3.show()


func _on_button4_pressed():
	$Control1.hide()
	$Control2.hide()
	$Control3.hide()
	$Control4.show()
