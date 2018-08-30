extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if Global.Shield > 0 && Global.Live > 0:
		$Shield.position = $player.position
	
	if Global.Live <= 0:
		$player.position = Vector2(-100, -100)
	
	if Global.Shield <= 0:
		$Shield.position = Vector2(-100, -100)


func _on_SpawnTimer_timeout():
	$player.position = Vector2(539, 518)
