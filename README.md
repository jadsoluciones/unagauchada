# Git
#### Primero
Hay que clonar el repositorio y agregar el repo como remote.
``` sh
$ git clone https://github.com/jadsoluciones/unagauchada.git
$ git remote add origin https://github.com/jadsoluciones/unagauchada.git
$ git remote -v # para ver si lo agrego bien
origin	https://github.com/jadsoluciones/unagauchada.git (fetch)
origin	https://github.com/jadsoluciones/unagauchada.git (push) #si falta esta es porque no tenes permiso para pushear
``` 
Va a crear una carpeta unagauchada en la carpeta donde este parada la consola.
#### Antes de trabajar
Hay que actulalizar el codigo local con el del repo. La primera vez no tiene sentido porque el clone ya esta actualizado
``` sh
$ git pull origin master
``` 

Después hay que crear la rama donde va a trabajar cada uno.
``` sh
$ git branch #para ver las ramas actuales
$ git branch augusto #para crear la rama augusto
$ git checkout augusto #para pararse en la rama augusto
``` 
Los ultimos dos comandos se pueden cambiar por uno solo  que es
``` sh
$ git checkout -b augusto #crea y se para
``` 
###### Igual lo de crear la rama se hace una vez, fue un dato nomas.

Cuando visualizas las ramas con `git branch` el asterisco indica en cual estas parado.
#### Manqueando
Ahora ya se puede empezar a editar, **es importante no tocar archivos que no sean nuestros**, si hay que cambiar algo ajeno se guarda lo que hicimos y se espera a que el encargado de esa parte lo cambie.

Si ya terminamos con la partecita de código cambiada (creo que máximo una historia de usuario) hay que guardar los cambios. Para tener un mapeo de qué cambiamos hacemos
``` sh
$ git status
``` 
Esto sirve para verificar que no pisamos nada que no sea nuestro y también para escribir el mensaje del commit sin olvidarnos de contar lo que hicimos.

```
En la rama augusto
Cambios no preparados para el commit:
  (use «git add <archivo>...» para actualizar lo que se confirmará)
  (use «git checkout -- <archivo>...» para descartar cambios en el directorio de trabajo)

	modificado:    README.md

no hay cambios agregados al commit (use «git add» o «git commit -a»)
```
El `git status` imprime algo así (si hacen `git diff` ). Detecta los cambios pero dice que no esta preparado para el commit porque lo edité pero todavía no lo agregué. Para agregarlo se puede hacer:
```sh
$ git add README.md # agrega el archivo sólo
```
O sino
```sh
$ git add . # agrega todos los archivos de la carpeta (parado en el unagauchada) 
```

Esto del add se hace siempre que se creen archivos nuevos o se renombren. Lo más fácil es no tener archivos que no sirvan dentro del proyecto para poder hacer `git add .` en vez de especificar uno por uno.

Ahora viene la parte del commit para informar los cambios hechos. El comando es:
```sh
$ git commit -m 'Actualizado el README' # que sea descriptivo pero corto como un título
```
`-m` es de mensaje, es el que se ve en GitHub al lado de los archivos  y es para llevar un historial de los cambios.

Entonces cada vez que creamos algo tenemos que hacer `git add .`y `git commit -m '...'`. O se puede hacer de una así:
```sh
$ git commit -a -m 'Actualizado el README'
```
#### Para subirlo
Ahora queda la parte que puede fallar, la de meterlo en el repo. Para esto hay que hacer un `merge` con la rama master. Entonces nos paramos en la rama master, solicitamos un `merge` con nuestra rama y si todo da ok la subimos. Si nada falla
sería:
``` sh
$ git checkout master # entramos a master
$ git merge augusto # master <-- augusto
$ git push origin master #lo sube
```
Lo que puede pasar es que alguien haya mergeado mientras nosotros editabamos entonces nuestra master estaría desactualizada. Ni bien hacemos el `checkout master` la consola te dice si está actualizada o no. Esto se soluciona muy facil con `git pull origin master`. El tema es que si lo editado por otro pisa con lo que editamos nosotros, habrá que hablar con Lucas. 

**Ahora están parados en la rama master, si van a seguir editando no hay que olvidarse de pasar a la de cada uno porque sino es un quilombo**.

#### Resumen

Una vez que ya está todo configurado los pasos para editar son
```sh
$ git pull origin master
$ git checkout augusto
####### TRABAJAR #######
$ git status #opcional
$ git commit -a -m 'Mensaje de commit'
$ git checkout master # si dice que esta desactualizada-> git pull origin master
$ git merge augusto
$ git push origin master
```
