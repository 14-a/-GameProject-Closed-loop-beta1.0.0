extends Node3D

var a = 0
var b = true
var c = 0

@export var mesh_instance_1: MeshInstance3D 
@export var player : Node

func _ready() -> void:$MeshInstance3D/Label3D.visible = false

func _process(delta: float) -> void:
	if c == 0:
		var D = (player.position - mesh_instance_1.position).length()
		if is_any_vertex_in_frustum(mesh_instance_1) and D < 3.5:a += 1
		else :a = 0
		if a > 200 and a < 500:$MeshInstance3D/Label3D.visible = true
		if a > 500:c = 1
	else: $MeshInstance3D/Label3D.visible = false
	pass

func is_any_vertex_in_frustum(mi: MeshInstance3D) -> bool:
	var cam = get_viewport().get_camera_3d()
	var mesh = mi.mesh
	if cam == null or mesh == null:return false
	
	var arrays = mesh.surface_get_arrays(0)
	if arrays == null or arrays[Mesh.ARRAY_VERTEX] == null:return false
	
	var verts = arrays[Mesh.ARRAY_VERTEX]
	var gt = mi.global_transform
	for v in verts:if cam.is_position_in_frustum(gt * v):return true
	return false


func _on_area_3d_d() -> void:$Node3D2.position.x = 100

func _on_area_3d_d_1() -> void:$Node3D2.position.x = -0.979
