extends Resource

class_name GenomeInfo

@export var Spriteframes : SpriteFrames
@export var Genome_name : String
@export var speed : float = 5
@export var flying : bool = false


func use_genome(): #func to override
	print('used ', Genome_name)
