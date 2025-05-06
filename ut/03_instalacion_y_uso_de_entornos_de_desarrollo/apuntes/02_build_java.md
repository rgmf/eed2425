# Resultados de aprendizaje y criterios de evaluación

- **RA2** Evalúa entornos integrados de desarrollo, analizando, sus características para editar código fuente y generar ejecutables
  - **CE2e**. Se han generado ejecutables a partir de código fuente de diferentes lenguajes en un mismo entorno de desarrollo
  - **CE2f**. Se han generado ejecutables a partir de un mismo código fuente con varios entornos de desarrollo
  
# Construcción y ejecución de programas en Java

## Introducción y referencia

Antes de comenzar a desarrollar programas en Java, es fundamental instalar el JDK (Java Development Kit). Una vez que hayas completado la instalación, tendrás acceso a un compilador llamado `javac` y a una máquina virtual que puedes ejecutar con el comando `java`, entre otras herramientas útiles como un empaquetador `jar` o un generador de documentación como `javadoc`.

Puedes acceder a toda la documentación al respecto desde la web [dev.java](https://dev.java/learn/).

En los siguientes apartados tienes un resumen de lo que hemos estudiado en clase pero, como ya se ha comentado, es necesario presenciar las clases para disponer de la información completa.

## Compilar y ejecutar, todo en la misma carpeta

Imagina que tienes un programa que consta de tres fuentes en la raíz del proyecto:

- `Main.java` que contiene la clase principal (entrada al programa)
- `Tarea.java`
- `GestorTareas.java`

Para compilar, desde la carpeta raíz del proyecto:

```shell
$ javac *.java
```

Y, para ejecutar, desde la raíz del proyecto:

```shell
  $ java Main
```

## Compilar y construir en otra carpeta

Ahora, veamos como reestructurar el proyecto organizándolo en una jerarquía como ves:

```shell
project/
|-- src/
|    |-- Tarea.java
|    |-- GestorTareas.java
|    |-- Main.java
|-- build/
|-- README.md
```

Compilamos/construímos desde la raíz del proyecto para dejar los resultados `*.class` en la carpeta `build`:

```shell
  $ javac -d build src/*.java
```

Ahora podemos ejecutar el programa con la opción `-cp` (`classpath`):

```shell
  $ java -cp build Main
```

## Uso de paquetes

Cuando un programa crece en cantidad de fuentes y complejidad tenemos que organizar nuestro proyecto Java en **paquetes**. En clase, hemos visto qué son los paquetes en Java y qué problema resuelven.

Lo primero que tenemos que hacer es reestructurar la jerarquía de directorios para adaptarla a la jerarquía estándar cuando se usan paquetes.

Se sigue una convención de nomenclatura y una estructura de directorios que es estándar y ampliamente aceptada. Esta estructura ayuda a organizar el código de manera lógica y a evitar conflictos de nombres.

Detalles de la estructura:
- **Raíz de proyecto**: `src/main/java` (esta es la estructura de Maven o Gradle, y la que vamos a usar nosotros)
- **Prefijo único de paquete**: se usa un dominio al revés. Por ejemplo, si una empresa/organización tiene como dominio `miorganizacion.com`, el prefijo del paquete es `com.miorganizacion`
- **Paquetes:** cada parte del nombre del paquete se convierte en subdirectorios y se pueden añadir, a partir del prefijo anterior, todos los subdirectorios que se necesiten y se consideren oportunos

Por ejemplo, si partimos de mi dominio `proferoman.com`, el proyecto anterior lo podríamos organizar así:

```shell
project/
├── build
├── README.md
└── src
    └── main
        └── java
            └── com
                └── proferoman
                    ├── hw1
                    │   └── HelloWorld.java
                    ├── hw2
                    │   └── HelloWorld.java
                    └── Main.java
```

Y, ahora, cada fichero tiene que empezar con la instruccion `package` seguida del nombre del paquete al que forma parte ese fichero. Al compilar veremos que hay un error porque, ahora, es necesario importar la clase que queremos usar.

Tras importar, entonces sí, ahora ya podemos compilar sin problema:

```shell
  $ javac -d build src/main/java/com/proferoman/Main.java src/main/java/com/proferoman/hw1/HelloWorld.java src/main/java/com/proferoman/hw2/HelloWorld.java
```

Y vemos como, en `build/`, se mantiene la estructura de paquetes:

```shell
build/
└── com
    └── proferoman
        ├── hw1
        │   └── HelloWorld.class
        ├── hw2
        │   └── HelloWorld.class
        └── Main.class
```

Y, otro cambio más, a la hora de ejecutar tenemos que indicar la clase principal especificando su paquete completo:

```shell
  $ java -cp build com.proferoman.Main
```
