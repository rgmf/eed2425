# Resultados de aprendizaje y criterios de evaluación

- **RA2** Evalúa entornos integrados de desarrollo, analizando, sus características para editar código fuente y generar ejecutables
  - **CE2e**. Se han generado ejecutables a partir de código fuente de diferentes lenguajes en un mismo entorno de desarrollo
  - **CE2f**. Se han generado ejecutables a partir de un mismo código fuente con varios entornos de desarrollo
  
# Creación de bibliotecas

En clase ya hemos hablado del concepto de biblioteca de software (*library*).

Aquí te muestro un resumen de lo visto en clase. Partamos de este proyecto, preparado para construir una biblioteca en JAR:

```shell
my_library
└── src
    └── main
        ├── java
        │   └── com
        │       └── example
        │           └── dateformatter
        │               └── DateFormatterUtil.java
        └── resources
            └── META-INF
                └── MANIFEST.MF
```

Los pasos que hay que llevar a cabo son estos:

1. Compilar: `javac -d build src/main/java/com/example/dateformatter/DateFormatterUtil.java`
2. Empaquetar: `jar -cvfm build/dateformatter-lib.jar src/main/resources/META-INF/MANIFEST.MF -C build .`

Ahora, para usar la librería en otro proyecto (al que he llamado `project`):

1. Creamos un proyecto con una estructura típica de paquetes en la que tenemos un nuevo directorio dentro de `src/main` llamado `libs` como ves aquí (donde metemos las librerías empaquetadas en `.jar`):

```shell
project
└── src
    └── main
        ├── java
        │   └── es
        │       └── eed
        │           └── App.java
        ├── libs
        │   └── dateformatter-lib.jar
        └── resources
            └── META-INF
                └── MANIFEST.MF
```

2. Ahora, costruimos el proyecto con la biblioteca incluida (la novedad es que usamos la opción `-cp` para indicar donde están las bibliotecas a incluir):
   `javac -cp src/main/libs/dateformatter-lib.jar -d build src/main/java/es/eed/App.java`

3. Y ejecutamos inluyendo las bibliotecas y todos los classpath separados por el carácter dos puntos (:):
   `java -cp build:src/main/libs/dateformatter-lib.jar es.eed.App`

   En Windows hay que usar como separador el punto y coma (;) y hay que poner el classpath entre comillas:
   `java -cp "build;src/main/libs/dateformatter-lib.jar" es.eed.App`

4. Crear un `fat-jar` con todas las dependencias dentro (a modo de información): habría que desempaquetar todas las bibliotecas para añadirlo todo al JAR final junto al proyecto. Resumen de pasos:
   - Compilar el proyecto
   - Crear el MANIFEST.MF con `Main-Class: es.eed.APP` para poder ejecutarlo (JAR ejecutable)
   - Extraer el contenido de la biblioteca a una carpeta temporal (`jar -xf src/main/libs/...jar`)
   - Empaquetar todo en un solo JAR: `jar -cf programa.jar -C build/ . -C temp_lib/ .`
   - Ejecutar: `java -jar programa.jar`

En Maven se puede usar el plugin Maven Shade para hacerlo y en Gradle Shadow.
