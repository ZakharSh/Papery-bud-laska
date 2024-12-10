extends Node2D

# Поля для хранения данных документа
var nname = ""
var date = ""
var country = ""

# Функция для обновления данных документа
func set_data(data):
	name = data.nname
	date = data.date
	country = data.country
	
	# Установить текст на лейблы
	$Sprite2D/name.text = nname
	$Sprite2D/date.text = date
	$Sprite2D/country.text = country
