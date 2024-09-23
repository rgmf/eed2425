# Resultados de aprendizaje y criterios de evaluación

- **RA1** Reconoce los elementos y herramientas que intervienen en el desarrollo de un programa informático, analizando sus características y las fases en las que actúan hasta llegar a su puesta en funcionamiento.
  - **CE1e** Se han clasificado los lenguajes de programación.

# Lenguajes de programación: evolución histórica

Los ordenadores usan un lenguaje al que llamamos **lenguaje máquina**.

Este lenguaje usa una codificación, es decir, un alfabeto, unos códigos, llamado **código binario**. Se llama código binario porque se emplean dos estados. En sus circuitos puede haber corriente o no, que nosotros representamos con `1` (hay corriente) y `0` (no hay corriente).

La unión de sus circuitos forman grupos de `1`s y `0`s, dando así lugar a "palabras" e instrucciones.

La programación ha ido variando con el tiempo y, en general, reconocemos tres generaciones de lenguajes que te explico en los siguientes apartados.

## Lenguaje máquina

Las primeros ordenadores se programaban conectando circuitos a mano, haciendo que el ordenador hiciera unas tareas u otras. Para cambiar de tarea, había que reprogramar los circuitos, lo cual era bastante tedioso y difícil. Además, si había errores estos eran muy difíciles de descubrir y "reparar".

Aquí, por ejemplo, te muestro la imagen de uno de los primeros ordenadores, el ENIAC, donde como ves está cableado directamente:

![ENIAC](./img/eniac.jpg)

Más tarde aparecen las tarjetas perforadas, y con ello lo que podríamos considerar como el primero lenguaje de programación llamado **lenguaje máquina**.

![Tarjeta perforada](./img/tarjeta_perforada.jpg)

En estas tarjetas se escribían instrucciones para la CPU a programar. Cada CPU tiene un conjunto de instrucciones. Si quieres programar en lenguaje máquina tienes que aprender a usar el juego de instrucciones de la CPU a programar, y no te servirá para otra CPU.

> En la película "Piratas de Silicon Valley" puedes ver una escena en la que aparecen Bill Gates y Paul Allen revisando un programa escrito por medio de tarjetas perforadas: [ver escena en Youtube](https://www.youtube.com/watch?v=gxNXPFIJsI4).

Por ejemplo, en las CPU de arquitectura MIPS todas las instrucciones son de 32 bits. Te muestro, a continuación, la instrucción que se usaría para cargar el valor que hay en la dirección de memoria 68 a partir de la 8ª celda al registro número 3:

```asm
100011 00011 01000 00000 00001 000100
```

Estos son los significados de los bits:

```asm
 100011    00011    01000    00000 00001 000100
|------|  |-----|  |-----|  |------------------|
   |        |        |              |
   |        |        |              +---- Dirección de memoria: 68 en decimal
   |        |        |
   |        |        +------------------- Número a partir del cual se busca en memoria: 8 en decimal
   |        |
   |        +---------------------------- Número de registro donde se carga el valor: 3 en decimal
   |
   +------------------------------------- Código de operación: 35 en decimal
```

Otro ejemplo, pero esta vez, más completo y para arquitectura *x86_64* sería el siguiente programa en el que se suman los números 10 y 14 para dejar el resultado en el registro `%eax` de la CPU:

```asm
10111000 00001110 00000000 00000000 00000000
10111011 00001010 00000000 00000000 00000000
00000001 11011000
```

En el ejemplo de arriba:

- Hay tres instrucciones
- La primera instrucción mueve el número 14 al registro %eax
- La segunda instrucción mueve el número 10 al registro %ebx
- La tercera y última instrucción suma el contenido de los registros %eax y %ebx dejando el resultado en el registro %eax

Antes de terminar, verás que los programas en lenguaje máquina se suelen representar en hexadecimal, y no en binario, porque es más fácil de entender y son mucho más cortos (piensa que un carácter en hexadecimal representa a 4 en binario, lo que quiere decir que son 4 veces más cortos). Por ejemplo, el programa anterior en hexadecimal quedaría tal que así:

```asm
B8 0E 00 00 00
BB 0A 00 00 00
01 D8
```

En cualquiercaso, hoy en día, nadie usa el lenguaje máquina para programar.

## Lenguaje ensamblador

Se trata de un lenguaje de bajo nivel, más sencillo de aprender y programar que el lenguaje máquina. Este lenguaje también es dependiente de la arquitectura de la CPU a programar, lo que significa que tienes que conocer el juego de instrucciones de la CPU a programar.

> Se llama juego de instrucciones al conjunto de todas las instrucciones que admite la CPU.

En este lenguaje se usan **mnemotécnicos** que representan las instrucciones del microprocesador.

Los programas escritos en lenguaje ensamblador tienen que ser traducidos a lenguaje máquina para que se puedan ejecutar ya que, como te dije anteriormente, los ordenadores solo "hablan" lenguaje máquina.

Al traductor que convierte lenguaje ensamblador a lenguaje máquina se llama ensamblador. Este traductor es un programa de sistema y, como imaginarás, el primer ensamblador tuve que ser escrito directamente en lenguaje máquina.

> Hoy en día tampoco se escriben programas en ensamblador salvo en casos muy concretos como: el bootloader de los sistemas operativos y otras partes del mismo que tienen que ver con la parte que arranca y carga el sistema operativo en la memoria.

Por ejemplo, en las CPU de arquitectura x86, para cargar el número 61 en hexadecimal (97 en decimal) al registro `AL` se haría de la siguiente manera en ensamblador:

```asm
MOV AL, 61h
```

Varias cosas a tener en cuenta:

- Se usan nombres de instrucciones como, en este caso, `MOV` para mover
- Se usan nombres para los registros de la CPU como, en este caso, `AL`
- Se usan números en decimal o hexadecimal que son más manejables y fáciles de trabajar para una persona (programador)

Una vez traducida esta instrucción a binario, lenguaje máquina, quedaría tal cual:

```asm
10110000 01100001
```

Estos bits tienen el siguiente significado:

```asm
1011   0000   01100001
  |     |         |
  |     |         |
  |     |         +------ Número 61 en hexadecimal o 97 en decimal
  |     |
  |     +---------------- Código para el registro AL (número 0 en decimal)
  |
  +---------------------- Código para la instrucción MOV (mover un valor a un registro)
```

Vemos como, una vez traducido a lenguaje máquina:

- La instrucción `MOV` es igual al código en binario `1011`
- El registro `AL` es el código `0000` binario (número 0 en decimal)
- El número 61 en hexadecimal es el `01100001` en binario
- Todo junto nos da como instrucción en lenguaje máquina el `1011000001100001`

Por último, te muestro un programa escrito en ensamblador para CPU de arquitectura *x86_64* que suma los números 14 y 10 (y que ya vimos en binario):

```asm
.globl main
    .type main, @function

main:
    movl $14, %eax
    movl $10, %ebx
    add %eax, %ebx
```

> En los lenguajes ensamblador, como ves, se usan identificadores para las instrucciones y registros de la CPU. Así, eax, ebx o ebx son identificadores de tres de los registros de las CPU x86. Y movl o add son instrucciones de la arquitectura de CPU x86.

## Lenguajes de alto nivel

Y, por fin, llegamos a nuestros días en que usamos lenguajes de alto nivel, mucho más fáciles de entender, aprender y aplicar, que los dos anteriores.

Estos lenguajes son fáciles de usar y aprender porque **usan un léxico, sintaxis y semántica cercano al ser humano**. Estos lenguajes ocultan los detalles de la arquitectura de la CPU a programar, no hace falta aprenderse el juego de instrucciones del microprocesador, lo que hace mucho más fácil la programación. Así pues, estos lenguajes no dependen de la arquitectura de la CPU.

Cuando aprendes a usar un lenguaje de alto nivel es fácil la transición a otro lenguaje. Por ejemplo, si aprendes a programar en Java te resultará muy fácil pasar a programar con PHP o Python por ejemplo.

Un ejemplo de programa en C que carga dos valores en memoria y los suma dejando el resultado en otra posición de memoria sería el siguiente:

```c
int main(int argc, char **argv)
{
    int num1, num2, resultado;

    num1 = 14;
    num2 = 10;

    resultado = num1 + num2;

    return 0;
}
```

Evidentemente, estos lenguajes tienen que ser traducidos a máquina para, finalmente, poder ser ejecutados por el ordenador. A estos traductores se les conoce con el nombre de **compiladores** y hablaremos de ellos más adelante.

Hoy en día hay una gran cantidad de languejes de programación. Si quieres conocer las tendencias de uso una buena referencia suele ser [TIOBE](https://www.tiobe.com/tiobe-index/). Entre los lenguajes más populares se suelen encontrar: Python, C y C++, Java, C#, JavaScript o PHP, entre otros. Unos son más adecuados para web, otros para desarrollo *mobile*, otros para *scripting*, etc.

# En resumen

<table>
<thead>
  <tr>
    <th>Lenguaje Máquina</th>
    <th>Lenguaje Ensamblador</th>
    <th>Lenguaje de Alto Nivel</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>
      La programación es compleja
    </td>
    <td>
      Facilita la programación aunque sigue siendo difícil escribir programas
    </td>
    <td>
      La programación es fácil
    </td>
  </tr>

  <tr>
    <td>
      Las instrucciones son en binario
    </td>
    <td>
      Se programa usando mnemotécnicos (instrucciones complejas)
    </td>
    <td>
      Se utilizan sentencias y órdenes con un léxico, sintaxis y semántica cercano al lenguaje humano
    </td>
  </tr>

  <tr>
    <td>
      Estos programas se pueden ejecutar directamente
    </td>
    <td>
      Necesita traducción al lenguaje máquina para poder ejecutarse
    </td>
    <td>
      Necesita traducción al lenguaje máquina para poder ejecutarse
    </td>
  </tr>

  <tr>
    <td>
      Es único para cada procesador (no es portable de un equipo a otro)
    </td>
    <td>
      Hay diferentes lenguajes de ensamblador por cada arquitectura de CPU
    </td>
    <td>
      Son independientes de la CPU
    </td>
  </tr>

  <tr>
    <td>
      Hoy día nadie programa en este lenguaje
    </td>
    <td>
      Se usa en caso muy concretos, sobre todo en el desarrollo de programas de sistema
    </td>
    <td>
      Son los que se usan hoy en día
    </td>
  </tr>
</tbody>
</table>
