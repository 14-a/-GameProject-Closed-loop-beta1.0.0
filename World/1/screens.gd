extends Node3D

@export var player : Node

var c = 0
var a = 0

func _ready() -> void:$Label3D.visible = false

func _process(delta: float) -> void:
	if c == 0:
		var D = (player.position - position).length()
		if D < 3:
			$Label3D.visible = true
			a += 1
		if a > 300:
			c = 1
			$Label3D.visible = false
	pass
