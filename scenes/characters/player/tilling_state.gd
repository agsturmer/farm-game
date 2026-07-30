extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D

func on_process(_delta : float):
	pass


func on_physics_process(_delta : float):
	pass


func _on_next_transitions():
	
	if !animated_sprite_2d.is_playing():
		transition.emit("idle")
	


func on_enter():
	
	if player.player_direction == Vector2.UP:
		animated_sprite_2d.play("tilling_back")
	elif player.player_direction == Vector2.RIGHT:
		animated_sprite_2d.play("tilling_right")
	elif player.player_direction == Vector2.DOWN:
		animated_sprite_2d.play("tilling_front")
	elif player.player_direction == Vector2.LEFT:
		animated_sprite_2d.play("tilling_left")
	else:
		animated_sprite_2d.play("tilling_front")


func on_exit():
	animated_sprite_2d.stop()
