extends Area2D


export var respawn = true

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.connect("remove_items", self, "_remove_items")
	rng.randomize()
	

func _on_CollectItem_body_entered(body):
	queue_free()





#	if body.is_in_group("Player"):
#		_was_collected()

func _was_collected():
	Signals.emit_signal("change_score",1)
	if respawn:
		var x_pos = rng.randf_range (100, 900)
		var y_pos = rng.randf_range(100, 500)	
		global_position = Vector2(x_pos, y_pos)
	else:	
		queue_free()	

	
func _remove_items():
	queue_free()
