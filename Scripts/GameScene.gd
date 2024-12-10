extends Node2D

# Переменные
var score = 0  # Очки игрока
var current_document = {}  # Текущий документ
# Сцена-шаблон документа
var DocumentScene = preload("res://Scenes/Document.tscn")



# Обновление UI
func update_ui():
	$Control/Score.text = "\nОчки: " + str(score)
	
# Загрузка данных из глобального скрипта (если используется Singleton)

#func _ready():
#	score = 0  # Устанавливаем начальное значение очков
#	print("Готово! Спавним документ...")
#	spawn_document()  # Убедитесь, что эта строка есть и выполняется
#
#	update_ui()  # Показываем очки на экране
#	generate_new_document()#

# Генерация нового документа
func generate_new_document():
	current_document = DocumentsData.documents[randi() % DocumentsData.documents.size()]
	$Control/Doc.text = "Документ:\n" + "Имя: " + current_document["nname"] + "\nДата: " + current_document["date"] + "\nСтрана: " + current_document["country"]



# Данные текущего персонажа
var current_document_data = {
	"nname": "Иван Петров",
	"date": "2024-12-10",
	"country": "Украина"
}

func _ready():
	if DocumentScene:
		print("DocumentScene загружена успешно!")
		spawn_document()
	else:
		print("Ошибка: DocumentScene не загружена.")

func spawn_document():
	if DocumentScene:
		var document_instance = DocumentScene.instance()
		add_child(document_instance)
		document_instance.position = Vector2(300, 300)
	else:
		print("Ошибка: DocumentScene не загружена!")


# Обработка кнопки "Пропустить"
func _on_pass_button_pressed():
	if check_document(current_document):
		score += 10  # Добавить очки
	else:
		score -= 5  # Штраф
	update_ui()
	generate_new_document()

# Обработка кнопки "Не пропустить"
func _on_reject_button_pressed():
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
