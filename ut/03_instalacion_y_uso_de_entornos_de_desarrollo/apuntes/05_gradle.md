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

## Maven Central

Las bibliotecas y plugins que vas a necesitar en tus proyectos Java y que tengas que incluir como dependencias en tus proyectos de Gradle los puedes encontrar en los repositorios de Maven cuya web es [esta](https://mvnrepository.com).
