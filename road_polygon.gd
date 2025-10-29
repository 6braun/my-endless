# SkyPolygon.gd — attach to a Polygon2D that’s a child of your Parallax2D “Sky” layer
extends Polygon2D
@export var height := 220.0
func _ready():
	self.color = color
	_resize()
	get_viewport().size_changed.connect(_resize)

func _resize():
	var sz = get_viewport().get_visible_rect().size
	var y0 = sz.y - height
	polygon = PackedVector2Array([
		Vector2(0, y0), Vector2(sz.x, y0),
		Vector2(sz.x, sz.y), Vector2(0, sz.y)
	])
	
