class LevelStats extends RefCounted:
    var score: int
    var slime_dropped: int
    var total_merges: int
    var hp_left: int
    var merges_per_tier: Dictionary

    func _init():
        reset()

    func reset():
        score = 0
        slime_dropped = 0
        total_merges = 0
        hp_left = 0
        merges_per_tier = {}

    func add_score(amount: int):
        score += amount

    func add_slime_dropped():
        slime_dropped += 1

    func add_merge(tier: int):
        total_merges += 1
        if not merges_per_tier.has(tier):
            merges_per_tier[tier] = 0
        merges_per_tier[tier] += 1

    func set_hp_left(amount: int):
        hp_left = amount

    func to_dict() -> Dictionary:
        return {
            "score": score,
            "slime_dropped": slime_dropped,
            "total_merges": total_merges,
            "hp_left": hp_left,
            "merges_per_tier": merges_per_tier
        }
