extends Node2D

var sheep_scene = preload("res://Scenes/Sheep.tscn")
var person_scene = preload("res://Scenes/Person.tscn")

var entities = []

func _ready():
    for i in range(0,11):
        var person = person_scene.instance()
        $entities.add_child(person)
func _process(delta):
    $"path/path-follow".offset += 30 * delta
    print($"path/path-follow/Sheep".transform.get_rotation())
