extends Node2D

# Переменные
var score = 0  # Очки игрока
var current_document = {}  # Текущий документ
# Сцена-шаблон документа
var DocumentScene = preload("res://Scenes/pasport.tscn")



# Обновление UI
func update_ui():
	$Control/Score.text = "\nОчки: " + str(score)
	
# Загрузка данных из глобального скрипта (если используется Singleton)

func _ready():
	score = 0  # Устанавливаем начальное значение очков
#	print("Готово! Спавним документ...")
#	spawn_document()  # Убедитесь, что эта строка есть и выполняется
	pasport.set_data(current_document_data)
	update_ui()  # Показываем очки на экране
	generate_new_document()#

# Генерация нового документа
func generate_new_document():
	current_document = DocumentsData.documents[randi() % DocumentsData.documents.size()]
	$Control/Doc.text = "Документ:\n" + "Имя: " + current_document["nname"] + "\nДата: " + current_document["date"] + "\nСтрана: " + current_document["country"]

@onready var pasport: RigidBody2D = $Control/Pasport


# Данные текущего персонажа
var current_document_data = {
	"nname": "Ivan Myshko",
	"date": "2024-12-10",
	"country": "Ukraine"
}

# Обработка кнопки "Пропустить"
func _on_pass_button_pressed():
	$Click.play()
	if check_document(current_document):
		score += 10  # Добавить очки
	else:
		score -= 5  # Штраф
	update_ui()
	generate_new_document()



# Обработка кнопки "Не пропустить"
func _on_reject_button_pressed():
	$Click.play()
	if not check_document(current_document):
		score += 10  # Добавить очки
	else:
		score -= 5  # Штраф
	update_ui()
	generate_new_document()

# Проверка документа
func check_document(doc_data):
	return doc_data["country"] == "Украина"  # Например, правильный документ из Украины


func _on_exit_pressed():
	get_tree().quit()
