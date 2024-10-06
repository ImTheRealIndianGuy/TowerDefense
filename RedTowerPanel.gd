extends Panel

@onready var tower = preload("res://Scenes/red_bullet_tower.tscn")
var currfile

func _on_gui_input(event):
	var tempTower = tower.instantiate()
	if event is InputEventMouseButton and event.button_mask == 1:
		print("Left Button down")
		add_child(tempTower)
		tempTower.global_position = event.global_position
		tempTower.process_mode=Node.PROCESS_MODE_DISABLED
	elif event is InputEventMouseMotion and event.button_mask == 1:
		tempTower.global_position = event.global_position
	elif event is InputEventMouseButton and event.button_mask == 0:
		print("Left Button up")
		get_child(1).queue_free()
		var path = get_tree().get_root().get_node("game/Towers")
		
		path.add_child(tempTower)
		tempTower.globalposition = event.global_position
		tempTower.get_node("Area").hide()
	else: 
		if get_child_count() >1:
			get_child(1).queue_free()
