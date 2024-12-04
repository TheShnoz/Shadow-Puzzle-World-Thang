extends Area3D
class_name GameObject

#rework this whole fucking god damn thing

#@export var activated : bool = false:
	#set(value):
		#activated = value
		#if value == true:
			#activate()
		#if value == false:
			#deactivate()
@export var camswitch : Camera3D
@export var required : GenomeInfo
@export_multiline var text : String
@export var connected_object : GameObject

signal _on_interact
#signal _on_activate
#signal _on_deactivate
func _process(delta: float) -> void:
	pass
	
func interact(playergenome : GenomeInfo = null):
	#if playergenome == required:
	if required:
		if playergenome == required:
			emit_signal('_on_interact')
			return
	Globals.playerUI.saywithtimer(text)
	emit_signal('_on_interact')
	print('yuha')
	#if connected_object:
		#connected_object.activated = !connected_object.activated
	#if camswitch !=null:
		#camswitch.current = true


#func activate():
	#Globals.playerUI.saywithtimer(activate_text)
	#emit_signal('_on_activate')
	##print(activated)
#
#func deactivate():
	#Globals.playerUI.saywithtimer(deactivate_text)
	#emit_signal('_on_deactivate')
	##print(activated)
