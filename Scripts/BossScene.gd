extends Node
onready var Global = get_node("/root/Global")


func _ready():
	Global.BossTime = 0
	Global.BossLVL = true


func _on_Timer_timeout():
	Global.BossLVL = false