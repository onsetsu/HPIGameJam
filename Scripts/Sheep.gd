extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var assigned_dish

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func _process(delta):
    if assigned_dish:
        $assigned_dish.text = str(assigned_dish)
    else:
        $assigned_dish.text = '?'

func end_reached():
    queue_free()
