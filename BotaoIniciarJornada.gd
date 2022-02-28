extends Button

#func _process(delta):
#	if (Input.is_key_pressed(KEY_ENTER) or Input.is_key_pressed(KEY_SPACE)):
#		get_tree().change_scene("res://Introdução/Transicao.tscn")

# Pressionar botão do teclado
func _botaoJornada():
	# Próxima Cena - Introdução/Inicio do Jogo
	yield(get_tree().create_timer(2.15), "timeout")
	get_tree().change_scene("res://Introdução/Transicao.tscn")
	yield(get_tree().create_timer(0.30), "timeout")


func _BotaoIniciarJornada_pressionar():
	if (Input.is_mouse_button_pressed(BUTTON_LEFT)):
		$Confirmar.play()
		yield(get_tree().create_timer(0.15), "timeout")
		get_tree().change_scene("res://Introdução/Transicao.tscn")
