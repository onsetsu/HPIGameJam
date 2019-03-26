extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func end_reached():
    $anim_player.play("end")
    $anim_player.connect("animation_finished", self, "__anim_finished__")

func __anim_finished__(__unused__):
    queue_free()
