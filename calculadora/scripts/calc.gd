extends Node

# Display
@export_group("Display")
@export var display_numbers: Label;

var i_value_a: int = 0;

var value_a: String;
var value_b: String;
var operator: String = "";

var int_value_a:int;
var int_value_b:int;

func _ready():
	display_numbers.text = '0';
	
	for button in get_tree().get_nodes_in_group("button"):
		button.pressed.connect(_button_on_pressed.bind(button.name));

func _button_on_pressed(button_name: String):
	
	match button_name:
		"division":
			if value_a == "" and operator != "":
				return
				
			operator = "/"
			i_value_a = 2
		"times":
			if value_a == "" and operator != "":
				return
				
			operator = "*"
			i_value_a = 2
		"subtraction":
			if value_a == "" and operator != "":
				return
				
			operator = "-"
			i_value_a = 2
		"addition":
			if value_a == "" and operator != "":
				return;
				
			operator = "+";
			i_value_a = 2;
		"c":
			clear();
		"=":
			int_value_a = int(value_a);
			int_value_b = int(value_b);
			
			_equal();
		_:
			if i_value_a == 0:
				value_a += button_name;
				
				if operator == "":
					display_numbers.text = value_a;
				
			else:
				value_b += button_name;
				display_numbers.text = value_a + " " + operator + " " + value_b;
				
			print(button_name);

func _equal() -> void:
	var result: int;
	
	if operator != "":
		match operator:
			"/":
				@warning_ignore("integer_division")
				result = int_value_a / int_value_b;
			"*":
				result = int_value_a * int_value_b;
			"-":
				result = int_value_a - int_value_b;
			"+":
				result = int_value_a + int_value_b;
	
	# Math the values ​​with the operator
	var math:int = result;
	
	# Show in display the value
	display_numbers.text = str(math);

func clear() -> void:
	# Reset Values
	value_a = "";
	value_b = "";
	
	# Reset Operator
	operator = "";
	
	# Reset Index
	i_value_a = 0;
	
	# Reset Display
	display_numbers.text = "0";
