extends Node

@export var FriendLocation : Marker3D
@export_category("office")

var computeron : bool = false
func _ready() -> void:
	var default = load("res://content/items/genomes/normal.tres")
	var fluff = load("res://content/items/genomes/fluff.tres")
	#var rock = load("res://content/items/genomes/rock.tres")
	Globals.unlockedgenomes.append(default)
	Globals.unlockedgenomes.append(fluff)
	#Globals.unlockedgenomes.append(rock)
	
func _process(delta: float) -> void:
	pass
