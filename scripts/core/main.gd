extends Node2D

# References to child nodes
@onready var dropper: Node2D = $Dropper
@onready var queue_display: Control = $HUD/NextSlimePanel/QueueDisplay
@onready var score_value_label: Label = $HUD/ScorePanel/ScoreValueLabel
@onready var container: GameContainer = $Container

var score := 0
var queue_manager: QueueManager

func _ready() -> void:
	# Dynamically read beaker boundaries from its collision shapes
	var bounds: Vector2 = container.get_drop_bounds()
	dropper.min_x = bounds.x
	dropper.max_x = bounds.y
	
	# Set dropper height right above the flask opening
	dropper.global_position.y = container.get_opening_y() - 150.0
	
	queue_manager = QueueManager.new()
		
	# Give the dropper its first slime
	dropper.set_current_slime_tier(self.queue_manager.get_next())
	queue_display.update_queue([queue_manager.peek(0), queue_manager.peek(1), queue_manager.peek(2), queue_manager.peek(3)] as Array[int])

	
	#listen for slime drop
	Events.slime_dropped.connect(send_slime_to_dropper)
	
	#listen for merge event
	Events.slime_merged.connect(_on_slime_merged)
	
func _on_slime_merged(_tier: int, earned_score: int) -> void:
	score += earned_score
	score_value_label.text = str(score)
	
func send_slime_to_dropper(_tier: int) -> void:
	dropper.set_current_slime_tier(self.queue_manager.get_next())
	queue_display.update_queue([queue_manager.peek(0), queue_manager.peek(1), queue_manager.peek(2), queue_manager.peek(3)] as Array[int])