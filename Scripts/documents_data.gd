# documents_data.gd
extends Node  # Или можно использовать Resource, если вы хотите подключать данные напрямую

# Данные документов
var documents = [
	{
		"fake_data": {
			"firstName": "Иван",
		},
		"actual_data": {
			"firstName": "Иван", 
			"secondName": "Петров", 
			"age": 34, 
			"creationDate": "2024-12-01", 
			"expirationDate": "2025-12-01", 
			"citizenship": "Украина",
			"photo": "res://Assets/photos/person_1.png"
		},
		"day": 1
	},
	{
		"fake_data": {
		},
		"actual_data": {
			"firstName": "Анна", 
			"secondName": "Смирнова", 
			"age": 29, 
			"creationDate": "2024-11-15", 
			"expirationDate": "2025-11-15", 
			"citizenship": "Польша",
			"photo": "res://Assets/photos/person_3.png"
		},
		"day": 1
	},
	{
		"fake_data": {
		},
		"actual_data": {
			"firstName": "Максим", 
			"secondName": "Иванов", 
			"age": 39, 
			"creationDate": "2024-12-05", 
			"expirationDate": "2025-12-05", 
			"citizenship": "Россия",
			"photo": "res://Assets/photos/ivanov.jpg"
		},
		"day": 1
	}
]
