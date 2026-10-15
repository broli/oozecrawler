extends Node

#slime events
@warning_ignore("unused_signal")
signal slime_merged(tier: int, score: int)
@warning_ignore("unused_signal")
signal slime_dropped(tier: int)

#progression and dungeon events
@warning_ignore("unused_signal")
signal boss_defeated(dungeon_level: int)
@warning_ignore("unused_signal")
signal level_finished(level_passed: bool)

#achievement events
@warning_ignore("unused_signal")
signal achievement_earned(achievement_name: String)

#scoring events
@warning_ignore("unused_signal")
signal score_milestone_reached(milestone_number: int)
