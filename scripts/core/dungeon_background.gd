extends Node2D

# Surface colors (inviting fantasy dungeon palette)
const COLOR_CEILING = Color("#2c2b3d") # Slate violet
const COLOR_FLOOR = Color("#3e334d")   # Stone purple
const COLOR_WALL_L = Color("#4b435c")  # Left wall shadow
const COLOR_WALL_R = Color("#5a5070")  # Right wall light
const COLOR_BACK = Color("#1e1a29")    # Deep corridor darkness
const COLOR_MORTAR = Color("#181422")  # Stone mortar joints

# Inner doorway percentages (0.0 to 1.0)
const INNER_MIN = Vector2(0.32, 0.25)
const INNER_MAX = Vector2(0.68, 0.75)

func _draw() -> void:
	var screen_size: Vector2 = get_viewport_rect().size

	# 1. Outer screen corners
	var tl = Vector2.ZERO
	var tr = Vector2(screen_size.x, 0)
	var bl = Vector2(0, screen_size.y)
	var br = screen_size

	# 2. Inner doorway corners
	var itl = Vector2(INNER_MIN.x, INNER_MIN.y) * screen_size
	var itr = Vector2(INNER_MAX.x, INNER_MIN.y) * screen_size
	var ibl = Vector2(INNER_MIN.x, INNER_MAX.y) * screen_size
	var ibr = Vector2(INNER_MAX.x, INNER_MAX.y) * screen_size

	# 3. Base surface polygons
	draw_polygon(PackedVector2Array([tl, tr, itr, itl]), [COLOR_CEILING])
	draw_polygon(PackedVector2Array([ibl, ibr, br, bl]), [COLOR_FLOOR])
	draw_polygon(PackedVector2Array([tl, itl, ibl, bl]), [COLOR_WALL_L])
	draw_polygon(PackedVector2Array([itr, tr, br, ibr]), [COLOR_WALL_R])
	draw_polygon(PackedVector2Array([itl, itr, ibr, ibl]), [COLOR_BACK])

	# 4. Depth rings (horizontal mortar lines for ceiling and floor)
	var depths = [0.4, 0.7]
	for d in depths:
		var ring_tl = tl.lerp(itl, d)
		var ring_tr = tr.lerp(itr, d)
		var ring_bl = bl.lerp(ibl, d)
		var ring_br = br.lerp(ibr, d)

		draw_line(ring_tl, ring_tr, COLOR_MORTAR, 2.0) # Ceiling
		draw_line(ring_bl, ring_br, COLOR_MORTAR, 2.0) # Floor

	# 5. Corner seam lines (outer to inner doorway)
	draw_line(tl, itl, COLOR_MORTAR, 3.0)
	draw_line(tr, itr, COLOR_MORTAR, 3.0)
	draw_line(bl, ibl, COLOR_MORTAR, 3.0)
	draw_line(br, ibr, COLOR_MORTAR, 3.0)

	# 6. Horizontal stone rows on left and right walls
	var wall_row_heights = [0.33, 0.66]
	for h in wall_row_heights:
		var left_start = tl.lerp(bl, h)
		var left_end = itl.lerp(ibl, h)
		draw_line(left_start, left_end, COLOR_MORTAR, 2.0)

		var right_start = tr.lerp(br, h)
		var right_end = itr.lerp(ibr, h)
		draw_line(right_start, right_end, COLOR_MORTAR, 2.0)

	# 7. Staggered vertical seams (subway / Roman block pattern)
	var rows = [
		{"top": 0.0,  "bot": 0.33, "depths": [0.4, 0.7]},
		{"top": 0.33, "bot": 0.66, "depths": [0.20, 0.55, 0.85]},
		{"top": 0.66, "bot": 1.0,  "depths": [0.4, 0.7]}
	]
	for row in rows:
		for d in row.depths:
			draw_wall_joint(d, row.top, row.bot, screen_size)


# Helper: bilinear interpolation to find any 2D point on left or right wall
func get_wall_point(is_left: bool, d: float, h: float, screen_size: Vector2) -> Vector2:
	var tl = Vector2.ZERO
	var tr = Vector2(screen_size.x, 0)
	var bl = Vector2(0, screen_size.y)
	var br = screen_size

	var itl = Vector2(INNER_MIN.x, INNER_MIN.y) * screen_size
	var itr = Vector2(INNER_MAX.x, INNER_MIN.y) * screen_size
	var ibl = Vector2(INNER_MIN.x, INNER_MAX.y) * screen_size
	var ibr = Vector2(INNER_MAX.x, INNER_MAX.y) * screen_size

	if is_left:
		var top_at_depth = tl.lerp(itl, d)
		var bottom_at_depth = bl.lerp(ibl, d)
		return top_at_depth.lerp(bottom_at_depth, h)
	else:
		var top_at_depth = tr.lerp(itr, d)
		var bottom_at_depth = br.lerp(ibr, d)
		return top_at_depth.lerp(bottom_at_depth, h)


# Helper: draws matching vertical joints on both left and right walls
func draw_wall_joint(d: float, h_top: float, h_bot: float, screen_size: Vector2) -> void:
	for is_left in [true, false]:
		var p_top = get_wall_point(is_left, d, h_top, screen_size)
		var p_bot = get_wall_point(is_left, d, h_bot, screen_size)
		draw_line(p_top, p_bot, COLOR_MORTAR, 2.0)
