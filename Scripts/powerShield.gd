extends Area2D
onready var Global = get_node("/root/Global")

const MOVE_SPEED = 100

func _process(delta):
	var which = get_name()

	if position.y > get_viewport_rect().size.y + 20:
		queue_free()
	position.y += MOVE_SPEED * delta


func _on_PowerShield_area_entered(area):
	if area.is_in_group("Player"):
		Global.Shield = Global.Shield + 1
		queue_free()
