extends Node3D

var DoorX = 9.053
var DoorX_ = 25.024
var DoorX__ = 44.958

@export var player : Node

signal _OpenDoor
signal _OpenDoor_1

var next_scene: PackedScene = preload("res://World/2/2.tscn")

func _ready() -> void: pass

func _process(delta: float) -> void:
	$MeshInstance3D.position.x += 0.1 * (DoorX - $MeshInstance3D.position.x)
	$"2/MeshInstance3D".position.x += 0.1 * (DoorX_ - $"2/MeshInstance3D".position.x)
	$"3/MeshInstance3D".position.x += 0.1 * (DoorX__ - $"3/MeshInstance3D".position.x)
	
	var D = ($"3/CSGBox3D".position - player.position).length()
	if D < 3 : 
		emit_signal("_OpenDoor", null)
		if Input.is_action_just_pressed("e"): get_tree().change_scene_to_packed(next_scene)
	else : 
		emit_signal("_OpenDoor_1", null)
	pass

func _on_area_3d_d() -> void: DoorX = 12
func _on_area_3d_d_1() -> void: DoorX = 9.053
func _on_area_3d_d_c() -> void: DoorX_ = 28
func _on_area_3d_d_1_c() -> void: DoorX_ = 25.024
func _on_area_3d_d_1_2() -> void: DoorX__ = 44.958
func _on_area_3d_d_2() -> void: DoorX__ = 47.958
