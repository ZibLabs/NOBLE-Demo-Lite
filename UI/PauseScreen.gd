extends Control


func _on_texture_button_pressed() -> void:
	get_tree().paused = true
	$PauseMenu.visible = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		get_tree().paused = true
		$PauseMenu.visible = true

func _on_back_pressed() -> void:
	get_tree().paused = false
	$PauseMenu.visible = false


func _on_quit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Menu/MainMenu.tscn")

func chaos(chaosOn: bool) -> void:
	$CanvasModulate.visible = chaosOn
	var chaos_hue = 0.0
	while chaosOn:
		$CanvasModulate.color = Color.from_hsv(chaos_hue, 1.0, 1.0, 1.0)
		chaos_hue += 0.01 
		if chaos_hue >= 1.0:
			chaos_hue = 0.0
		await get_tree().create_timer(0.025).timeout

func _ready() -> void:
	chaos(ConfigHandler.load_misc_settings().get("EmbraceChaos?"))

func _on_deck_pressed() -> void:
	$PauseMenu.visible = false
	$DeckView.visible = true
	$DeckView.emit_signal("LoadCards")
