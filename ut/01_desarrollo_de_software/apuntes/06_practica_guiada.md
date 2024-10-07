# Resultados de aprendizaje y criterios de evaluación

- **RA1** Reconoce los elementos y herramientas que intervienen en el desarrollo de un programa informático, analizando sus características y las fases en las que actúan hasta llegar a su puesta en funcionamiento.
  - **CE1c** Se han diferenciado los conceptos de código fuente, código objeto y código ejecutable.
  - **CE1f** Se ha evaluado la funcionalidad ofrecida por las herramientas utilizadas en programación.

# Práctica guiada: lenguajes compilados e intérpretados, generación de código

En esta práctica guiada vamos a trabajar con un programa escrito en C y su equivalente en Python que leen un fichero en formato JSON. Al final de esta práctica guiada deberás ser capaz de:

- Compilar un programa
- Ejecutar el intérprete de un programa
- Entender diferencias entre compilación e interpretación
- Verificar tiempos de ejecución
- Generar código ensamblador
- Desensamblar código objeto y máquina
- Observar direcciones de memoria donde se carga el código

# Recursos

Para llevar a cabo los pasos que se indican aquí tienes que descargar todos estos ficheros **dentro de la misma carpeta**:

- [Programa escrito en C](./practica_guiada_compiladores_interpretes/main.c)
- [El mismo programa escrito en Python](./practica_guiada_compiladores_interpretes/main.py)
- [Este fichero JSON usado por los programas anteriores](./practica_guiada_compiladores_interpretes/data.json)

# Paso 1: lenguajes compilados

Compilar el programa en C escrito en `main.c` con el compilador **GCC**.

```shell
$ gcc -o main main.c
```

Tras compilar verás un fichero ejecutable llamado `main` que es el que tienes que ejecutar:

```shell
$ ./main
```

Ahora, calcula el tiempo que ha tardado en ejecutarse (usando el programa/comando de la terminal `time`):

```shell
$ time ./main
```

Apúntate el tiempo para compararlo en el paso 2.

# Paso 2: lenguajes interpretados

Para ejecutar el programa en Python no necesitas compilar nada. Básicamente, lo que tienes que hacer es lanzar dicho programa con el intérprete de Python:

```shell
$ python main.py
```

Ya ves cómo se ejecuta el intérprete de Python llamado `python` pasándole como argumento el fichero con el código fuente en Python.

Calcula el tiempo de ejecución y compáralo con el caso anterior en C:

```shell
$ time python main.py
```

# Paso 3: código fuente

Abre los ficheros `main.c` y `main.py`. Compara el código fuente, analízalo y pregúntate qué código es más fácil de entender.

# Paso 4: código ensamblador, código objeto y código máquina/ejecutable

Cuando compilas un programa se llevan a cabo varios pasos hasta terminar generando el código final ejecutable. Podemos indicar al compilador que se detenga en el paso que queramos y ver el código generado hasta dicho paso.

Vamos a usar esas opciones para obtener el código ensamblador y objeto del programa escrito en C.

Para obtener el código ensamblador:

```shell
$ gcc -S main.c -o main.s
```

Este comando generará un nuevo fichero llamado `main.s` con el código en ensamblador. Ábrelo y échale un vistazo.

Para obtener el código objeto:

```shell
$ gcc -c main.c -o main.o
```

Esto genera un fichero objeto (binario) que no puede ser ejecutado, llamado `main.o`. Vamos a intentar ejecutar este fichero objeto. Necesitamos dar permisos de ejecución a dicho fichero y ejecutarlo:

```shell
$ chmod u+x main.o
$ ./main.o
bash: ./main.o: no se puede ejecutar fichero binario: Formato de ejecutable incorrecto
```

En la terminal podrás ver un error similar al que te muestro arriba.

Lo que sí podemos hacer es "observar" el código objeto con una herramienta que se llama `objdump` y que tienes muchas opciones. Podemos "observar" el código máquina a través de un proceso denominado **desensamblado** y es lo que hace `objdump`. En el siguiente comando la opción `-d` desensambla el fichero objeto:

```shell
$ objdump -d main.o
```

> Puedes usar la herramienta objdump para desensamblar código objeto y también código máquina, es decir, ficheros objetos y ficheros ejecutables.

# Paso 5: (extra) ir más allá con el depurador de código GDB

Más adelante estudiaremos cómo usar el depurador (una de las herramientas más utilizadas por un programador). Aquí, vamos a usarlo para ver dónde carga el SO el programa escrito en C una vez lo ejecutemos.

Primero vamos a volver a compilar el programa en C pero esta vez añadiendo información al ejecutable para que le depurador pueda hacer su trabajo (opción `-g` de GCC):

```shell
$ gcc main.c -o main -g3
```

Ahora sí, ya puedes lanzar el depurador sobre el ejecutable (el depurador ejecutará el ejecutable y hará un seguimiento del mismo además de controla dicha ejecución):

```shell
$ gdb main
```

Verás que estás en un nuevo *prompt*:

```shell
GNU gdb (GDB) 15.1
Copyright (C) 2024 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "x86_64-pc-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<https://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.

For help, type "help".
Type "apropos word" to search for commands related to "word".
(gdb)
```

El depurador está esperando órdenes. Puedes poner un punto de parada a la entrada del programa y ejecutarlo:

```shell
(gdb) b main
(gdb) r
```

Ya puedes, por ejemplo, ver el mapeado del programa en memoria con esta orden desde el depurador:

```shell
(gdb) info proc mappings
```

Verás algo así:

```shell
process 488717
Mapped address spaces:

          Start Addr           End Addr       Size     Offset  Perms  objfile
      0x555555554000     0x555555555000     0x1000        0x0  r--p   /home/roman/Documentos/trabajo/2024-2025/eed/ut/01_desarrollo_de_software/oculto/practicas/02_laboratorio_compiladores_interpretes/main
      0x555555555000     0x555555556000     0x1000     0x1000  r-xp   /home/roman/Documentos/trabajo/2024-2025/eed/ut/01_desarrollo_de_software/oculto/practicas/02_laboratorio_compiladores_interpretes/main
      0x555555556000     0x555555557000     0x1000     0x2000  r--p   /home/roman/Documentos/trabajo/2024-2025/eed/ut/01_desarrollo_de_software/oculto/practicas/02_laboratorio_compiladores_interpretes/main
      0x555555557000     0x555555558000     0x1000     0x2000  r--p   /home/roman/Documentos/trabajo/2024-2025/eed/ut/01_desarrollo_de_software/oculto/practicas/02_laboratorio_compiladores_interpretes/main
      0x555555558000     0x555555559000     0x1000     0x3000  rw-p   /home/roman/Documentos/trabajo/2024-2025/eed/ut/01_desarrollo_de_software/oculto/practicas/02_laboratorio_compiladores_interpretes/main
      0x7ffff7da9000     0x7ffff7dac000     0x3000        0x0  rw-p
      0x7ffff7dac000     0x7ffff7dd0000    0x24000        0x0  r--p   /usr/lib/libc.so.6
      0x7ffff7dd0000     0x7ffff7f41000   0x171000    0x24000  r-xp   /usr/lib/libc.so.6
      0x7ffff7f41000     0x7ffff7f8f000    0x4e000   0x195000  r--p   /usr/lib/libc.so.6
      0x7ffff7f8f000     0x7ffff7f93000     0x4000   0x1e3000  r--p   /usr/lib/libc.so.6
      0x7ffff7f93000     0x7ffff7f95000     0x2000   0x1e7000  rw-p   /usr/lib/libc.so.6
      0x7ffff7f95000     0x7ffff7f9f000     0xa000        0x0  rw-p
      0x7ffff7fc1000     0x7ffff7fc5000     0x4000        0x0  r--p   [vvar]
      0x7ffff7fc5000     0x7ffff7fc7000     0x2000        0x0  r-xp   [vdso]
      0x7ffff7fc7000     0x7ffff7fc8000     0x1000        0x0  r--p   /usr/lib/ld-linux-x86-64.so.2
      0x7ffff7fc8000     0x7ffff7ff1000    0x29000     0x1000  r-xp   /usr/lib/ld-linux-x86-64.so.2
      0x7ffff7ff1000     0x7ffff7ffb000     0xa000    0x2a000  r--p   /usr/lib/ld-linux-x86-64.so.2
      0x7ffff7ffb000     0x7ffff7ffd000     0x2000    0x34000  r--p   /usr/lib/ld-linux-x86-64.so.2
      0x7ffff7ffd000     0x7ffff7fff000     0x2000    0x36000  rw-p   /usr/lib/ld-linux-x86-64.so.2
      0x7ffffffde000     0x7ffffffff000    0x21000        0x0  rw-p   [stack]
  0xffffffffff600000 0xffffffffff601000     0x1000        0x0  --xp   [vsyscall]
(gdb)
```

Trata de interpretar la salida aunque en clase la analizaremos.

Otras opciones de GDB útiles para inspeccionar la memoria del programa en ejecución:

- `disassemble`
- `x/i` para ver código en una dirección específica
- `x/10i` para ver 10 bytes de código desde una dirección específica
- `x/10x` o `x/10i` para ver contenido de memoria en diferentes formatos
- `info address` ver la dirección de una función o símbolo
