extends Node2D


	
func _on_continue_pressed():
	# Переход к сцене с рабочим местом
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")
