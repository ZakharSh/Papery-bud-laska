extends Node

# Переменные
var score = 0  # Очки игрока
var current_document = {}  # Текущий документ
var current_day = 1  # Текущий день
var current_document_id = 0
var DocumentScene = preload("res://Scenes/pasport.tscn")

@onready var pasport: RigidBody2D = $Pasport

# Обновление UI
func update_ui():
	$MonitorControl/Score.text = "Очки: " + str(score)

# Загрузка данных из глобального скрипта (если используется Singleton)
func _ready():
	score = 0  # Устанавливаем начальное значение очков
	generate_new_document()
	var modal = $vertdictControl/verdictButton/Popup
	close_modal_window(modal)

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

	var photo = load(actual_data["photo"])
	$MonitorControl/PhotoField.texture = photo
	
	$Background/Person.texture = photo
	pasport.set_data(actual_data)

# Проверка документа
func check_document(doc_data):
	var fake = doc_data["fake_data"]
	var actual = doc_data["actual_data"]
	return fake == actual 

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
	var modal = $vertdictControl/verdictButton/Popup
	close_modal_window(modal)
	current_document_id += 1 
	generate_new_document()


func _on_reject_pressed() -> void:
	print("Кнопка нажата!")
	$Click.play()
	print("Документ отклонен")
	var modal = $vertdictControl/verdictButton/Popup
	close_modal_window(modal)
	current_document_id += 1 
	generate_new_document()

func _on_verdict_button_pressed() -> void:
	$Click.play()
	var modal = $vertdictControl/verdictButton/Popup
	
	if modal.is_visible():
		close_modal_window(modal)
	else:
		open_modal_window(modal)

func _on_exit_pressed():
	get_tree().quit()
