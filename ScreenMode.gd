extends OptionButton


func _on_item_selected(index: int) -> void:
	if index == 0:
		get_window().mode = Window.MODE_EXCLUSIVE_FULLSCREEN
	if index == 1: 
		get_window().mode = Window.MODE_WINDOWED
