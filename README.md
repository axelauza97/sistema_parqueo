# sistema_parqueo
Descripción de la propuesta
Diseñar un sistema de control para parkings que permita gestionar el ingreso y la salida de vehículos, así como la disponibilidad de espacios en parkings de alta demanda, para lo cual se usará como lenguajes de nivel medio y alto a ensamblador y C respectivamente. [1]
Justificación 
En ocasiones, en zonas de concurrencia masiva, suele ser casi imposible identificar un espacio disponible para parquear el automóvil, lo que conlleva a una pérdida de tiempo y frustración para el chofer mientras realiza su búsqueda. 
Las medidas adoptadas en muchas ciudades metropolitanas consisten en promover el uso de transporte colectivo para mitigar el impacto del sobre congestionamiento vehicular, no obstante reducir el flujo de tráfico de vehículos particulares en el centro de las ciudades es inevitable debido al crecimiento de la población y el parque automotor. [2]
Descripción del funcionamiento y el alcance
Alcance
El programa solo permite al usuario consultar la disponibilidad de parqueos en el aparcamiento, ingresar un nuevo vehículo en el aparcamiento y remover un vehículo que se encuentra en el aparcamiento.
Se ha contemplado el uso de arreglos para representar la estructura de almacenamiento de cada vehículo en una posición del arreglo, de manera que se pueda recoger un determinado número de espacios en la memoria cargada al registro, cada vez que necesite consulta, ingresar o remover un vehículo desde el parqueo. Para lo cual se tomará como referencia los códigos propuestos como ejemplo en [3].
COD: FIN001
Actor	Usuario (Conductor)
Funcionalidad	Consultar parqueos ocupados
Trigger(Disparador)	Validar disponibilidad en el aparcamiento
Pre-Condición	Dado que el usuario seleccionó la opción 1 del menú
Postcondición	Una vez terminado el flujo normal de la funcionalidad habiendo mostrado la cantidad de espacios disponibles para parqueo, el programa retorna a la vista del menú principal
Flujo normal	1.	El usuario espera validación sobre disponibilidad.
2.	El sistema muestra al usuario el número del parqueo junto al número de matrícula del vehículo que ocupa un cada espacio en el aparcamiento.
Flujo alternativo	1.	El usuario espera validación sobre disponibilidad.
2.	El sistema muestra al usuario el número “000000” en cada parqueo indicando que hay disponibilidad total y que no existe un vehículo registrado.
Excepciones	Ninguna
COD: 002FIN
Actor	Usuario (Conductor)
Funcionalidad	Solicitar ingreso de vehículo al aparcamiento
Trigger(Disparador)	Validar disponibilidad en el aparcamiento
Pre-Condición	Dado que el usuario seleccionó la opción 2 del menú
Postcondición	Una vez terminado el flujo normal de la funcionalidad considerando que haya o no disponibilidad y que el usuario ingresó correctamente el número de matrícula, entonces el programa retorna al menú original.
Flujo normal	3.	El usuario ingresa el número de matrícula del vehículo, considerando que solo deben ser 6 caracteres.
4.	El usuario espera validación sobre disponibilidad.
5.	El usuario recibe retroalimentación del lugar en memoria donde fue asignado su vehículo para permanecer en el aparcamiento hasta que sea retirado.
Flujo alternativo	1.	El usuario ingresa el número de matrícula del vehículo, considerando que solo deben ser 6 caracteres.
2.	El usuario espera validación sobre disponibilidad.
3.	De no existir disponibilidad el usuario ve un mensaje indicando que no hay disponibilidad o espacio suficiente para parquear su vehículo.
Excepciones	1.	Si el usuario ingresa un número de matrícula con una cantidad de dígitos inferior a 6 y mayor a 0, es considerado como número válido.
2.	Si el usuario ingresa un número de matrícula con una cantidad de dígitos superior a 6, el programa se cierra por invalides.

COD: 003FRE
Actor	Usuario (Conductor)
Funcionalidad	Solicitar remover vehículo al aparcamiento
Trigger(Disparador)	Validar que el vehículo se encuentra en el aparcamiento con el número de matrícula
Pre-Condición	Dado que el usuario seleccionó la opción 3 del menú y que se asume su vehículo está registrado en el aparcamiento
Postcondición	Una vez terminado el flujo normal de la funcionalidad considerando que el vehículo está registrado en el aparcamiento y que corresponde al número de matrícula ingresad, entonces el programa libera el espacio donde se encontraba registrado dicho vehículo.
Flujo normal	1.	El usuario ingresa el número de matrícula del vehículo, considerando que solo deben ser 6 caracteres.
2.	El usuario espera validación de que el vehículo se encuentra registrado en el aparcamiento.
3.	El sistema libera el espacio donde estaba registrado el vehículo.
Flujo alternativo	1.	El usuario ingresa el número de matrícula del vehículo, considerando que solo deben ser 6 caracteres.
2.	El usuario espera validación de que el vehículo se encuentra registrado en el aparcamiento.
3.	Si el sistema no encuentra ninguna coincidencia con el vehículo entonces indica que no está registrado o que ya fue retirado previamente.
Excepciones	1.	Si el usuario ingresa un número de matrícula con una cantidad de dígitos inferior a 6 y mayor a 0, es considerado como número válido.
2.	Si el usuario ingresa un número de matrícula con una cantidad de dígitos superior a 6, el programa se cierra por invalides.
