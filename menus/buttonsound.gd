extends Button
var buttonsound  = preload("res://content/music/button.mp3")


func _ready() -> void:
	button_down.connect(click)

func click():
	pass
