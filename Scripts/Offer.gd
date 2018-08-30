extends Area2D

func _process(delta):
	if scale.x <= 20:
		scale.x += delta * 10
		scale.y += delta * 10
		modulate.a -= delta / 1.4
	
	if scale.x > 20:
		position = Vector2(-500, -500)
		scale.x = 1
		scale.y = 1
