extends Node2D

#signals up
signal slime_dropped

#Preloads ?
const SLIME_SCENE = preload("res://scenes/slimes/slime.tscn")

# Minimum and maximum X boundaries (inside the container walls)
@export var min_x: float = 460.0
@export var max_x: float = 820.0

#exporting to gui dashing line
@export var dash_lenght: float = 12.0
@export var aimguide_color: Color = Color(0.008, 0.093, 0.428, 0.898)

#also exporting firing rate
@export var drop_cooldown: float = 0.5

#internal vars
var can_drop: bool = true
var current_slime_tier: int = 0

func _process(_delta: float) -> void:
	var mouse_x: float = get_global_mouse_position().x
	# Clamp the dropper's X position between the vial walls
	global_position.x = clampf(mouse_x, min_x, max_x)

func _draw() -> void:
	#aim lines have to be dashed gorsh dan it
	draw_dashed_line(Vector2.ZERO,Vector2(0,540),aimguide_color, 2.0, dash_lenght)
	
	#we need to show the current slime under the hat
	Slime.draw_visual(self,Vector2(0.0,60.0),current_slime_tier)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		if can_drop:
			drop_slime()
			
func drop_slime() -> void:
	can_drop = false
	
	var slime = SLIME_SCENE.instantiate()
	slime.tier = current_slime_tier
	slime.global_position = global_position
	
	get_parent().add_child(slime)
	slime_dropped.emit()
	
	await get_tree().create_timer(drop_cooldown).timeout
	can_drop = true

func set_current_slime_tier(new_tier: int) -> void:
	current_slime_tier = new_tier
	queue_redraw()
