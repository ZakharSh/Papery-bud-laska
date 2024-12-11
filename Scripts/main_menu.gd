extends Control
@onready var timer: Timer = $Timer
@onready var start_game: Button = $Main_menu/StartGame

func _on_StartGame_pressed():
	# Убедитесь, что путь к сцене корректен
	$StartGame.play()
	timer.start()
	start_game.visible = false

func _on_Exit_pressed():
	get_tree().quit()


func _on_timer_timeout() -> void:
		get_tree().change_scene_to_file("res://Scenes/IntroScene.tscn")
