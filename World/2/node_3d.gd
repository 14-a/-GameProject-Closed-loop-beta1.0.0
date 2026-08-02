extends Node3D

var a = 2.9

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"门框/MeshInstance3D".visible = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$MeshInstance3D3.position.z += 0.1 * (a - $MeshInstance3D3.position.z)
	pass


func _on_area_3d_g() -> void:
	$"门框/MeshInstance3D".visible = false ; $"门框/MeshInstance3D2".visible = true ; a = 4.9
	pass # Replace with function body.
