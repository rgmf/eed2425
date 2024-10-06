# Resultados de aprendizaje y criterios de evaluación

- **RA1** Reconoce los elementos y herramientas que intervienen en el desarrollo de un programa informático, analizando sus características y las fases en las que actúan hasta llegar a su puesta en funcionamiento.
  - **CE1b** Se han identificado las fases de desarrollo de una aplicación informática.
  - **CE1f**. Se ha evaluado la funcionalidad ofrecida por las herramientas utilizadas en programación.

# Ingeniería del software

En la 7ª edición del libro *Ingeniería del software*, de Ian Sommerville, podemos leer que "la ingeniería del software es una disciplina de la ingeniería que comprende todos los aspectos de la producción de software desde las etapas iniciales de la especificación del sistema, hasta el mantenimiento de éste después de que se utiliza".

Pero, claro, aquí surge una pregunta importante: ¿qué es la ingeniería? Tomando la definición de la RAE: "conjunto de conocimientos orientados a la invención y utilización de técnicas para el aprovechamiento de los recursos naturales o para la actividad industrial".

Y, ahora bien, ¿qué hace un ingeniero de software? Básicamente: aplicar conocimientos para producción de software, lo que implica:

- Desarrollo de software.
- Gestión de proyectos de software.
- Desarrollo de herramientas de apoyo a la producción de software.

# ¿Por qué necesitamos de la ingeniería del software?

El software es abstracto e intangible, no está restringido por materiales o gobernado por leyes físicas o por procesos de manufactura. Esto, que simplifica el desarrollo del mismo, hace que sea muy difícil medir los costes asociados a todo el proceso de desarrollo del software.

Según podemos leer en la 7ª edición del libro *Ingeniería del software*, de Ian Sommerville, la noción de ingeniería del software fue propuesta inicialmente en 1968 en una conferencia para discutir lo que en ese entonces se llamó la **crisis del software**. Esta crisis del software fue el resultado de la introducción de las nuevas computadoras hardware basadas en circuitos integrados. Su poder hizo que las aplicaciones hasta ese entonces irrealizables fueran una propuesta factible. El software resultante fue de órdenes de magnitud más grande y màs complejo que los sistemas de software previos.

Hasta ese momento el software se desarrollaba de manera informal pero esta forma de desarrollo pronto se vio que no podía continuar siendo así porque daba lugar a programas muy difíciles de mantener y donde, cada vez más, se producían errores también difíciles de localizar y corregir.

Es en este contexto donde surge el concepto de ingeniería del software y se pone ne marcha.

# Proceso de creación del software

Llamamos proceso del software a las activides necesarias para producir un programa o software. Estas actividades, en general, son:

1. Especificación del software: los clientes definen el software (**análisis**).
2. Desarrollo del software: los desarrolladores diseñan (**diseño**) y escriben el programa (**desarrollo**).
3. Validación del software: los *testers* prueban y comprueban que el software cumple con lo que se desea (**tests** o **pruebas**).
4. Evolución del software: los programas se ponen en producción y a funcionar (**explotación**), y, a partir de ahí, se tienen que mantener a lo largo del tiempo para solucionar errores de todo tipo y añadir nuevas características (**mantenimiento**).

![Proceso del software](./img/proceso_software.png)






# Fases en el desarrollo de un programa

En este apartado te describo el proceso y pasos en el desarrollo del programa.

## Fase de codificación

Esta es la primera fase: hay que escribir el programa en un lenguaje de alto nivel, normalmente dividiendo el código fuente en varios ficheros. Para escribir el código se necesita un editor de textos, aunque hoy en día hay editores especiales denominados editores de texto o herramientas con muchas otras opciones denominadas IDE (Entornos de Desarrollo Integrado).

## Fase de generación

Ahora hay que traducir el código fuente a código objeto. Por último, hacer el enlace o *link* para obtener el código ejecutable.

## Fase de corrección de errores

Durante la primera fase de codificación se pueden haber cometido errores sintácticos o semánticos y, por tanto, dicho código no puede ser traducido. En estos casos, el traductor detiene la fase de generación y muestra al programador información de los errores.

Así pues, podemos vernos envueltos en una fase en la que tenemos que dedicar el tiempo a la corrección de estos errores para volver a lanzar el traductor.

## Fase de pruebas

Antes de continuar, una vez obtenido el programa ejecutable conviene probarlo para validar que el programa funciona según lo esperado y las especificaciones propuestas.

> Más adelante, en temas posteriores, profundizaremos en esta fase y veremos lo importante que es.

## Fase de depuración

Durante las pruebas podemos encontrarnos con los denominados **errores de ejecución** (también conocidos como **bugs**). Cuando nos encontramos con estos errores, según la dificultad, tendremos que investigar qué ha pasado y dónde nos hemos equivocado (en el código fuente escrito). A este trabajo se le denomina **depuración** de programas y es una de las habilidades más importantes de un programador.

## Fase de mantenimiento

Una vez tenemos el programa escrito y funcionando, hay que mantenerlo en el tiempo: corregir errores que vaya apareciendo, añadir nuevas características y optimar los recursos que usa.

Así pues, aquí, volveríamos al punto inicial en el que codificamos/modificamos el fuente, traducimos, probamos y depuramos.

# Herramientas de desarrollo

Los programadores tienen a su disposición una gran cantidad de herramientas de apoyo que usan a lo largo de todas las fases anteriores. Te describo algunas de estas herramientas y entraremos con más profundidad en ellas más adelante, a lo largo del curso:

- **Editores de código o IDE**: se trata de los programas con los que escribimos el código fuente.
- **Traductores**: dependiendo del lenguaje usaremos un compilador o intérprete adecuado. Algunos ejemplos son: GCC para C/C++, javac para Java, kotlinc para Kotlin o python para Python.
- **Depuradores**: permiten ejecutar paso a paso el programa para facilitar la búsqueda del punto concreto en el fuente en el que está el error. Algunos depuradores son: gdb para lenguajes como C/C++ y jdb para Java.
- **Analizadores de código estático o *linters***: son herramientas que se instalan junto al editor de código y que muestran "en vivo" errores sintácticos y semánticos, avisan de peligros y errores de ejecución potenciales, y ayudan, en general, en el proceso de escritura de un programa. Algunos *linters* son: checkstyle o sonar en Java, ESLint en JavaScript, Pylint en Python, o PHP CodeSniffer en PHP.
- **Control de versiones**: son programas que ayudan a manejar y llevar el control de los cambios que se hacen en el código fuente de un programa, así como ayudar en el trabajo colaborativo. El programa más popular hoy en día se llama Git, aunque hay otros como Subversion o Mercurial.
