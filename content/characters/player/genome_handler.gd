extends Node


@export var current : GenomeInfo:
	set(value):
		current = value
		_genomechanged()
	get():
		return current

@export var sprite : AnimatedSprite3D
var player

signal genome_changed
func _ready() -> void:
	player = get_parent()
	
func refresh():
	if current:
		sprite.sprite_frames = current.Spriteframes
		
	else:
		sprite.sprite_frames = load("res://content/characters/player/defaultspriteframes.tres")

func _genomechanged():
	emit_signal('genome_changed')
	player.speed = current.speedds
	refresh()


func _on_player_ui_genome_selected(genome: GenomeInfo) -> void:
	changegenome(genome)

func changegenome(genome):
	current = genome
	refresh()
