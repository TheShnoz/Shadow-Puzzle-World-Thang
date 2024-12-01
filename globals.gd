extends Node

var playerUI
var unlockedgenomes : Array[GenomeInfo]
signal genomeadded()
func speak(text : String):
	playerUI.saywithtimer(text)
