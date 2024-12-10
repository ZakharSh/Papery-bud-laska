extends Control

var nname = ""
var date = ""
var country = ""

func set_data(data):
	nname = data.name
	date = data.date
	country = data.country
	$Label_name.text = nname
	$Label_date.text = date
	$Label_country.text = country
pass
