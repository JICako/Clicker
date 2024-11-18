extends Button

@export var score: Label

var score_in_game = 0

func _on_pressed():
	score_in_game += 1

func _process(delta):
	score.text.num_int64(score_in_game)
