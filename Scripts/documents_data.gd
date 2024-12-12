# documents_data.gd
extends Node  # Или можно использовать Resource, если вы хотите подключать данные напрямую

# Данные документов
var documents = [
	{
		"fake_data": {
			"firstName": "Galina",
		},
		"actual_data": {
			"firstName": "Galina", 
			"secondName": "Tkachenko", 
			"sex": "F",
			"dateOfBirth": "1965-03-26", 
			"expirationDate": "2028-12-01", 
			"citizenship": "UKR",
			"photo": "res://Assets/photos/1_grandma.png"
		},
		"day": 1
	},
	{
		"fake_data": {
		},
		"actual_data": {
			"firstName": "Oleksii", 
			"secondName": "Tkachenko", 
			"sex": "M" , 
			"dateOfBirth": "1962-07-05", 
			"expirationDate": "2027-11-15", 
			"citizenship": "UKR",
			"photo": "res://Assets/photos/2_grandpa.png"
		},
		"day": 1
	},
	{
		"fake_data": {
		},
		"actual_data": {
			"firstName": "Ivan", 
			"secondName": "Mushko", 
			"sex": "M" , 
			"dateOfBirth": "1992-09-14", 
			"expirationDate": "2038-12-05", 
			"citizenship": "UKR",
			"photo": "res://Assets/photos/3_male.png"
		},
		"day": 1
	},
{
		"fake_data": {
		},
		"actual_data": {
			"firstName": "Emilia", 
			"secondName": "Harper", 
			"sex": "F" , 
			"dateOfBirth": "1990-17-11", 
			"expirationDate": "2026-08-15", 
			"citizenship": "UK",
			"photo": "res://Assets/photos/4_female2.png"
		},
		"day": 1
},
{
		"fake_data": {
		},
		"actual_data": {
			"firstName": "Katerina", 
			"secondName": "Kovalenko", 
			"sex": "F" , 
			"dateOfBirth": "2003-09-18", 
			"expirationDate": "2031-04-10", 
			"citizenship": "UKR",
			"photo": "res://Assets/photos/5_female.png"
		},
		"day": 1
}
]
var rules = [
	{
		"Banned": {
			"Military age men": {
				"rule": "18-60",
				"description": "Men of military age (18-60) are not allowed to leave."
			}
		},
		"Permitted": {
			"Women and children under 18": {
				"rules": ["F", "<18"],
				"description": "Women and children under 18 years of age with valid documents are allowed to leave."
			},
			"Foreigners": {
				"rules": ["!Ukr"],
				"description": "All foreigners are allowed to leave."
			},
			"Extra note": {
				"rules": [],
				"description": "Check carefully for a match with external data."
			}
		}
	}
]
