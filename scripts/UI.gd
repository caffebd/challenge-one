extends Control


var my_score = 0

var time_left = 10

export var use_timer = false

# Called when the node enters the scene tree for the first time.
func _ready():
	OS.center_window()
	Signals.connect("change_score", self, "_change_score")
	$Score.text = "SCORE: " + str(my_score)
	$Time.text = "TIME: " + str(time_left)
	if use_timer:
		$Timer.start()
	
#	if use_timer:

func _change_score(value):
	my_score += value
	$Score.text = "SCORE: " + str(my_score)


func _on_Timer_timeout():
	time_left -= 1
	$Time.text = "TIME: " + str(time_left)
	if time_left == 0:
		$Timer.stop()
		Signals.emit_signal("remove_items")












