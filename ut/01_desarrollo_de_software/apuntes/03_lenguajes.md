# Resultados de aprendizaje y criterios de evaluación

1. **RA1** Reconoce los elementos y herramientas que intervienen en el desarrollo de un programa informático, analizando sus características y las fases en las que actúan hasta llegar a su puesta en funcionamiento

    1.1. **CE.e** Se han clasificado los lenguajes de programación.

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
