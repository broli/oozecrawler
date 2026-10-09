extends Node2D

# References to child nodes
@onready var dropper: Node2D = $Dropper
@onready var queue_display: Control = $HUD/NextSlimePanel/QueueDisplay

#var drop_queue: Array[int] = []
#const QUEUE_SIZE: int = 5 # Keep a buffer of 5 upcoming slimes

var bingo_cage: Array[int]

func _ready() -> void:
	# Seed the queue initially
	#for i in range(QUEUE_SIZE):
		#drop_queue.append(get_random_drop_tier())
	#load first bingo cage
	load_bingo_cage()
		
	# Give the dropper its first slime
	send_slime_to_dropper()
	
	#listen for slime drop
	dropper.slime_dropped.connect(send_slime_to_dropper)

func load_bingo_cage() -> void:
	bingo_cage = [1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,3,3,3,4,4,5]
	bingo_cage.shuffle()

func pull_next_ball() -> int:
	if bingo_cage.is_empty():
		load_bingo_cage()
	
	#pull
	var next_ball = bingo_cage.pop_back()
	#update hud
	queue_display.update_queue(bingo_cage)
	#return
	return next_ball
	
		
func send_slime_to_dropper() -> void:
	dropper.set_current_slime_tier(self.pull_next_ball())

#func get_random_drop_tier() -> int:
	## Suika weights: mostly Tier 1 & 2, rare Tier 3
	#var roll := randf()
	#if roll < 0.65:
		#return 1
	#elif roll < 0.90:
		#return 2
	#elif roll < 0.98:
		#return 3
	#else:
		#return 4
		
#func prepare_next_drop() -> void:
	## Pop the next tier for the dropper
	#var current_tier: int = drop_queue.pop_front()
	#
	## Replenish queue at the back
	#drop_queue.append(get_random_drop_tier())
	#
	## Tell dropper what tier to hold
	#dropper.set_current_slime_tier(current_tier)
	
	#update HUD
	#queue_display.update_queue(bingo_cage)
	#print("Current drop: ", current_tier, " | Upcoming: ", drop_queue)
