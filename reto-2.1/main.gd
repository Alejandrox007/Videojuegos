extends Node2D

@onready var hud: Label = $Hud

var ultimo_evento_clase: String = "Ninguno"
var ultimo_dispositivo: String = "Ninguno"
var ultimo_tipo_senal: String = "Ninguno"

var frames_move_right: int = 0
var eventos_move_right: int = 0


func _input(event: InputEvent) -> void:
	# Ignorar el eco del teclado (R3)
	if event is InputEventKey and event.echo:
		return

	ultimo_evento_clase = event.get_class()

	if event is InputEventKey:
		ultimo_dispositivo = "Teclado (device %d)" % event.device
		ultimo_tipo_senal = "digital"
	elif event is InputEventMouseButton and (
		event.button_index == MOUSE_BUTTON_WHEEL_UP
		or event.button_index == MOUSE_BUTTON_WHEEL_DOWN
		or event.button_index == MOUSE_BUTTON_WHEEL_LEFT
		or event.button_index == MOUSE_BUTTON_WHEEL_RIGHT
	):
		ultimo_dispositivo = "Ratón - rueda (device %d)" % event.device
		ultimo_tipo_senal = "digital"
	elif event is InputEventMouseButton:
		ultimo_dispositivo = "Ratón - clic (device %d)" % event.device
		ultimo_tipo_senal = "digital"
	elif event is InputEventMouseMotion:
		ultimo_dispositivo = "Ratón - movimiento (device %d)" % event.device
		ultimo_tipo_senal = "posición"
	elif event is InputEventJoypadMotion:
		ultimo_dispositivo = "Mando - eje (device %d)" % event.device
		ultimo_tipo_senal = "analógica"
	elif event is InputEventJoypadButton:
		ultimo_dispositivo = "Mando - botón (device %d)" % event.device
		ultimo_tipo_senal = "digital"
	elif event is InputEventScreenTouch:
		ultimo_dispositivo = "Pantalla táctil (device %d)" % event.device
		ultimo_tipo_senal = "posición"
	else:
		ultimo_dispositivo = "Otro (device %d)" % event.device
		ultimo_tipo_senal = "desconocido"

	if event.is_action_pressed("move_right"):
		eventos_move_right += 1


func _process(_delta: float) -> void:
	if Input.is_action_pressed("move_right"):
		frames_move_right += 1

	var jump_estado: String = "verdadero" if Input.is_action_pressed("jump") else "falso"
	var axis_val: float = Input.get_axis("move_left", "move_right")
	var strength_right: float = Input.get_action_strength("move_right")

	hud.text = (
		"=== PANEL DE CONTROLES ===\n"
		+ "jump: %s\n" % jump_estado
		+ "get_axis: %.2f\n" % axis_val
		+ "get_action_strength(\"move_right\"): %.2f\n" % strength_right
		+ "--------------------------\n"
		+ "Último evento: %s\n" % ultimo_evento_clase
		+ "Dispositivo: %s\n" % ultimo_dispositivo
		+ "Tipo de señal: %s\n" % ultimo_tipo_senal
		+ "--------------------------\n"
		+ "move_right (cuadros pulsada): %d\n" % frames_move_right
		+ "move_right (eventos recibidos): %d" % eventos_move_right
	)
