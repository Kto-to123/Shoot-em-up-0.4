extends ParallaxBackground

var Speed = 2
var Size = 762

func _physics_process(delta):
	$TextureRect.rect_position.y += Speed
	$TextureRect2.rect_position.y += Speed
	
	if $TextureRect.rect_position.y > Size:
		$TextureRect.rect_position.y = -Size
	
	if $TextureRect2.rect_position.y > Size:
		$TextureRect2.rect_position.y = -Size
