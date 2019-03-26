extends Node2D

var sheep_scene = preload("res://Scenes/Sheep.tscn")
var person_scene = preload("res://Scenes/Person.tscn")

onready var Mensa = get_tree().get_root().get_node('Mensa')

export var speed = 30

var path_length
var queue_start = false

func _ready():
    path_length = $path.curve.get_baked_length()
    $Timer.start()
    spawn_wave()

func spawn_wave():
    for i in range(0,25):
        var entity
        if i % 5 == 0:
            entity = sheep_scene.instance()
            #entity.set_appearance(entity.HEAD_COLOR.pink, entity.FUR_COLOR.green, entity.PATTERN.none)
            randomize()
            entity.randomize_appearance()
        else:
            entity = person_scene.instance()

        var follow = PathFollow2D.new()
        follow.rotate = false
        follow.offset = (path_length - 100 ) * i / 25.0
        $path.add_child(follow)
        follow.add_child(entity)
    
func _process(delta):
	if queue_start:
	    for follow_path in $path.get_children():
	        follow_path.offset += speed * delta
	        if follow_path.offset > path_length:
	            var person = follow_path.get_children()[0]
	            
	            Mensa.reparent_finished_person(person)
	            
	            person.end_reached()
	            follow_path.queue_free()


func _on_Timer_timeout():
	queue_start = true 
