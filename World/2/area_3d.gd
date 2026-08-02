extends Area3D

signal Control_Desk_Terminal
signal Lavea_Control_Desk_Terminal
signal g

@export var a : Node

func _ready() -> void:pass

func _process(delta: float) -> void:
	var overlapping_bodies = get_overlapping_bodies()
	for body in overlapping_bodies:handle_body_inside(body)

func handle_body_inside(body: Node3D):
	if body.name == "player" : 
		emit_signal("Control_Desk_Terminal")
		if Input.is_action_just_pressed("e"):
			var file = FileAccess.open("res://World/2/Text.txt", FileAccess.READ)
			if file == null:return 
			var content = file.get_as_text();file.close()
			var lines = content.split("\n")
	
			var b = 0
			
			print(lines[0])
		
			#while not b == 8:
			#	if Input.is_action_just_released("e"): b += 1
			#	a.text = lines[b]
			emit_signal("g")
		
	else:
		emit_signal("Lavea_Control_Desk_Terminal")
