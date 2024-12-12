extends Node

var score = 0  # Очки игрока
var current_document = {}  # Текущий документ
var current_day = 1  # Текущий день
var current_document_id = 0
var DocumentScene = preload("res://Scenes/pasport.tscn")

@onready var pasport: RigidBody2D = $Pasport

# Функция для проверки возрастного диапазона
func is_within_age_range(date_of_birth: String, min_age: int, max_age: int) -> bool:
	var current_date = {"year": 2024, "month": 9, "day": 28}
	var birth_date = date_of_birth.split("-")
	var age = current_date.year - int(birth_date[0])
	if current_date.month < int(birth_date[1]) or (current_date.month == int(birth_date[1]) and current_date.day < int(birth_date[2])):
		age -= 1

	print("Дата рождения:", date_of_birth, "Возраст:", age)
	return min_age <= age and age <= max_age

# Проверка документа по правилам и изменение очков
func check_document(doc_data):
	var rules = DocumentsData.rules[0]
	var data = doc_data["actual_data"]
	
	# Проверяем категорию "Banned"
	if "Banned" in rules:
		for rule_title in rules["Banned"]:
			var rule = rules["Banned"][rule_title]
			if rule_title == "Military age men" and data["sex"] == "M":
				if is_within_age_range(data["dateOfBirth"], 18, 60):
					print("Document banned: Military age men -", data["firstName"], data["secondName"])
					return false
	
	# Проверяем категорию "Permitted"
	if "Permitted" in rules:
		for rule_title in rules["Permitted"]:
			var rule = rules["Permitted"][rule_title]
			if rule_title == "Women and children under 18":
				if data["sex"] == "F" and is_within_age_range(data["dateOfBirth"], 0, 17):
					print("Document permitted: Women and children under 18 -", data["firstName"], data["secondName"])
					score += 10
					return true
			elif rule_title == "Foreigners":
				if data["citizenship"] != "UKR":
					print("Document permitted: Foreigners -", data["firstName"], data["secondName"])
					score += 5
					return true
	
	# По умолчанию, если не подходит ни под одно правило
	return false

# Обновление UI
func update_ui():
	$MonitorControl/ScoreField/Value.text = str(score)

# Загрузка данных из глобального скрипта (если используется Singleton)
func _ready():
	score = 0  # Устанавливаем начальное значение очков
	generate_new_document()
	var modal = $vertdictControl/verdictButton/Popup
	var info = $InformationControl
	generate_information_text()
	close_modal_window(modal)
	close_modal_window(info)

func generate_information_text():
	var rules = DocumentsData.rules[0]  # Извлекаем первый объект правил
	
	var result_text = ""  # Строка для накопления текста
	
	# Обработка категории "Banned"
	if "Banned" in rules:
		result_text += "Banned:\n"
		for title in rules["Banned"]:
			var description = rules["Banned"][title]["description"]
			result_text += "- " + title + ": " + description + "\n"
	
	# Обработка категории "Permitted"
	if "Permitted" in rules:
		result_text += "\nPermitted:\n"
		for title in rules["Permitted"]:
			var description = rules["Permitted"][title]["description"]
			result_text += "- " + title + ": " + description + "\n"
	
	# Вывод текста в Label
	$InformationControl/TextureRect/Label.text = result_text

# Генерация нового документа
func generate_new_document():

	if current_document_id == len(DocumentsData.documents):
		current_document_id = 0
	# Находим документ для текущего дня
	var document = DocumentsData.documents[current_document_id]
	
	
	if document["day"] == current_day:
		current_document = document
	else:
		current_day += 1

	# Заполняем UI данными
	var actual_data = current_document["actual_data"]
	
	
	
	$MonitorControl/FirstName/Value.text = actual_data["firstName"]
	$MonitorControl/SecondName/Value.text = actual_data["secondName"]
	$MonitorControl/DateOfBirth/Value.text = actual_data["dateOfBirth"]
	$MonitorControl/ExpirationDate/Value.text = actual_data["expirationDate"]
	$MonitorControl/Citizenship/Value.text = actual_data["citizenship"]
	$MonitorControl/Sex/Value.text = actual_data["sex"]

	var photo = load(actual_data["photo"])
	$MonitorControl/PhotoField.texture = photo
	
	$Background/Person.texture = photo
	pasport.set_data(actual_data)

# Переход на следующий день
func next_day():
	current_day += 1
	if current_day > DocumentsData.documents.size():
		current_day = 1 
	generate_new_document()

# Настройка модального окна
func close_modal_window(modal):
	modal.hide()

func open_modal_window(modal):
	modal.show()

func _on_accept_pressed() -> void:
	$Click.play()
	print("Документ принят")
	if check_document(current_document):
		print("Правильное решение. Очки добавлены.")
	else:
		print("Ошибка! Документ не соответствует правилам.")
	update_ui()
	current_document_id += 1 
	generate_new_document()
	var modal = $vertdictControl/verdictButton/Popup
	close_modal_window(modal)

func _on_reject_pressed() -> void:
	$Click.play()
	print("Документ отклонен")
	if not check_document(current_document):
		print("Правильное решение. Очки добавлены.")
	else:
		print("Ошибка! Документ соответствует правилам.")
	update_ui()
	current_document_id += 1 
	generate_new_document()
	var modal = $vertdictControl/verdictButton/Popup
	close_modal_window(modal)

func _on_verdict_button_pressed() -> void:
	$Click.play()
	var modal = $vertdictControl/verdictButton/Popup
	
	if modal.is_visible():
		close_modal_window(modal)
	else:
		open_modal_window(modal)

func _on_exit_pressed():
	$Click.play()
	get_tree().quit()


func _on_instruction_button_pressed() -> void:
	$Click.play()
	var modal = $InformationControl
	
	if modal.is_visible():
		close_modal_window(modal)
	else:
		open_modal_window(modal)
