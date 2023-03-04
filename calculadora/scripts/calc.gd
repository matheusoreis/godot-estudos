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
			_change_operator("/")
		"times":
			_change_operator("*")
		"subtraction":
			_change_operator("-")
		"addition":
			_change_operator("+")
		"c":
			_clear();
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

func _clear() -> void:
	# Reset Values
	value_a = "";
	value_b = "";
	
	# Reset Operator
	operator = "";
	
	# Reset Index
	i_value_a = 0;
	
	# Reset Display
	display_numbers.text = "0";

func _change_operator(operator_func) -> void:
	if value_a == "" and operator != "":
		return
				
	operator = operator_func;
	i_value_a = 2;
