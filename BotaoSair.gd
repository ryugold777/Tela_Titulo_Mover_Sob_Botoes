extends Button

# Pressionar botão do teclado
func _botaoSair():
	# Sai do Jogo
	get_tree().quit()

func _BotaoSair_pressionar():
	# Apertar com o botão do Mouse
	if (Input.is_mouse_button_pressed(BUTTON_LEFT)):
		get_tree().quit()
