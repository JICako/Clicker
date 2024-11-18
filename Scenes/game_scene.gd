extends Node

@export var score_label: Label
@export var sps_label: Label
@export var price_label: Label
@export var btn: Button
@export var upgrade_btn: Button

var score = 0
var sps = 1
var upvol = 1
var price = 100

func _on_button_pressed():
	score += sps
	update_label()

func update_label():
	score_label.text = "Score %d$" % score
	sps_label.text = "%d$ per second" % sps
	price_label.text = "%d$" % price

func _on_upgrade_pressed():
	if score >= price:
		sps += upvol
		score -= price
		price = price + (price * 0.25)
		upvol += 1
		update_label()
	else:
		return
