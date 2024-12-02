extends CharacterBody3D
#REWORK THIS INTO A STATE MACHINE HOLY FUCK THIS IS HORRIBLE
#states : interacting, walking
#Seperate the genome functions into a seperate node and script that handles the player genomes
#Seperate the interaction collider into a different node that handles the interactions
#The camera should be independent from the player, how im going to do this i have no fucking clue
#the player UI should easily be referenced, probably through the use of a singleton
#this is unneccessary, since we are suddenly deciding to not do multiplayer anymore, god fucking dammit
@export var id = 0
var speed = 5
var genomehandler : Node
var collider : Collider
@export var debug : bool = false
enum state {INTERACTING, WALK, IDLE, GENOME}
var currentstate : state
#static var player_UI : Control
var intarea : GameObject
var soundplayer : AudioStreamPlayer3D
func _ready() -> void:
	soundplayer = $AudioStreamPlayer
	if debug:
		$PLAYERDEBUG.visible = true
	else:
		$PLAYERDEBUG.visible = false
	$Camera3D.current = true
	_set_state(state.WALK)
	genomehandler = $GenomeHandler
	collider = $Collider
	#player_UI = $PlayerUI
	Globals.playerUI = $PlayerUI

func _process(delta: float) -> void:
	_update_state(delta)
	if debug:
		_debug()
	velocity.y = -9.8

func _update_state(delta : float) -> void:
	var movedir = Input.get_vector('left', 'right', 'up', 'down')
	#movedir.y = Input.get_axis("up", "down")
	#movedir.x = Input.get_axis("left", "right")
	match currentstate:
		state.IDLE:
			if Input.is_action_just_pressed('interact'):
				_set_state(state.INTERACTING)
			if movedir.x != 0 or movedir.y !=0:
				_set_state(state.WALK)
			if Input.is_action_just_pressed("menu"):
				$PlayerUI.menuvisible = !$PlayerUI.menuvisible
		state.WALK:
			if Input.is_action_just_pressed("menu"):
				$PlayerUI.menuvisible = !$PlayerUI.menuvisible
			if Input.is_action_just_pressed('interact'):
				_set_state(state.INTERACTING)
			if movedir == Vector2.ZERO:
				_set_state(state.IDLE)
			movedir = movedir.normalized()
			if movedir.y > 0 and movedir.x == 0:
				$Sprite.play('Back')
			if movedir.y < 0 and movedir.x == 0:
				$Sprite.play('Forward')
			if movedir.x < 0: $Sprite.play('Left')
			if movedir.x > 0: $Sprite.play('Right')
			#if movedir.y < 0: $Sprite.play('Forward')
			#if movedir.y > 0: $Sprite.play('Back')
			var relativedir = Vector3(movedir.x, -9.8, movedir.y).rotated(Vector3.UP, get_viewport().get_camera_3d().rotation.y)
			#velocity = Vector3(movedir.x, -9.8, movedir.y) * speed
			velocity = relativedir * speed
			move_and_slide()
		state.INTERACTING:
			if Input.is_action_just_pressed('esc'):
				_set_state(state.IDLE)
			if Input.is_action_just_pressed('interact'):
				_set_state(state.IDLE)

#func handle_animation():
	#if movedir.y > 0:
		#$Sprite.play('Back')
	#if movedir.y < 0:
		#$Sprite.play('Forward')
	#if movedir.x > 0:
		#$Sprite.play('Right')
	#if movedir.x < 0:
		#$Sprite.play('Left')
	#if velocity.x == 0 and velocity.z == 0:
		#$Sprite.pause()

func _enter_state():
	match currentstate:
		state.INTERACTING:
			if collider.intarea:
				collider.intarea.interact()
			else:
				_set_state(state.IDLE)
		state.WALK:
			soundplayer.play()
		state.IDLE:
			$Sprite.pause()
		state.GENOME:
			pass
func _exit_state():
	match currentstate:
		state.INTERACTING:
			#$Camera3D.current = true
			pass
		state.WALK:
			soundplayer.stop()
		state.IDLE:
			pass
		state.GENOME:
			pass
func _set_state(newstate : state):
	if currentstate == newstate:
		return
	_exit_state()
	currentstate = newstate
	_enter_state()

func think(title :String, thought : String):
	$PlayerUI.title = title
	$PlayerUI.text = thought
	
func getgenome() -> GenomeInfo:
	return genomehandler.current
	
@onready var statedata = $PLAYERDEBUG/Window/Data/State/status
@onready var velocitydata = $PLAYERDEBUG/Window/Data/velocity/status
@onready var intareadata = $PLAYERDEBUG/Window/Data/intarea/status
func _debug():
	statedata.text = state.find_key(currentstate)
	velocitydata.text = str(velocity)
	intareadata.text = str(collider.get_area())
