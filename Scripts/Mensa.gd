extends Node2D

func _ready():
    pass # Replace with function body.

func _process(delta):
    pass

# show details
# -------------------------------------------------------------------------
func selected_sheep(sheep):
    print('should show details')

func unselected_sheep(sheep):
    print('hide details')

# queue end
# -------------------------------------------------------------------------
func reparent_finished_person(person):
    var former_parent = person.get_parent()
    if former_parent:
        former_parent.remove_child(person)
    $end_point/finished.add_child(person)
    person.position = Vector2(0, 0)

# check suitability
# -------------------------------------------------------------------------
func current_dishes():
    return $dishes.get_children()

func check(sheep):
    var dishes = current_dishes()
    if not sheep.assigned_dish:
        return failure(sheep)
    _check(sheep, dishes[sheep.assigned_dish], dishes)
    
func _check(sheep, dish, all_dishes):
    pass

func success(sheep):
    print('What a happy sheep!')

func failure(sheep):
    print('Oh no! Your sheep died.')
