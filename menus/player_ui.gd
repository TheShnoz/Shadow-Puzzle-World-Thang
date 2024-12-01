extends CanvasLayer

var title : String
var text : String

signal genome_selected(genome : GenomeInfo)

var menuvisible : bool = false:
	set(value):
		menuvisible = value
		if value == true:
			loadgenomemenu()
		if value == false:
			closegenomemenu()
func _ready() -> void:
	$Textbox.visible = false
	menuvisible = false
	_load_buttons()
func showtextbox():
	$Textbox.visible = true
	$Textbox/Text.text = text
func hidetextbox():
	$Textbox.visible = false
func saywithtimer(text : String, time : float = 1.5):
	if text != '':
		self.text = text
		showtextbox()
		$Timer.start(time)
		await $Timer.timeout
		hidetextbox()
	return

@export var genomegrid : GridContainer
func loadgenomemenu():
	$genomemenu.visible = true
	#for genome in Globals.unlockedgenomes:
		#
		#var gbutton = Button.new()
		##make genome class have an icon to avoid hard coding this NAH!!
		#var icon = genome.Spriteframes.get_frame_texture('Back', 0)
		#gbutton.icon = icon
		#gbutton.text = genome.Genome_name
		#genomegrid.add_child(gbutton)
		#gbutton.button_down.connect(genomeselected.bind(gbutton.get_index()))
		
	for i in Globals.unlockedgenomes.size():
		genomegrid.get_children()[i].disabled = false
		genomegrid.get_children()[i].icon = Globals.unlockedgenomes[i].Spriteframes.get_frame_texture('Back', 0)
		genomegrid.get_children()[i].text = Globals.unlockedgenomes[i].Genome_name
	for button :Button in genomegrid.get_children():
		if button.icon == null:
			button.disabled = true
		
func closegenomemenu():
	$genomemenu.visible = false

func genomeselected(id : int):
	emit_signal('genome_selected', Globals.unlockedgenomes[id])
	closegenomemenu()


func _on_button_button_down() -> void:
	closegenomemenu()

func _load_buttons():
	for button :Button in genomegrid.get_children():
		button.button_down.connect(genomeselected.bind(button.get_index()))
