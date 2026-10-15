extends Node2D

# References to child nodes
@onready var dropper: Node2D = $Dropper
@onready var queue_display: Control = $HUD/NextSlimePanel/QueueDisplay
@onready var score_value_label: Label = $HUD/ScorePanel/ScoreValueLabel
@onready var container: GameContainer = $Container

var level_stats: LevelStats
var queue_manager: QueueManager

func _ready() -> void:
	# Dynamically read beaker boundaries from its collision shapes
	var bounds: Vector2 = container.get_drop_bounds()
	dropper.min_x = bounds.x
	dropper.max_x = bounds.y
	
	# Set dropper height right above the flask opening
	dropper.global_position.y = container.get_opening_y() - 150.0
	
	queue_manager = QueueManager.new()
	level_stats = LevelStats.new()
		
	# Give the dropper its first slime
	dropper.set_current_slime_tier(self.queue_manager.get_next())
	queue_display.update_queue([queue_manager.peek(0), queue_manager.peek(1), queue_manager.peek(2), queue_manager.peek(3)] as Array[int])

	
	#listen for slime drop
	Events.slime_dropped.connect(_on_slime_dropped)
	
	#listen for merge event
	Events.slime_merged.connect(_on_slime_merged)
	
func _on_slime_merged(tier: int, earned_score: int) -> void:
	level_stats.add_score(earned_score)
	level_stats.add_merge(tier)
	score_value_label.text = str(level_stats.score)
	
func _on_slime_dropped(_tier: int) -> void:
	level_stats.add_slime_dropped()
	dropper.set_current_slime_tier(self.queue_manager.get_next())
	queue_display.update_queue([queue_manager.peek(0), queue_manager.peek(1), queue_manager.peek(2), queue_manager.peek(3)] as Array[int])