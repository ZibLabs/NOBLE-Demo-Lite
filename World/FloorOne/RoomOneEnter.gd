extends Node2D

@export var scenes: Array[PackedScene] = []  # Exported array to hold PackedScenes

# When player enters the first door
func _on_door_collider_start_body_entered(_body: Node2D) -> void:
	if $"../RoomOne".get_child_count() == 1:
		if scenes.is_empty():
			push_error("No scenes have been assigned to the scenes array.")
			return
		var random_scene = scenes[randi() % scenes.size()]
		var instance = random_scene.instantiate()
		$"../RoomOne".add_child(instance)
		print("Random scene added to the tree successfully.")
	else:
		print("A scene is already present. Canceling random spawn")
	Fade.fade_out(0.25)
	await get_tree().create_timer(0.25).timeout
	$"../PlatformerController2D".global_position = Vector2(($"../RoomOne/EnteranceOne".global_position.x)+35,(($"../RoomOne/EnteranceOne".global_position.y)))
	Fade.fade_in(0.25)
	Input.action_press("right",0.1)
	await get_tree().create_timer(0.25).timeout
	Input.action_release("right")



func _on_door_collider_enterance_one_body_entered(_body: Node2D) -> void:
	Fade.fade_out(0.5)
	await get_tree().create_timer(0.5).timeout
	$"../PlatformerController2D".global_position = Vector2(($"../StartRoom/StartDoor".global_position.x)-35,(($"../StartRoom/StartDoor".global_position.y)))
	Fade.fade_in(0.5)
	Input.action_press("left",0.1)
	await get_tree().create_timer(0.25).timeout
	Input.action_release("left")
	
