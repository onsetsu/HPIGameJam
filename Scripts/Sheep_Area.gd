extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var Mensa = get_tree().get_root().get_node('Mensa')

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		Mensa.clicked_on_sheep(get_parent().get_parent())
	elif event is InputEventMouseMotion:
		Mensa.hovering_over_sheep(get_parent().get_parent())

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
