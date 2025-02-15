extends Node
var room
var SeedGen
var SeedRNG: RandomNumberGenerator
@export var DebugSetSeed = true
@export var SetSeed = 342342342

func _ready() -> void:
	SeedRNG = RandomNumberGenerator.new()
	SeedRNG.randomize()
	if DebugSetSeed == true:
		SeedGen = SetSeed
	else:
		SeedGen = SeedRNG.randi_range(-184467407370955161,184467407370955161)		
	print( SeedGen )
