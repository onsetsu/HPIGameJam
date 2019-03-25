extends Node2D

var sheep_scene = preload("res://Scenes/Sheep.tscn")
var person_scene = preload("res://Scenes/Person.tscn")

export var speed = 30

var path_length

func _ready():
    path_length = $path.curve.get_baked_length()
    
    for i in range(0,25):
        var entity
        if i % 5 == 0:
            entity = sheep_scene.instance()
        else:
            entity = person_scene.instance()

        var follow = PathFollow2D.new()
        follow.rotate = false
        follow.offset = (path_length - 100 ) * i / 25.0
        $path.add_child(follow)
        follow.add_child(entity)

func _process(delta):
    for follow_path in $path.get_children():
        follow_path.offset += speed * delta
        if follow_path.offset > path_length:
            var person = follow_path.get_children()[0]
            person.end_reached()
            follow_path.queue_free()
