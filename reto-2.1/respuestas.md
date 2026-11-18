# Respuestas — Reto 2.1: Panel de controles dentro del juego

1. **Mantén `D` dos segundos y suéltala: ¿qué contador subió más y por qué?**  
   Subió mucho más el contador de **cuadros con la acción pulsada** (sondeo en `_process`). Esto ocurre porque `_process(delta)` se ejecuta en cada fotograma mientras `Input.is_action_pressed("move_right")` siga siendo verdadero (aproximadamente 60 veces por segundo, unos 120 cuadros en 2 segundos), mientras que `_input(event)` solo registra **1 evento** de pulsación (`is_action_pressed`) al presionar la tecla, ya que el eco del teclado (`event.echo`) se ignora.

2. **Mantén `A`: ¿qué valor muestran `get_axis` y `get_action_strength("move_right")`, y por qué difieren?**  
   `Input.get_axis("move_left", "move_right")` muestra **`-1.00`** y `Input.get_action_strength("move_right")` muestra **`0.00`**. Difieren porque `get_axis` combina dos acciones opuestas restando la negativa (`move_left` = 1.0) de la positiva (`move_right` = 0.0), dando `-1.00`, mientras que `get_action_strength("move_right")` mide únicamente la intensidad de la acción derecha, que al no estar pulsada vale `0.00`.

3. **Gira la rueda del ratón: ¿qué clase de evento aparece y por qué su rama va antes que la del clic?**  
   Aparece la clase **`InputEventMouseButton`**. Su rama `if` va antes que la del clic porque tanto los botones de clic del ratón como los giros de la rueda (`MOUSE_BUTTON_WHEEL_UP`, `MOUSE_BUTTON_WHEEL_DOWN`, etc.) pertenecen a la misma clase `InputEventMouseButton`; si la rama general del clic estuviera primero, capturaría también los eventos de la rueda y nunca se ejecutaría la rama específica de la rueda.
