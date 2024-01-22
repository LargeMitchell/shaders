extends Node2D

@export var shader_value : float = 0.0

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func _ready():
	var tween : Tween = create_tween()
	tween.tween_property(self, "shader_value", 1.0, 4.0).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_ELASTIC)
	
func _process(delta):
	RenderingServer.global_shader_parameter_set("monochrome_intensity", shader_value)
