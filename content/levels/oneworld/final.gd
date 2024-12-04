extends AnimatedSprite3D
@export var forms : Array[SpriteFrames]
var finalform : SpriteFrames
var hatched : bool = false
func _ready() -> void:
	finalform = forms.pick_random()

func hatch():
	self.sprite_frames = finalform
	hatched = true
	play()
	$AudioStreamPlayer3D.play()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if hatched:
		get_tree().change_scene_to_file('res://menus/menuinit.tscn')
