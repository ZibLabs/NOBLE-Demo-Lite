extends Node2D


func _on_button_3_pressed() -> void:
	Fade.fade_out(0.5)
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()
func _on_button_2_pressed() -> void:
	Fade.fade_out(0.5)
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://SettingsMenu.tscn")
	Fade.fade_in(0.5)
func _on_button_pressed() -> void:
	Fade.fade_out(0.5)
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Menu/CharacterSelect.tscn")
	Fade.fade_in(0.5)
