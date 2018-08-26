extends Area2D
export var ball_dir = 1

onready var Global = get_node('/root/Global')
const MOVE_SPEED = 200

func _process(delta):
	var which = get_name()
	
	position.x += cos((rotation_degrees + 90) * PI / 180) * (MOVE_SPEED * delta)
	position.y += sin((rotation_degrees + 90) * PI / 180) * (MOVE_SPEED * delta)


	if !get_viewport_rect().has_point(position):
		queue_free()

func _on_bullet_area_entered(area):
	if area.is_in_group("Shield"):
		Global.Shield -= 1
		queue_free()
	
	if area.is_in_group("Player"):
		Global.Live -= 1
		queue_free()
#s;fdddddddddddddddddddddddddddddddddddddd