extends RichTextLabel
func _ready() -> void:
	while true:
		if $"../CheckButton".button_pressed == true:
			$".".visible = true
			$"../Button".visible = true
		else:
			$".".visible = false
			$"../Button".visible = false
		await get_tree().create_timer(0.1).timeout
	
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://HIM.tscn")
	
