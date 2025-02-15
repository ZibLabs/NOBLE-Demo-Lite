extends Area2D
@export var CombatScene:PackedScene
signal EnemyDefeated
var scene_instance  # Store instance globally so we can track it

func _on_body_entered(_body: Node2D) -> void:
	print("Running Combat Trigger...")

	Fade.fade_out(0.5)  # Start fading out
	await get_tree().create_timer(0.5).timeout
	get_tree().paused = true  # Pause world movement
	$"../../../PlatformerController2D".global_position = $".".global_position
	hide_main_scene()  # Hide world objects

	# **Create Combat Scene**
	scene_instance = CombatScene.instantiate()
	$"../../..".add_child(scene_instance)

	Fade.fade_in(0.5)  # Fade back in

	await get_tree().process_frame 
	var combat_greg = $"../../../Combat/CombatGreg"
	if combat_greg:
		print("CombatGreg found! Waiting for combat to end...")
		await EnemyDefeated
	else:
		print("CombatGreg not found! Exiting...")
	Fade.fade_out(0.5)
	if scene_instance:
		scene_instance.queue_free()
	show_main_scene()
	get_tree().paused = false

	Fade.fade_in(0.5)

func hide_main_scene():
	$"../../../CanvasModulate".visible = false
	$"../GPUParticles2D".visible = false
	$"../TileMapLayer".visible = false
	$".".visible = false
	$".".monitoring = false

func show_main_scene():
	$"../../../CanvasModulate".visible = true
	$"../GPUParticles2D".visible = true
	$"../TileMapLayer".visible = true
