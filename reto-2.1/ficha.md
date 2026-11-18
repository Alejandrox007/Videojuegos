# Ficha del dispositivo: Teclado

- **Dispositivo elegido:** Teclado
- **Tecnología de captura:** Matriz de interruptores (mecánicos o de membrana) dispuestos en filas y columnas; al presionar una tecla se cierra un circuito en esa intersección y un microcontrolador escanea la matriz para enviar el código de tecla al sistema operativo ([Keyboard technology — Wikipedia](https://en.wikipedia.org/wiki/Keyboard_technology)).
- **Tipo de señal:** **Digital**, porque cada tecla solo transmite dos estados discretos posibles (pulsada o suelta, `1` o `0`) sin valores intermedios de presión en un teclado estándar.
- **Ventaja:** Alta precisión y respuesta inmediata para acciones discretas y combinaciones rápidas de teclas.
- **Limitación:** No ofrece entrada analógica gradual (como la inclinación parcial de una palanca) y en teclados económicos sin diodos puede producirse *ghosting* al presionar varias teclas a la vez ([Keyboard matrix circuit — Wikipedia](https://en.wikipedia.org/wiki/Keyboard_matrix_circuit)).
- **Juego ejemplo:** *Celeste* (plataformas de precisión basado en pulsaciones digitales exactas para desplazarse y saltar).
- **Fuentes:**
  - [Keyboard technology — Wikipedia](https://en.wikipedia.org/wiki/Keyboard_technology)
  - [Input — Godot Engine Documentation](https://docs.godotengine.org/en/stable/classes/class_input.html)
