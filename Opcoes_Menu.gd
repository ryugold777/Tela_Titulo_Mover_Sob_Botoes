extends VBoxContainer

var botao_gatilho_Jornada
var botao_sair_do_Jogo
var botao_inicio = true
var botao_sair_focus = true
var botao_jornada_focus = true
var parar_som = false

#signal iniciar_jornada 

func _process(_delta):
	if ($Continuar_Jornada.disabled == true):
		if (botao_inicio == true):
			$Botao_Iniciar_Jornada["custom_styles/normal"].border_color = Color("#dda216")
			$Botao_Iniciar_Jornada["custom_styles/normal"].border_width_left = 1.0
			$Botao_Iniciar_Jornada["custom_styles/normal"].border_width_top = 1.0
			$Botao_Iniciar_Jornada["custom_styles/normal"].border_width_bottom = 1.0
			$Botao_Iniciar_Jornada["custom_styles/normal"].border_width_right = 1.0
		if (Input.is_action_just_pressed("confirmar")):
			$Confirmar.play()
			$Movimento_Cursor.stream_paused = true
			$Confirmar.stream_paused = true
			emit_signal("")
			parar_som = true
		if (parar_som == true && Input.is_key_pressed(KEY_DOWN)):
			$Botao_Iniciar_Jornada["custom_styles/normal"].border_color = Color("#dda216")
			$Botao_Iniciar_Jornada["custom_styles/normal"].border_width_left = 1.0
			$Botao_Iniciar_Jornada["custom_styles/normal"].border_width_top = 1.0
			$Botao_Iniciar_Jornada["custom_styles/normal"].border_width_bottom = 1.0
			$Botao_Iniciar_Jornada["custom_styles/normal"].border_width_right = 1.0
		elif (Input.is_key_pressed(KEY_UP)):
			$Movimento_Cursor.play()
		if (Input.is_key_pressed(KEY_DOWN) && parar_som == false):
			if (botao_sair_focus == true):
				botao_inicio = false
				$Movimento_Cursor.play()
				$Botao_Iniciar_Jornada["custom_styles/normal"].border_color = Color("")
				$Botao_Iniciar_Jornada["custom_styles/normal"].border_width_left = 0
				$Botao_Iniciar_Jornada["custom_styles/normal"].border_width_top = 0
				$Botao_Iniciar_Jornada["custom_styles/normal"].border_width_bottom = 0
				$Botao_Iniciar_Jornada["custom_styles/normal"].border_width_right = 0
				$Sair_Do_Jogo["custom_styles/normal"].border_color = Color("#dda216")
				$Sair_Do_Jogo["custom_styles/normal"].border_width_left = 1.0
				$Sair_Do_Jogo["custom_styles/normal"].border_width_top = 1.0
				$Sair_Do_Jogo["custom_styles/normal"].border_width_bottom = 1.0
				$Sair_Do_Jogo["custom_styles/normal"].border_width_right = 1.0
				botao_sair_do_Jogo = true
				botao_gatilho_Jornada = true
		if (botao_sair_do_Jogo == true):
			if (Input.is_action_just_pressed("confirmar")):
				get_tree().quit()
			elif (Input.is_key_pressed(KEY_UP) && parar_som == false):
				if (botao_jornada_focus == true):
					botao_sair_focus = false
					$Movimento_Cursor.play()
					$Botao_Iniciar_Jornada["custom_styles/normal"].border_color = Color("#dda216")
					$Botao_Iniciar_Jornada["custom_styles/normal"].border_width_left = 1.0
					$Botao_Iniciar_Jornada["custom_styles/normal"].border_width_top = 1.0
					$Botao_Iniciar_Jornada["custom_styles/normal"].border_width_bottom = 1.0
					$Botao_Iniciar_Jornada["custom_styles/normal"].border_width_right = 1.0
					$Sair_Do_Jogo["custom_styles/normal"].border_color = Color("")
					$Sair_Do_Jogo["custom_styles/normal"].border_width_left = 0
					$Sair_Do_Jogo["custom_styles/normal"].border_width_top = 0
					$Sair_Do_Jogo["custom_styles/normal"].border_width_bottom = 0
					$Sair_Do_Jogo["custom_styles/normal"].border_width_right = 0
					botao_sair_do_Jogo = false
					botao_gatilho_Jornada = true
		if (botao_gatilho_Jornada == true):
			if(Input.is_action_just_pressed("confirmar")):
				parar_som = true
				$Confirmar.play()
				$Movimento_Cursor.stream_paused = true
				yield($Iniciar_Jornada, "timeout")
				$Confirmar.stream_paused = true
				emit_signal("botaoJornada")
			elif (Input.is_key_pressed(KEY_UP)):
				$Movimento_Cursor.play()
			else:
				botao_sair_focus = true
