# Resultados de aprendizaje y criterios de evaluación

- **RA1** Reconoce los elementos y herramientas que intervienen en el desarrollo de un programa informático, analizando sus características y las fases en las que actúan hasta llegar a su puesta en funcionamiento.
  - **CE1a** Se ha reconocido la relación de los programas con los componentes del sistema informático: memoria, procesador y periféricos, entre otros.

# El ordenador: una máquina programable

Es bien conocido que el ordenador se compone de dos partes bien diferenciadas: **software** y **hardware**.

> Se da por sentado que se conoce la diferencia entre software y hardware.

En este módulo nos vamos a centrar en la parte del software, al final estás cursando un ciclo de programación, pero no podemos obviar el hardware en tanto que lo que vas a aprender a programar es una máquina, es el hardware. Así, voy a empezar por explicarte qué es un ordenador, a nivel de hardware, y lo voy a hacer entrando en la arquitectura de los ordenadores actuales.

# Arquitectura von Neumann

Una arquitectura de ordenador es un modelo y una descripción del funcionamiento del mismo. Especial es el papel que juega en esta descripción la forma en la que la Unidad Central de Proceso (CPU, del inglés Central Processing Unit) trabaja internamente y accede a las direcciones de memoria.

La arquiectura von Neumman es una arquitectura de ordenador basada en la descrita en 1945 por el matemático y físico John von Neumann. Esta arquitectura describe un ordenador con tres partes: unidad de procesamiento, memoria principal y unidad de entrada/salida:

![Arquitectura von Neumann](./img/von_neumann.png)

En los siguientes apartados detallamos cada una de estas partes de la arquitectura.

## Unidad de procesamiento

Conocida como **CPU** (Centra Procesing Unit), procesador o microprocesador, se encarga de todas las operaciones y el control del ordenador. Es la CPU lo que, en última instancia, estamos programando.

En la CPU encontramos una **Unidad Aritmético Lógica** (ALU), una serie de **registros** y una **Unidad de Control** que te describo brevemente en los siguientes subapartados.

### Registros de la CPU

La CPU cuenta con una serie de **registros** que forman la memoria más rápida de la jerarquía de memoria de un ordenador. Se encuentran dentro de la CPU, y se usan para almacenar operandos y resultados de las operaciones que hace la CPU. Los registros se miden por el número de bits que almacenan, por ejemplo: un registro de 8 bits, o un registros de 32 bits, o un registro de 64 bits. Dependiendo de la arquitectura se tienen más o menos registros de más o menos bits.

> Investiga: ¿qué tamaño tienen los registros de las CPU actuales?, ¿cuántos registro tiene un microprocesador actual?, ¿de qué orden de magnitod es más rápido un registro con respecto a la memoria principal?

> En [esta web](https://wiki.osdev.org/CPU_Registers_x86-64) puedes ver los registros disponibles en las arquitecturas `x86_64` de 64 bits.

> Si quieres entrar en los detalles físicos lo puedes hacer en [esta otra web](http://www.righto.com/2020/07/the-intel-8086-processors-registers.html). La visita a esta web es muy recomendable si quieres ver fotos reales de la circuitería dentro de una CPU (en este caso el *micro* **Intel 8086**).

### Unidad Aritmético Lógica (ALU)

Una **Unidad Aritmético Lógica**, o **ALU** del inglés *Arithmetic Logic Unit*, es un circuito digital que realiza operaciones aritméticas (sumas, restas) y operaciones lógicas (IF, AND, OR, NOT, XOR) entre los valores de los argumentos (que pueden ser uno o dos, según el caso). Se representa, gráficamente, tal que así:

![ALU](./img/alu_simbolo.png)

> Si sientes curiosidad puedes visitar este sitio web donde encontrarás [detalles de cómo funciona una ALU](https://hardzone.es/reportajes/que-es/alu/).

Los datos sobre los que opera son tomandos de los registros de la CPU. Los resultados son guardados, también, en registros de la CPU.

Además, la ALU tiene una serie de registros especiales llamados **FLAGS** donde se indican situaciones que se han podido dar al operar, como **overflow**.

### Unidad de Control

La **Unidad de Control** es la encargada de enviar señales al resto de componentes para que todas las partes estén sincronizadas, para lo cual usa un reloj que emite *ticks* a una frecuencia dada. Se comporta como los semáforos que regulan el tráfico en los cruces dejando actuar a unos y deteniendo a otros. Además, esta Unidad de Control usa una serie de registros especiales como son: un ***registro de instrucciones** (o RI) donde se almacena la instrucción que se está ejecutando y un **contador de programa** (o PC) donde se almacena la dirección de la memoria donde está la instrucción que se está ejecutando.

![Unidad de Control](./img/unidad_control.png)

> La lectura y visualización de las imágenes de [esta web](http://www.righto.com/2020/06/a-look-at-die-of-8086-processor.html) te pueden resultar interesantes.

## Memoria principal

Esta es la memoria del ordenador que nosotros solemos conocer coloquialmente como "memoria RAM". En esta memoria se almacenan los programas, es decir, todas las instrucciones de todos los programas que se están ejecutando en un ordenador, más los datos.

> No confundas memoria principal con memoria secundaria. La memoria principal forma parte de la aquitectura y es una memoria muy rápida. La memoria secundaria es un dispositivo como un disco duro, un disco sólido, un dispositivo de almacenamiento USB, un DVD, etc. Esta memoria secundaria es un periférico y es donde tenemos almacenados los datos y programas instalados.

> Se presupone que conoces la diferencia entre memoria principal y secundaria. Si no es así deberías [leer este artículo](https://www.geeksforgeeks.org/difference-between-primary-and-secondary-memory/).

En la siguiente imagen tienes representada una memoria con estas características:

- **Arquitectura de 8 bits**: registros de la CPU de 8 bits y filas de la memoria RAM de 8 bits (cada una de las celdas es un bit).

> En la práctica, las arquitecturas de 8 bits de los inicios de la computación tenían buses de 16 bits y, por tanto, cada fila de la memoria tenía 16 bits. Por simplificar, nosotros vamos a considerar que tenemos memorias con filas de 8 bits.

- Las direcciones que se indican son de la fila, pero cada fila tiene 8 bits. Por otro lado, las direcciones se indican en hexadecimal, no en decimal.
- Se trata, pues, de una **memoria de 256 bytes**, es decir, hay **2 048 bits** o celdas.

![Representación de una memoria de 256 bytes](./img/memoria_256bytes.png)

## Unidad de Entrada/Salida

La **unidad de entrada/salida**, o simplemente unidad de E/S, es el mecanismo que permite conectar al ordenador todo tipo de periféricos para ampliar las opciones de un ordenador. Por ejemplo, una impresora, un ratón o un teclado es conectado a este mecanismo.

**Tradicionalmente** han existido dos *chips* encargados del acceso al exterior, a periféricos. De alguna manera, la CPU deleta en estos dos chips la comunicación con otros componentes o periféricos:

- **North Bridge**: responsable de tareas de alto rendimiento como son la conexión a la memoria RAM, a la GPU (tarjeta gráfica) o los buses PCIe.

- **South Bridge**: conecta periféricos como pueden ser todos aquellos conectados a puertos USB, RJ-45 (red), Bluetooth, etc.

**Actualmente**, gran parte de toda esta circuitería está integrada y dentro de la misma CPU. En concreto, la CPU, hoy en día, está conectada directamente a la GPU o la memoria RAM. El resto se conecta a través de un único *chip* llamado **PCH** (*Platform Controller Hub*) o simplemente **chipset**.
