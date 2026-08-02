extends Area3D

signal a

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var overlapping_bodies = get_overlapping_bodies()
	for body in overlapping_bodies:
		handle_body_inside(body)

func handle_body_inside(body: Node3D):
	if body.name == "player":
		if Input.is_action_just_pressed("e"):
			emit_signal("a")
	pass
