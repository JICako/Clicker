extends Node

@export var label: Label
@export var btn: Button
@export var upgrade_btn: Button

var score = 0
var spc = 1

func _on_button_pressed():
	score += spc
	update_label()

func update_label():
	label.text = "Score %d$" % score 

func _on_upgrade_pressed():
	if score >= 100:
		spc += 1
		score -= 100
		update_label()
	else:
		return
