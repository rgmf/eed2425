# Resultados de aprendizaje y criterios de evaluación

- **RA4** Optimiza código empleando las herramientas disponibles en el entorno de desarrollo
  - **CE4f** Se ha realizado el control de versiones integrado en el entorno de desarrollo.

# Git: zonas y estados

En general, los ficheros de un repositorio pueden estar en dos estados:

- **Modificado**: los ficheros han sido modificados, creados, borrados, renombrados... y, en general, cambiados con respecto a la última revisión del repositorio.

- **No modificados**: los ficheros se encuentran en el mismo estado, son iguales, que los que se tienen en la última revisión del repositorio.


Sin embargo, Git introduce un concepto nuevo llamado **staging area** o **área de preparación** lo que hace que los ficheros puedan encontrarse en más estados que los simples "modificado" y "no modificado".

Entraré en los detalles más adelante porque primero es necesario hablar de las zonas existentes en Git.

## Zonas principales de Git

En Git tenemos tres zonas:

- **Directorio de trabajo** (*working directory*): se trata de la carpeta del proyecto, dentro de la cual están los ficheros y otras carpetas.

- **Área de preparación** (*staging area*): es la zona donde hay que meter los ficheros con cambios para meterlos en la siguiente revisión o *commit*.

- **Repositorio** (*repository*): es la zona manejada por Git.

De esta manera, un fichero puede estar en una zona o varias al mismo tiempo. Por ejemplo:

## Estados de un fichero

Los ficheros dentro de un directorio de trabajo en el que tenemos un repositorio de Git pueden estar en diferentes estados, a saber:

- **No rastreado** (*untracked*): un fichero está en este estado si se encuentran en el directorio de trabajo pero no en el repositorio y, por tanto, Git no lo está rastreando, es decir, no tienen seguimiento por parte de Git.

- **Modificado** (*modified*): un fichero está en este estado si está en el repositorio pero la versión del repositorio está obsoleta con respecto a la versión que hay en el directorio de trabajo. Esto se da porque se ha modificado el fichero y no se han registrados por medio de un *commit* esos cambios. Así pues, la versión del repositorio no coincide con la versión del directorio de trabajo.

- **Preparado** (*staged*): un fichero modificado puede ser metido a este estado para que esos cambios se introduzcan en el repositorio en la siguiente revisión o *commit*.

- **Confirmado** (*committed*): un fichero sincronizado y sin diferencias con respecto al repositorio está confirmado.
