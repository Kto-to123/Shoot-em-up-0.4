extends Area2D

onready var Global = get_node("/root/Global")

func _process(delta):
	if Global.Shield == 1:
		$AnimatedSprite.frame = 0
	
	if Global.Shield == 2:
		$AnimatedSprite.frame = 1
	
	if Global.Shield >= 3:
		$AnimatedSprite.frame = 2
