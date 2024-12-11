extends Control

func _on_StartGame_pressed():
	# Убедитесь, что путь к сцене корректен
	get_tree().change_scene_to_file("res://Scenes/IntroScene.tscn")

func _on_Exit_pressed():
	get_tree().quit()
