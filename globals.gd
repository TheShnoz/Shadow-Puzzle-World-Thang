extends Node

var playerUI
var unlockedgenomes : Array[GenomeInfo]

func speak(text : String):
	playerUI.saywithtimer(text)
