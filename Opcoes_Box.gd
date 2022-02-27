extends VBoxContainer

var botaoGatilhoJornada
var botaoSairDoJogo
var botaoInicio = true
var botaoSairFocus = true
var botaoJornadaFocus = true
var pararSom = false

signal botaoSair
signal botaoJornada

func _process(_delta):
	if ($BotaoContinuarJornada.disabled == true):
		if (botaoInicio == true):
			$BotaoIniciarJornada["custom_styles/normal"].border_color = Color("#dda216")
			$BotaoIniciarJornada["custom_styles/normal"].border_width_left = 1.0
			$BotaoIniciarJornada["custom_styles/normal"].border_width_top = 1.0
			$BotaoIniciarJornada["custom_styles/normal"].border_width_bottom = 1.0
			$BotaoIniciarJornada["custom_styles/normal"].border_width_right = 1.0
		if (Input.is_key_pressed(KEY_ENTER) or Input.is_key_pressed(KEY_SPACE)):
			$Confirmar.play()
			$Movimento_Cursor.stream_paused = true
			yield($Tempo_Iniciar_Jornada, "timeout")
			$Confirmar.stream_paused = true
			emit_signal("botaoJornada")
			pararSom = true
		if (pararSom == true && Input.is_key_pressed(KEY_DOWN)):
			$BotaoIniciarJornada["custom_styles/normal"].border_color = Color("#dda216")
			$BotaoIniciarJornada["custom_styles/normal"].border_width_left = 1.0
			$BotaoIniciarJornada["custom_styles/normal"].border_width_top = 1.0
			$BotaoIniciarJornada["custom_styles/normal"].border_width_bottom = 1.0
			$BotaoIniciarJornada["custom_styles/normal"].border_width_right = 1.0
		elif (Input.is_key_pressed(KEY_UP)):
			$Movimento_Cursor.play()
		if (Input.is_key_pressed(KEY_DOWN) && pararSom == false):
			if (botaoSairFocus == true):
				botaoInicio = false
				$Movimento_Cursor.play()
				$BotaoIniciarJornada["custom_styles/normal"].border_color = Color("")
				$BotaoIniciarJornada["custom_styles/normal"].border_width_left = 0
				$BotaoIniciarJornada["custom_styles/normal"].border_width_top = 0
				$BotaoIniciarJornada["custom_styles/normal"].border_width_bottom = 0
				$BotaoIniciarJornada["custom_styles/normal"].border_width_right = 0
				$BotaoSair["custom_styles/normal"].border_color = Color("#dda216")
				$BotaoSair["custom_styles/normal"].border_width_left = 1.0
				$BotaoSair["custom_styles/normal"].border_width_top = 1.0
				$BotaoSair["custom_styles/normal"].border_width_bottom = 1.0
				$BotaoSair["custom_styles/normal"].border_width_right = 1.0
				botaoSairDoJogo = true
				botaoGatilhoJornada = true
		if (botaoSairDoJogo == true):
			if (Input.is_key_pressed(KEY_ENTER) or Input.is_key_pressed(KEY_SPACE)):
				emit_signal("botaoSair")
			elif (Input.is_key_pressed(KEY_UP) && pararSom == false):
				if (botaoJornadaFocus == true):
					botaoSairFocus = false
					$Movimento_Cursor.play()
					$BotaoIniciarJornada["custom_styles/normal"].border_color = Color("#dda216")
					$BotaoIniciarJornada["custom_styles/normal"].border_width_left = 1.0
					$BotaoIniciarJornada["custom_styles/normal"].border_width_top = 1.0
					$BotaoIniciarJornada["custom_styles/normal"].border_width_bottom = 1.0
					$BotaoIniciarJornada["custom_styles/normal"].border_width_right = 1.0
					$BotaoSair["custom_styles/normal"].border_color = Color("")
					$BotaoSair["custom_styles/normal"].border_width_left = 0
					$BotaoSair["custom_styles/normal"].border_width_top = 0
					$BotaoSair["custom_styles/normal"].border_width_bottom = 0
					$BotaoSair["custom_styles/normal"].border_width_right = 0
					botaoSairDoJogo = false
					botaoGatilhoJornada = true
		if (botaoGatilhoJornada == true):
			if(Input.is_key_pressed(KEY_ENTER) or Input.is_key_pressed(KEY_SPACE)):
				pararSom = true
				$Confirmar.play()
				$Movimento_Cursor.stream_paused = true
				yield($Tempo_Iniciar_Jornada, "timeout")
				$Confirmar.stream_paused = true
				emit_signal("botaoJornada")
			elif (Input.is_key_pressed(KEY_UP)):
				$Movimento_Cursor.play()
			else:
				botaoSairFocus = true
