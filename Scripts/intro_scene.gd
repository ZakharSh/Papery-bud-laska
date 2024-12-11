extends Node2D

func _ready():
	$Label.text = """ Сьогоднішня ситуація у світі:
 - Війна, розруха і тисячі людей намагаються врятуватися.
 - Вам доручено провести перевірку на кордоні України та Польщі."""
	# Настройка кнопки
	#$Button.text = "Продовжити"
	#$Button.connect("pressed", self, "_on_continue_pressed")

func _on_continue_pressed():
	# Переход к сцене с рабочим местом
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")
