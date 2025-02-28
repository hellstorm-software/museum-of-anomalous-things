extends ScrollContainer

@export var joypad_deadzone: float = 0.05
@export var scroll_speed: float = 500.0
@export var joystick_axis: int = JOY_AXIS_RIGHT_Y

var enabled = false

func _ready():
  if not Util.is_xr():
    enabled = true

func _process(delta: float) -> void:
  if not enabled:
    return

  var joy_input = Input.get_joy_axis(0, joystick_axis)

  if abs(joy_input) < joypad_deadzone:
    return

  scroll_vertical = round(scroll_vertical + joy_input * scroll_speed * delta)
  scroll_vertical = clamp(scroll_vertical, 0.0, get_v_scroll_bar().max_value)
