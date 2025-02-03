# Resultados de aprendizaje y criterios de evaluación

- **RA2** Evalúa entornos integrados de desarrollo, analizando, sus características para editar código fuente y generar ejecutables
  - **CE2a**. Se han instalado entornos de desarrollo, propietarios y libres
  - **CE2b**. Se han añadido y eliminado módulos en el entorno de desarrollo
  - **CE2g**. Se han identificado las características comunes y específicas de diversos entornos de desarrollo
  
# Entornos de desarrollo. Introducción

Un entorno de desarrollo, en general, es un **espacio de trabajo** que permite a los desarrolladores de software crear una aplicación o realizar cambios sobre la misma.

Este espacio de trabajo consta, al menos, de:

- Un ordenador
- Un sistema operativo
- Un editor de código
- Un compilador o intérprete
- Bibliotecas de software
- Un depurador

Además, hoy en día, es habitual encontrar y muy importante usar otros elementos como son:

- Un servidor de lenguaje (LSP - *Language Server Protocol*): que permite mejorar la experiencia de desarrollo ya que ofrecen características como son el autocompletado de código, la refactorización, navegación entre símbolos, resaltado de sintaxis y marcar código con errores y *warnings*

- Un linter: que es una herramienta más sencilla que un LSP ya que "solo" ofrece información de errores de sintaxis, uso de variables no declaradas, funciones no definidas y errores de estilo.

- Formateadores de código o de estilo de código: son herramientas que, únicamente, se encargan de formatear e indentar el código de acuerdo a unas normas de estilo.

Los **IDE** (*Integrated Development Environment*) son un software compuesto por todos estos elementos: editor de código, compilador/intérprete, depurador, LSP, linter y formateadores de código. De ahí su nombre: entorno de desarrollo integrado.

En esta introducción vamos a ver cómo construir un entorno total desde un simple editor de textos/código.

## Vi

### Los modos de Vi

El editor Vi tiene dos modos de operación:

- **Modo de comandos**: donde podemos desplazarnos dentro de un fichero y realizar operaciones de edición como buscar, eliminar y modificar texto, entre otras cosas. Cada vez que abras Vi te encontrarás en este modo.

- **Modo insertar**: donde podemos escribir texto.

### Cambios entre modos

Para pasar del modo comandos al modo insertar tienes que usar uno de los comandos que permite insertar texto (ver más abajo).

Para pasar del modo insertar al modo comandos hay que pulsar la tecla escape (`ESC` a partir de ahora).

### Comandos más comunes

**Para desplazarse por el fichero (en modo comando)**

- Abajo: `j`
- Arriba: `k`
- Izquierda: `h`
- Derecha: `l`
- Moverse palabra a palabra hacia adelante: `w`
- Moverse palabra a palabra hacia atrás: `b`
- Moverse frase a frase hacia adelante: `(`
- Moverse frase a frase hacia atrás: `)`
- Moverse párrafo a párrafo hacia adelante: `{`
- Moverse párrafo a párrafo hacia atrás: `}`
- Página arriba: `Ctrl+U` o `PgUp`
- Página abajo: `Ctrl+D` o `PgDn`
- Ir a una línea: `25gg` (iría a la línea 25)
- Ir a final de la línea: `$`
- Ir al principio de la línea: `0`
- Para ir al inicio del fichero: `gg`
- Para ir al final del fichero: `G`

**Editar y modificar**

- Para insertar texto antes del cursor: `i`
- Para insertar texto después del cursor: `a`
- Para insertar texto al principio de la línea: `I`
- Para insertar texto al final de la línea: `A`
- Para insertar debajo de la línea: `o`
- Para insertar arriba de la línea: `O`

**Copiar y pegar**

- Para copiar la línea actual: `yy`
- Para copiar una palabra: `yw`
- Para pegar después del cursor: `p`
- Para pegar antes del cursor: `P`

**Borrar**

- Para borrar un carácter: `x` o `X`
- Para borrar una palabra: `dw` (en realidad borra desde el cursor hasta el final de la palabra)
- Para borrar la línea actual: `dd`

**Deshacer**

- Para deshacer el último cambio: `u`

**Abrir, guardar y salir**

- Para abrir un archivo: `:e <ruta al fichero>`
- Para salir si no hay cambios por guardar: `:q`
- Para guardar los cambios y salir: `:x` o `:wq`
- Para salir sin guardar (forzar la salida): `:q!`
- Para guardar con otro nombre de archivo (guardar como): `:w <ruta al nuevo fichero>`

**Números de línea**

- Mostrar números de línea: `:set number`
- Ocultar números de línea: `:set nonumber`

**Buscar**

- Para buscar texto: `/<texto>` donde `<texto>` es el texto que quieres buscar

Una vez escribes el texto que quieres buscar tienes que presionar `Intro` y, a partir de ahí, pulsa `n` para buscar siguiente ocurrencia y `N` para buscar ocurrencia anterior. De esta manera navegas entre los resultados de la búsqueda.

**Reemplazar**

Te lo explico con un ejemplo. Imagina que quieres reemplazar "class main{" por "class Main {". Tienes que escribir el siguiente patrón:

`:%s/class main{/class Main {/g`

**Repetir comandos**

Puedes añadir un número delante de un comando para repetir dicho comando un número de veces. Algunos ejemplos:

- `y3y` copia 3 líneas desde la posición del cursor
- `d5w` elimina 5 palabras desde la posición del cursor
- `5j` se mueve 5 posiciones hacia adelante
- `10w` se mueve 10 palabras hacia adelante

### Más sobre Vi

Si quieres conocer todas las opciones/comandos de Vi puedes visitar el manual desde la terminal:

```shell
$ man vi
```

O puedes buscar en la Web. Verás la cantidad de tutoriales, vídeos y recursos que hay alrededor de Vi.
