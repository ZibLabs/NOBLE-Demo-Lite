extends Node2D

@export var EnemyHealth: int = 100  # Example enemy HP

func _ready() -> void:
	while true:
		EnemyHealth -= 0.1
		print("Enemy took damage! Current health: ", EnemyHealth)
		check_health()
		await get_tree().create_timer(0.1).timeout

func check_health():
	print(EnemyHealth)
	if EnemyHealth <= 0:
		print("Enemy defeated! Ending combat...")
		$"../../RoomOne/TestScene/GregCollider".emit_signal("EnemyDefeated")
