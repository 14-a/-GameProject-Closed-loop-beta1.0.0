extends Node

var next_scene: PackedScene = preload("res://World/1/world.tscn")

func _ready() -> void:pass

func _process(delta: float) -> void:pass


func _on_area_3d_a() -> void:get_tree().change_scene_to_packed(next_scene)
