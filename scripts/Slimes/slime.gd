extends RigidBody2D

class_name Slime

#dont have a clue where to put this
signal merged (tier_created: int, score_earned: int)

#tier handling
@export var tier: int = 1
#blocks multi merging
var is_merging:= false

#pop
@export var xpop_intensity_min := -30.0
@export var xpop_intensity_max := 30.0

@export var ypop_intensity_min := -30.0
@export var ypop_intensity_max := -90.0

#spin me baby
@export var angular_velocity_min := -2.0
@export var angular_velocity_max := 2.0

const TIER_DATA: Dictionary = {
	1: {"radius": 16.0, "color": Color(0.4, 0.9, 0.3, 0.85), "score": 10, "mass": 1.0},
	2: {"radius": 22.0, "color": Color(0.2, 0.8, 0.9, 0.85), "score": 20, "mass": 1.8},
	3: {"radius": 28.0, "color": Color(0.95, 0.85, 0.2, 0.85), "score": 40, "mass": 2.8},
	4: {"radius": 36.0, "color": Color(0.95, 0.5, 0.1, 0.85), "score": 80, "mass": 4.2},
	5: {"radius": 46.0, "color": Color(0.85, 0.2, 0.6, 0.85), "score": 160, "mass": 6.0},
	6: {"radius": 58.0, "color": Color(0.6, 0.2, 0.85, 0.85), "score": 320, "mass": 8.5},
	7: {"radius": 72.0, "color": Color(0.85, 0.15, 0.2, 0.85), "score": 640, "mass": 11.5},
	8: {"radius": 88.0, "color": Color(0.25, 0.25, 0.3, 0.85), "score": 1280, "mass": 15.0},
	9: {"radius": 102.0, "color": Color(0.1, 0.3, 0.85, 0.85), "score": 2560, "mass": 19.5},
	10: {"radius": 116.0, "color": Color(0.1, 0.75, 0.5, 0.85), "score": 5120, "mass": 25.0},
	11: {"radius": 130.0, "color": Color(1.0, 0.84, 0.0, 0.9), "score": 10240, "mass": 32.0},
}

# Static drawing helper callable from outside. not instance related, but class static
static func draw_visual(canvas: CanvasItem, center: Vector2, target_tier: int) -> void:
	if not TIER_DATA.has(target_tier):
		return
	
	var data: Dictionary = TIER_DATA[target_tier]
	var radius: float = data["radius"]
	var color: Color = data["color"]
	
	# Draw body centered on param vector, with tier data
	canvas.draw_circle(center, radius, color)
	
	# Draw eye / details
	var eye_offset := center + Vector2(radius * 0.35, -radius * 0.2)
	canvas.draw_circle(eye_offset, radius * 0.2, Color(1, 1, 1, 0.9))
	canvas.draw_circle(eye_offset, radius * 0.1, Color(0, 0, 0, 0.9))

func _draw() -> void:
	Slime.draw_visual(self, Vector2.ZERO, tier)
	
func _ready() -> void:
	apply_tier_properties()
	#rng jesus spins
	self.angular_velocity = randf_range(angular_velocity_min,angular_velocity_max)
	# Connect the collision signal
	body_entered.connect(_on_body_entered)
	
func apply_tier_properties() -> void:
	if not TIER_DATA.has(tier):
		return
	
	var data: Dictionary = TIER_DATA[tier]
	
	# Update collision radius
	var col_shape := $CollisionShape2D.shape as CircleShape2D
	if col_shape:
		# Duplicate shape so changing this slime doesn't alter other slimes
		col_shape = col_shape.duplicate()
		col_shape.radius = data["radius"]
		$CollisionShape2D.shape = col_shape
		
	#change to new mass
	self.mass = data["mass"]
	
	# Request redraw with new color and radius
	queue_redraw()
	
func _on_body_entered(other_body: Node) -> void:
	# Ignore non-slimes or already merging slimes
	#if not other_body is Slime or is_merging or other_body.is_merging:
	#	return
	if other_body is not Slime:
		return
	
	var other_slime := other_body as Slime
	
	if is_merging or other_slime.is_merging:
		return
	
	# Only merge if tiers match and this isn't the max tier
	if other_slime.tier != tier or tier >= TIER_DATA.size():
		return
	
	# Arbitrate race condition: only one slime handles the merge
	if get_instance_id() < other_slime.get_instance_id():
		return
	
	# Lock both bodies
	is_merging = true
	other_slime.is_merging = true
	
	# Perform merge
	call_deferred("_merge_with", other_slime)
	
func _merge_with(other: Slime) -> void:
	var next_tier := tier + 1
	var spawn_pos := (global_position + other.global_position) / 2.0
	
	# Instantiate higher tier slime
	var slime_scene: PackedScene = load(self.scene_file_path)
	var new_slime: Slime = slime_scene.instantiate()
	new_slime.tier = next_tier
	new_slime.global_position = spawn_pos
	var rng_pop := Vector2(
		randf_range( #x random force. 
			xpop_intensity_min,
			xpop_intensity_max
			),
		randf_range( #y random, upwards always force
			ypop_intensity_min,
			ypop_intensity_max
			) * self.mass
		)#closing vector2
	
	
	# Add to scene
	get_parent().add_child(new_slime)
	new_slime.apply_central_impulse(rng_pop)
	
	# Remove old slimes
	other.queue_free()
	queue_free()
