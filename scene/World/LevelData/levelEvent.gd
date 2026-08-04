extends Node3D

var EventList = preload("res://scene/World/EventList.tres")

@onready var DoorHand = $CSGBox3D4/CSGCylinder3D

var Data = {"DoorHandDirX" : 0, "DoorX": -0.879, "DoorXEnd": -0.879}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	DoorHand.rotation_degrees.y = -90
	DoorHand.rotation_degrees.z = 90
	Data["DoorHandDirX"] += (-90 - Data["DoorHandDirX"]) * .5  * delta
	DoorHand.rotation_degrees.x = Data["DoorHandDirX"]
	
	Data["DoorX"] += (Data["DoorXEnd"] - Data["DoorX"]) * .5  * delta
	$PlayerEvents/MeshInstance3D.position.x = Data["DoorX"]
	
	pass


func _on_player_event(type: Variant) -> void:
	if type == EventList.EventList[0]:
		var temp = ((randf() * 2) - 1) * 45 - 90
		Data["DoorHandDirX"] = temp
	
	if type == EventList.EventList[1]:
		$"LeveObject/门禁卡".visible = false
		EventList.TaskList[1] = "1"
	
	if type == EventList.EventList[2]:
		Data["DoorXEnd"] = -10
	pass # Replace with function body.
