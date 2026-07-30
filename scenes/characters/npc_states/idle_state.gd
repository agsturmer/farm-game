extends NodeState

@export var character: CharacterBody2D
@export var animated_sprite_2D: AnimatedSprite2D
@export var idle_state_time_interval: float = 5.0;

@onready var idle_state_timer: Timer = Timer.new()

var idle_state_timeout: bool = false

func _ready() -> void:
	idle_state_timer.wait_time = idle_state_time_interval
	idle_state_timer.timeout.connect(on_idle_state_timeout)
	add_child(idle_state_timer)
	
	
func on_process(_delta : float):
	pass


func on_physics_process(_delta : float):
	pass

func _on_next_transitions() -> void:
	if idle_state_timeout:
		transition.emit("walk")

func on_enter():
	animated_sprite_2D.play("idle")
	
	idle_state_timeout = false
	idle_state_timer.start()


func on_exit():
	animated_sprite_2D.stop()
	idle_state_timer.stop()
	
	
func on_idle_state_timeout() -> void:
	idle_state_timeout = true
