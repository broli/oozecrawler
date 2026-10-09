extends Control

var upcoming_tiers: Array[int] = []

# Called by Main whenever the queue changes
func update_queue(queue: Array[int]) -> void:
	upcoming_tiers = queue.duplicate()
	upcoming_tiers.reverse()
	queue_redraw() # Requests Godot to call _draw()

func _draw() -> void:
	# 1. Draw the immediate "Next" slime (index 0)
	if upcoming_tiers.size() > 0:
		var next_tier := upcoming_tiers[0]
		Slime.draw_visual(self, Vector2(0, 20), next_tier)
	
	# 2. Draw "Next+1" (index 1) further down
	if upcoming_tiers.size() > 1:
		var second_tier := upcoming_tiers[1]
		Slime.draw_visual(self, Vector2(0, 90), second_tier)
