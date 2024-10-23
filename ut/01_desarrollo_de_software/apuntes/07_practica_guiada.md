# Resultados de aprendizaje y criterios de evaluación

- **RA1** Reconoce los elementos y herramientas que intervienen en el desarrollo de un programa informático, analizando sus características y las fases en las que actúan hasta llegar a su puesta en funcionamiento.
  - **CE1c** Se han diferenciado los conceptos de código fuente, código objeto y código ejecutable.
  - **CE1d** Se han reconocido las características de la generación de código intermedio para su ejecución en máquinas virtuales.<br>
  - **CE1f** Se ha evaluado la funcionalidad ofrecida por las herramientas utilizadas en programación.

# Práctica guiada: lenguajes que generan código intermedio o bytecode como Java

Vamos a realizar una práctica con el lenguaje de programación `Java` para ver cómo funciona un lenguaje que genera código intermedio para ser ejecutado por una máquina virtual que, en este caso, será la *Java Virtual Machine* o **JVM**.

Sigue los pasos que te explico a continuación.

# Paso 1. Instalación del JDK

Para programar en `Java` necesitas instalar en tu equipo el llamado *Java Development Kit* o **JDK**. Este JDK viene con la JVM y todas las herramientas necesarias para crear programas con `Java`.

## Instalación en Windows

Para instalar la JDK en Windows hay varias opciones. Una de ellas sería:

1. Ir a la página de [descargas de la JDK en la web de Oracle](https://www.oracle.com/java/technologies/downloads)
2. Descargar la versión del JDK de Windows que necesites
3. Descomprimir el fichero descargado y añadir al `PATH` de Windows la carpeta `bin/` que hay dentro de dicho fichero recién descomprimido

## Instalación en Debian

En las distribuciones de GNU/Linux lo recomendable sería usar el gestor de paquetes del la misma. En Debian, por ejemplo, tenemos que usar **APT**. Desde la terminal, con permisos de administración:

```shell
$ sudo apt install openjdk-17-jdk
```

Esto instalará la versión 17 de la JDK. Ahora mismo, en el momento en que escribo estas líneas, la última versión de Java es la 23.

## Versiones de Java

El histórico de versiones de Java lo puedes ver en la tabla de [esta entrada en la Wikipedia](https://en.wikipedia.org/wiki/Java_version_history).

Resumiendo mucho, existen dos tipos de versiones/opciones en Java: las LTS (*Long Term Support*) y las que no lo son. La última versión de Java, al escribir estas líneas, es la 23 pero la última versión LTS es la 21. Existen otras versiones activas LTS que son la 21, la 17, la 11 y la 8.

# Paso 2. Asegúrate que está Java instalado

Abre una terminal en GNU/Linux o la PowerShell en Windows y escribe `java -version` para asegurarte que está Java instalado.

Si está bien instalado y configurado deberías ver en pantalla información de la versión de Java instalada en el sistema. En otro caso vuelve a revisar el paso anterior.

# Paso 3. Escribir un programa en Java

En tu editor de programación favorito escribe el siguiente programa en Java y guárdalo en un fichero llamado `Main.java`:

```java
class Main {

    public static void main(String[] args) {
        System.out.println("Hola mundo");
    }
}
```

# Paso 4. Compilar el programa

Para compilar el programa anterior con Java hay que emplear el compilador `javac`. Abre la terminal, en la carpeta en la que está el fichero `Main.java` y ejecuta esta orden para compilar el código fuente:

```shell
$ javac Main.java
```

Verás que se ha generado el código intermedio o bytecode de Java en un fichero que se llama `Main.class`, es decir, tiene el mismo nombre que le fichero fuente pero acabado en `.class`.

Este `.class` es el que se le pasa a la JVM para que lo ejecute. Esta JVM compila dicho bytecode a código máquina nativo del ordenador en el que estás y lo ejecuta.

# Paso 5. Inspeccionar un .class

Igual que hacíamos en C con `objdump`, en Java tenemos la herramienta `javap` para poder inspeccionar el código `.class` generado:

```shell
$ javap -c -p -v Main.class
```

Esto imprime por pantalla la información del bytecode.

Las opciones tienen este significado:

- `-p`: muestra todos los miembros, incluidos los privados.
- `-s`: muestra las firmas de métodos.
- `-v`: modo detallado, muestra mucha información adicional.

# Paso 6. Ejecutar el programa

Finalmente, para ejecutar el programa cuyo bytecode está en `Main.class`, generado tras compilar en los pasos anteriores, solo tienes que ejecutar `java` (la JVM), tal que así:

```shell
$ java Main
```

Fíjate en algo **muy importante** y es que no especifico el nombre completo del fichero `Main.class` sino solo el nombre, sin la extensión, `Main`.

Cuando ejecutamos `java` (la JVM) se llevan a cabo estos pasos:

1. Se coge el fichero `.class` con el bytecode (código intermedio)
2. Se genera el código máquina correspondiente al ordenador en el que se está (arquitectura de CPU y Sistema Operativo)
3. Se ejecuta dicho código máquina

Recuerda que ese proceso de generación del código máquina ejecutable se hace por medio de un compilador **JIT** (*Just-In-Time*).
