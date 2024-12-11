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
			"dateOfBirth": "2024-12-01", 
			"expirationDate": "2025-12-01", 
			"citizenship": "Украина",
			"photo": "res://Assets/photos/female.png"
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
			"dateOfBirth": "2024-11-15", 
			"expirationDate": "2025-11-15", 
			"citizenship": "Польша",
			"photo": "res://Assets/photos/grandpa.png"
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
			"dateOfBirth": "2024-12-05", 
			"expirationDate": "2025-12-05", 
			"citizenship": "Россия",
			"photo": "res://Assets/photos/male.png"
		},
		"day": 1
	}
]
