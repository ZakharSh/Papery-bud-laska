extends RigidBody2D



# Функция для обновления данных документа
func set_data(data):
	
	var secondName = data["secondName"]
	var firstName = data["firstName"]
	var citizenship = data["citizenship"]
	var dateOfBirth = data["dateOfBirth"]
	var expirationDate = data["expirationDate"]
	
	var photo = load(data["photo"])
	
	# Установить текст на лейблы
	$Sprite2D/Surname/Value.text = secondName
	$Sprite2D/Name/Value.text = firstName
	$Sprite2D/Nationality/Value.text = citizenship
	$Sprite2D/DateOfBirth/Value.text = dateOfBirth
	$Sprite2D/ExpirationDate/Value.text = expirationDate
	
	
	$Sprite2D/Photo.texture = photo





# Переменные
var is_dragging = false  # Флаг для перетаскивания
var start_position = Vector2()  # Начальная позиция

#var was_opened = false  # Флаг, чтобы документ открывался только один раз




func _input(event):
	# Если документ перетаскивается
	if is_dragging:
		check_document_zone()  # Проверяем, где находится документ
		if event is InputEventMouseMotion:
			position += event.relative  # Двигаем документ
		elif event is InputEventMouseButton and not event.pressed:
			is_dragging = false  # Останавливаем перетаскивание
			

	# Если начато перетаскивание
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if get_global_mouse_position().distance_to(global_position) < 200:
			is_dragging = true
			start_position = position  # Сохраняем начальную позицию

# Проверка зоны, куда перемещён документ
func check_document_zone():
	print(position.x)
	if position.x < 900:  # Левая зона (уменьшаем документ)
		resize_document(Vector2(0.3, 0.3))
	elif position.x > 900:  # Правая зона (открываем документ)
		#open_document()
		resize_document(Vector2(1, 1))
		#was_opened = true
	else:  # Возвращаем документ на начальную позицию
		position = start_position

# Уменьшение документа
func resize_document(new_scale: Vector2):
	$Sprite2D.scale = new_scale
	$CollisionShape2D.scale = new_scale  # Меняем масштаб спрайта
	print("Документ уменьшен!")

# Открытие документа
func open_document():
	print("Документ открыт!")
	var tween = get_tree().create_tween()  # Создаём анимацию
	#tween.tween_property(self, "position", Vector2(-500, 300), 0.5)  # Перемещаем документ
	#tween.tween_callback(Callable(self, "enable_physics"))  # Активируем физику после анимации

# Активация физики
func enable_physics():
#	set_mode(RigidBody2D.MODE_DYNAMIC)  # Переключаем RigidBody2D в динамический режим
	print("Физика активирована!")
