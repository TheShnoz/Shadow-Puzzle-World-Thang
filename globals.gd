extends Node

var playerUI
var unlockedgenomes : Array[GenomeInfo]
var collectables_found : int = 0
func speak(text : String):
	playerUI.saywithtimer(text)
