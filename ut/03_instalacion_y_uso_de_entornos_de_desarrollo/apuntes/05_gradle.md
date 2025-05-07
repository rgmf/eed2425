# Resultados de aprendizaje y criterios de evaluación

- **RA2** Evalúa entornos integrados de desarrollo, analizando, sus características para editar código fuente y generar ejecutables
  - **CE2e**. Se han generado ejecutables a partir de código fuente de diferentes lenguajes en un mismo entorno de desarrollo
  - **CE2f**. Se han generado ejecutables a partir de un mismo código fuente con varios entornos de desarrollo
  
# Gradle

## Introducción y documentación oficial

Gradle automatiza la construcción, el testing y el despliegue de software a partir de información en ficheros de script.

Estos conceptos son clave, y los tienes que asimilar para poder usar Gradle:

- **Projects** pieza de software que puede ser construido como son aplicaciones y bibliotecas. Los proyectos (projects) pueden ser sencillos (single) o multi-proyectos (multi-projects).
- **Build Scripts** son scripts escritos en Groovy o Kotlin donde se indican los pasos que se tienen que dar para construir el proyecto. Pueden haber varios scripts como veremos después.
- **Dependency Management** técnica que permite indicar las dependencias de un proyecto (bibliotecas) y se especifica en los scripts de construcción.
- **Tasks** son las unidades básicas de trabajo como son: compilar, lanzar tests o ejecutar el proyecto.
- **Plugins** se utilizan para extender las capacidades de Gradle y opcionalmente para contribuir al número de tareas a realizar.

En la web de Gradle dispones de una fantástica [documentación](https://docs.gradle.org/current/userguide/getting_started_eng.html) que puedes usar para esta parte del tema.

En clase se profundizará en todo aquello que tienes que aprender en esta parte del tema. Gradle, por si mismo, daría para un curso completo, así que nosotros vamos a entrar en lo fundamental.

## Iniciar proyecto Gradle: configuración de un script básico

Partimos de una estructura siguiente:

```shell
project
├── app
│   ├── build.gradle.kts
│   └── src
│       └── main
│           └── java
│               └── com
│                   └── proferoman
│                       └── App.java
└── settings.gradle.kts
```

Ves que hay dos scripts:

- `settings.gradle.kts` que es el script principal del proyecto, donde se configura el proyecto en sí:

```kotlin
  // Nombre del proyecto
  rootProject.name = "my-first-project"

  // Incluimos los subproyectos
  include("app")
```

- `build.gradle.kts` que es el script que indica cómo construir el único módulo que hay `app`:

```kotlin
  /*
   * Añadimos plugins.
   *
   * Los plugins que añadamos proporcionan funcionalidades y proporionan tasks al
   * proyecto. Además, los plugins añaden propiedades y métodos al proyecto.
   *
   * El plugin "application" posibilita una aplicación JVM ejecutable: podemos
   * construir el proyecto y tener una aplicación JVM ejecutable.
   */
  plugins {
      id("application")
  }
  
  /*
   * Hemos añadido el plugin "application" y, por tanto, ahora tenemos disponible
   * ciertas propiedades y métodos.
   *
   * Aquí usamos la propiedad "mainClass" del método "application" para
   * especificar la clase principal.
   */
  application {
      mainClass = "com.proferoman.App"
  }
```

## Línea de comandos

Los comandos básicos de gradle son los siguientes:

- Ver tareas:

```shell
  $ gradle tasks
```

- Construir el proyecto:

```shell
  $ gradle build
```

- Limpiar el proyecto (borra la carpeta build/):

```shell
  $ gradle clean
```

- Ejecutar el proyecto:

```shell
  $ gradle run
```

## Maven Central y dependencias

Las bibliotecas y plugins que vas a necesitar en tus proyectos Java y que tengas que incluir como dependencias en tus proyectos de Gradle los puedes encontrar en los repositorios de Maven cuya web es [esta](https://mvnrepository.com).

Para usar Maven Central como repositorio basta con añadirlo en `repositories`:

```shell
repositories {
    mavenCentral()
}
```

Después, si tienes que añadir dependencias tendrás que añadirlas en `repositories` a través de la función `implementation`:

```shell
dependencies {
    implementation(libs.guava)
}
```

## Configurar Java toolchain

Se conoce como *Java Toolchain* al conjunto de herramientas que se usan para compilar/construir y ejecutar programas en Java y vienen dados por el JRE o el JDK.

Es una buena práctica indicar a Gradle qué versión de la JVM se va a usar para, entre otras cosas, asegurar que todos los desarrolladores usen la misma versión de Java y se pueda mantener la compatibilidad.

Para especificar qué versión de Java se usará, por ejemplo la 17, en el script `build.gradle.kts` hay que añadir:

```kotlin
  java {
      toolchain {
          languageVersion = JavaLanguageVersion.of(17)
          vendor = JvmVendorSpec.ORACLE
      }
  }
```

Esto asegura que Gradle construya el proyecto usando la versión 17 de la JVM y, por tanto, que el bytecode sea compatible con esa versión de la JVM.

Si no está instalado en el sistema la JVM indicada, en este caso la 17, se descargará del `vendor` indicado (más aquí: https://docs.gradle.org/current/javadoc/org/gradle/jvm/toolchain/JvmVendorSpec.html).

Ahora surge otro problema: es posible que uses APIs o plugins que usen otra versión de la JVM. Para evitarlo, y forzar sí o sí a usar la versión 17, de este ejemplo, es necesario añadir el flag `--release`, que obliga de forma restrictiva a usar dicha versión:

```kotlin
  tasks.withType<JavaCompile>().configureEach {
      options.release = 17
  }
```

Además, para que Gradle se descargue automáticamente la versión del JDK que indicas (si no está en el sistema), tendrás que añadir el siguiente plugin en el fichero `settings.gradle.kts`:

```kotlin
  plugins {
      // Apply the foojay-resolver plugin to allow automatic download of JDKs
      id("org.gradle.toolchains.foojay-resolver-convention") version "0.9.0"
  }
```

Dispones de muchas más información en la documentación oficial, en concreto aquí: https://docs.gradle.org/current/userguide/toolchains.html
