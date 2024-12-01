extends Node
@export var player : CharacterBody3D
@export var startposition : Marker3D

func _init(player : CharacterBody3D = player) -> void:
	player = self.player

func _ready() -> void:
	if startposition:
		player.position = startposition.position
