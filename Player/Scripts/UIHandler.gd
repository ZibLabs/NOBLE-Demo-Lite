extends CanvasLayer
@onready var UiScene: PackedScene = preload("res://UI/UI.tscn")
func _ready() -> void:
	var	UiLoader = UiScene.instantiate()
	add_child(UiLoader)  
	await get_tree().create_timer(0.001).timeout
	Fade.fade_in(0.5)
