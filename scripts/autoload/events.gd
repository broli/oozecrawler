extends Node

#slime events
signal slime_merged(tier: int, score: int)
signal slime_dropped(tier: int)

#progression and dungeon events
signal boss_defeated(dungeon_level: int)
signal level_finished(level_passed: bool)

#achievement events
signal achievement_earned(achievement_name: String)

#scoring events
signal score_milestone_reached(milestone_number: int)
