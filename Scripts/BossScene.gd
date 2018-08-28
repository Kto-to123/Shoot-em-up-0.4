extends Node
onready var Global = get_node("/root/Global")

#var Start = false

func _ready():
	Global.BossTime = 0
	Global.BossLVL = true
	

#func _process(delta):
#	if $player.transform.x < 500 && !Start:
#		$player.transform.x += delta




func _on_Timer_timeout():
	Global.BossLVL = false
