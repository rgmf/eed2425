# Resultados de aprendizaje y criterios de evaluación

- **RA4** Optimiza código empleando las herramientas disponibles en el entorno de desarrollo
  - **CE4f** Se ha realizado el control de versiones integrado en el entorno de desarrollo.

# Git: trabajo en remoto

Cuando trabajes con Git, probablemente, trabajarás con repositorios remotos. En este caso el repositorio de trabajo está compartido en un servidor de Git y te conectarás al mismo para descargar una copia del mismo y poder trabajar en tu ordenador. Cuando hagas algún cambio, entonces, te tocará subir los cambios al repositorio remoto.

Así es como se trabaja de forma colaborativa en proyectos de software.

![Representación gráfica del trabajo en remoto](./img/modelo_repositorio_remoto.png)

Como ves representada en la imagen de arriba, cada desarrollador se descarga una copia del repositorio remoto (**clone**) y trabaja en él. Cuando hace cambios subirá los mismos al repositorio remoto (**push**). Cuando ya tienes tu copia local en tu máquina tendrás que actualizar los cambios de tu máquina con las novedades que hay en el repositorio remoto para trabajar con la última versión de los ficheros (**pull**).

Resumiendo mucho, las operaciones básicas, cuando trabajas en remoto, son:

- **clone**: para obtener una copia del repositorio remoto en tu máquina (se hace solo la priemra vez)
- **push**: para subir tus cambios al repositorio remoto y que todos tengan acceso a esos cambios
- **pull**: para refrescar y actualizar tu copia local con las últimas versiones de los ficheros del repositorio remoto
- **fetch**: para refrescar y obtener los últimos objetos en tu copia local (como ramas, por ejemplo)

## Servicios de alojamiento de repositorios Git

Aunque siempre puedes crear tu propio servidor de Git para trabajar en repositorios remotos y de forma colaborativa, lo habitual es trabajar en alguno de los servicios que existen.

Aquí te listo algunas opciones donde puedes alojar tu software de forma remota y que permiten el trabajo colaborativo:

- GitHub
- GitLab
- Bitbucket
- Codeberg
- Sourcehut

## Comandos básicos para trabajar con repositorios remotos

En los siguientes apartados te explico los comandos básicos para trabajar con repositorios remotos: `remote`, `push`, `pull` y `fetch`.

### git remote

Se usa para conectar, ver y gestionar repositorios remotos.

#### Ver información del remoto

Para poder trabajar con un repositorio remoto desde tu repositorio local, estos tienen que estar conectados o vinculados. Puedes ver el remoto al que está vinculado tu repositorio local ejecutando el comando:

```shell
$ git remote
```

Si está vinculado a un repositorio remoto verás algo así:

```shell
$ git remote
origin
```

Que indica que el repositorio local está vinculado a un repositorio remoto llamado `origin`.

> Es habitual llamar al repositorio remoto `origin`. Hazlo siempre. Solo en casos muy excepcionales puede que necesites otros nombres.

Si quieres ver los detalles del repositorio remoto usa la opción `-v`:

```shell
$ git remote -v
origin	git@github.com:rgmf/eed_roman.git (fetch)
origin	git@github.com:rgmf/eed_roman.git (push)
```

Ahora puedes ver la URL del repositorio remoto.

#### Añadir un remoto

Usa el siguiente comando para añadir un remoto llamado `origin` que se vincule al repositorio llamado `edd_roman` de GitHub del usuario `rgmf`:

```shell
$ git remote add origin git@github.com:rgmf/eed_roman.git
```

#### Eliminar un remoto

Basta con usar el siguiente comando para eliminar el remoto llamado `origin`:

```shell
$ git remote remove origin
```

A partir de aquí tu repositorio local ha quedado desvinculado de tu repositorio remoto pero no se borra nada de lo que hay en tu copia de trabajo.

### git clone

Con este comando puedes clonar un repositorio remoto. El resultado de clonar un repositorio remoto es que se descargará en tu equipo. Por ejemplo, si ejecutas este comando:

```shell
$ git clone git@github.com:rgmf/eed_proyecto.git
```

Se descargará el repositorio remoto que está en **GitHub**, que pertenece al usuario **rgmf** y que se llama **eed_proyecto**. Tras ejecutar este comando, verás una carpeta llamada `eed_proyecto` dentro de la carpeta en la que has ejecutado ese `git clone`.

### git push

Con este comando puedes enviar tus cambios al repositorio remoto indicado y a la rama indicada. De esta manera sincronizas tu copia local y el remoto.

Por ejemplo:

```shell
$ git push origin main
```

Este comando sube los cambios de tu copia local a la rama `main` del repositorio remoto llamado `origin`. Al subir o "empujar" los cambios arriba se hace una mezcla en remoto que podría dar lugares a conflictos que habrá que resolver.

### git pull

Con este comando hacemos la operación inversa al `git push`, es decir, te traes los cambios que hay en la rama indicada del repositorio remoto:

Por ejemplo:

```shell
$ git pull origin main
```

Este comando descarga los cambios que hay en l rama `main` del repositorio remoto `origin` a tu copia local. Como antes, se podrían producir conflictos que tendrías que resolver en tu copia local.

### git fetch

Este comando que le dice a tu copia local que recupere la última información de los metadatos del repositorio remoto (así pues se incluyen tags, ramas, etc).

No hace ninguna transferencia de archivos pero te permite comprobar si hay algún cambio disponible antes de hacer el `git pull`.

```shell
$ git fetch
```
