# Resultados de aprendizaje y criterios de evaluación

- **RA2** Evalúa entornos integrados de desarrollo, analizando, sus características para editar código fuente y generar ejecutables
  - **CE2e**. Se han generado ejecutables a partir de código fuente de diferentes lenguajes en un mismo entorno de desarrollo
  - **CE2f**. Se han generado ejecutables a partir de un mismo código fuente con varios entornos de desarrollo
  
# Emapaquetar programas Java: Java ARchive (JAR)

En Java, es común agrupar varios archivos `.class` en un solo archivo para facilitar su manejo y distribución. Por esta razón, se utilizan los archivos **JAR (Java ARchive files)**. Este formato permite empaquetar nuestros programas Java de manera sencilla, facilitando su distribución y ejecución al concentrar todos los componentes necesarios en un único archivo `.jar`.

Para profudizar en este apartado, de nuevo, te tengo que remitir a la documentación que puedes encontrar en [dev.java](https://dev.java/learn/).

Aquí te muestro un resumen de lo que veremos en clase con mayor profundidad.

## Contenido de los ficheros JAR

En los ficheros JAR se incluyen:
- Todos los `.class`
- Un archivo de manifiesto (opcional) con información sobre el contenido del fichero JAR (metadatos)
- Archivos de recurso como: configuraciones, imágnenes, logotipos, iconos, cadenas de traducción...
- Cualquier otro archivo necesario para la aplicación

## Sobre el archivo de manifiesto

El archivo de manifiesto es un archivo que tendrás que crear con el nombre `MANIFEST.MF`. En este archivo:

- Se especifican metadatos.
- Estos metadatos se especifican con pares "clave-valor".
- Si se pretende que el archivo JAR sea ejecutable hay que especificar la clase principal

Por ejemplo, imagina que partidmos de un proyecto como este:

```shell
project_jar/
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

Vamos a incluir el archivo "manifest". Creálo en `src/main/resources/META-INFO/MANIFEST.MF` y añade lo siguiente en él (hay que dejar una línea en blanco al final del archivo):

```manifest
  Manifest-Version: 1.0
  Created-By: Román Martínez
  Main-Class: com.proferoman.Main
  
```

Ahora, ya puedes construir el programa:

```shell
  $ javac -d build src/main/java/com/proferoman/*.java src/main/java/com/proferoman/hw1/*.java src/main/java/com/proferoman/hw2/*.java
```

Empaquetarlo en un jar:

```shell
  # Crea el JAR con los archivos .class compilados
  $ jar -cvfm build/miprograma.jar src/main/resources/META-INF/MANIFEST.MF -C build .
```

Significado de las opciones `-cvfm`:

- `c` o `--create` se emplea para indicar a jar que tiene que crear el fichero
- `v` o `--verbose` se emplea para que nos informe con detalle de lo qué pase
- `f` o `--file` se emplea para indicar el nombre del fichero JAR resultante
- `m` o `--manifest` se emplea para indicar el fichero con el manifest

Por último, para ejecutar un programa empaquetado con en un jar:

```shell
$ java -jar build/miprograma.jar
```

