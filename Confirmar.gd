extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _pararSom():
	yield(get_tree().create_timer(0.15), "timeout")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
