extends Node

@export_category("office")
#var collectablesfound : int
#var collectablesneeded : int
var collectables_needed : int = 5
@export var player : CharacterBody3D
var computeron : bool = false
func _ready() -> void:
	#_calculate_collects()
	var default = load("res://content/items/genomes/normal.tres")
	#var rock = load("res://content/items/genomes/rock.tres")
	Globals.unlockedgenomes.append(default)
	#Globals.unlockedgenomes.append(rock)

func _process(delta: float) -> void:
	#if Input.is_action_just_pressed('esc'):
		#$Final.hatch()
	if Globals.collectables_found == collectables_needed:
		$Final.hatch()
		
	if player.global_position.x < -55:
		player.global_position.x = 54
		player.global_position.z = 12
	if player.global_position.x > 55:
		player.global_position.x = -30
		player.global_position.z = 8
	if player.global_position.z < -35:
		player.global_position.z = 43
		player.global_position.x = 0
	if player.global_position.z > 45:
		player.global_position.z = -34
		player.global_position.x = 0
#func _calculate_collects() -> void: #calculates needed collectables
	#collectablesneeded = 0
	#for child in get_children():
		#if child.is_class('collectable'):
			#collectablesneeded += 1
