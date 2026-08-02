extends Area3D

var door = 0

signal d_2
signal d1_2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# 获取当前所有与区域重叠的物理体[citation:3]
	var overlapping_bodies = get_overlapping_bodies()
	for body in overlapping_bodies:
		# 对每一个在区域内的物体执行持续操作
		handle_body_inside(body)
	
	if door == 0:
		emit_signal("d1_2")
	else:
		emit_signal("d_2")

func handle_body_inside(body: Node3D):
	if body.name == "player":
		if Input.is_action_just_pressed("e"):
			door = 1 - door
