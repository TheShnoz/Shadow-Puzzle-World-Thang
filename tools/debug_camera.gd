extends Camera3D

var mouseheld

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		mouseheld = true
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		print(mouseheld)
	else:
		mouseheld = false
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		print(mouseheld)

func _process(delta: float) -> void:
	pass
