extends CharacterBody3D

const SPEED = 8.0
const JUMP_VELOCITY = 4.5

@export var Sensitivity = 0.1

@export var a : Node

@onready var head = $Node3D

var move = 1
var event = 0

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$Control/Label.visible = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_y(deg_to_rad(-event.relative.x * Sensitivity))
		head.rotate_x(deg_to_rad(-event.relative.y * Sensitivity))
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-89),deg_to_rad(89))
	
	if Input.is_action_just_pressed("esc"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else :Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta: float) -> void:
	if not is_on_floor(): velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor(): velocity.y = JUMP_VELOCITY
	
	var input_dir := Input.get_vector("a", "d", "w", "s")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	if move == 1:move_and_slide()
	
	if Input.is_action_pressed("C"): $Node3D/Camera3D.fov = 50
	else : $Node3D/Camera3D.fov = 100

func _on_area_3d_body_entered(body: Node3D) -> void:    $Control/Label.text = "被锁上";  $Control/Label.visible = true
func _on_area_3d_body_exited(body: Node3D) -> void:     $Control/Label.text = "被锁上";  $Control/Label.visible = false
func _OpenDoor(body: Node3D) -> void:                   $Control/Label.text = "[e]打开"; $Control/Label.visible = true
func _OpenDoor_1(body: Node3D) -> void:                 $Control/Label.text = "[e]打开"; $Control/Label.visible = false
func _on_area_3d_control_desk_terminal() -> void:       $Control/Label.text = "[e]交互"; $Control/Label.visible = true;
func _on_area_3d_lavea_control_desk_terminal() -> void: $Control/Label.text = "[e]交互"; $Control/Label.visible = false
