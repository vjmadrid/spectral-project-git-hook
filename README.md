<h1>Uso de Git Hooks</h1>





**Índice**
- [Descripción](#descripción)
- [Estado](#estado)
- [Stack Tecnológico](#stack-tecnológico)
  - [General](#general)
  - [Dependencias proyectos de arquitectura](#dependencias-proyectos-de-arquitectura)
  - [Dependencias de terceros](#dependencias-de-terceros)
- [Pre-Requisitos](#pre-requisitos)
- [Instalación](#instalación)
- [Configuración](#configuración)
  - [Implementar comando de análisis de todos los ejemplos](#implementar-comando-de-análisis-de-todos-los-ejemplos)
- [Uso](#uso)
  - [Creación de un Git Hook: script ad-hoc](#creación-de-un-git-hook-script-ad-hoc)
  - [Creación de un Git Hook: script enlazado](#creación-de-un-git-hook-script-enlazado)
  - [Crear](#crear)
    - [Para deshacer el cambio](#para-deshacer-el-cambio)
  - [Crear](#crear-1)
- [Autor](#autor)





## Descripción

En este parte del repositorio se va a enseñar a utilizar la herramienta por línea de comando con diferentes escenarios explicados, de esta forma se verán todas las cosas que se pueden hacer


Este directorio se compone de:

* **examples/**: Directorio que contiene los ficheros a analizar
* **config/**: Directorio que contiene toda la configuración del proyecto
  * **spectral/**: Directorio que contiene todo lo relacionado con la herramienta spectral
    * **rules/**: Subdirectorio que contiene los ficheros de reglas utilizados
* **src/**: Directorio que contiene código para una supuesta aplicación de calculadora
  * Nota: En este caso NO será necesario utilizar el código implementado para realizar un API, sino que servirá de ejemplo para usar fase de testing en posteriores ejemplos
* **tests/**: Directorio que contiene test unitarios / integración sobre código implementado en el directorio "src/"
* **docs/**: Directorio que contiene cierta documentación del proyecto
* **scripts/**: Directorio que contiene ciertos scripts que pueden ayudar a usar ciertos acciones de la aplicación, en su instalación, en la preparación del entorno o bien ayudar en el ciclo de desarrollo
  * Ejemplos
    * Ejecución de test
    * Lintado con Spectral
    * Operativa de Build del proyecto
    * ...
  * Recordar de proporcionar permisos de ejecución: chmod +x XXX
* **git-hooks/**: Directorio que contiene referncias de los Git Hooks y que se distribuirán junto con la aplicación, posteriormente se podrán activar de diferentes maneras




## Estado

Este proyecto se encuentra en construcción





## Stack Tecnológico

### General

* [Node.js](https://nodejs.org/es) >18.x.x


### Dependencias proyectos de arquitectura

N/A


### Dependencias de terceros

**Desarrollo**

* **@stoplight/spectral-core** : Framework de Spectral
  * [npm](https://www.npmjs.com/package/@stoplight/spectral-core)
  * [Repositorio Git](https://github.com/stoplightio/spectral)
  * [Documentacion](https://stoplight.io/open-source/spectral)


**Testing**

* **jest** : Framework de Testing
  * [npm](https://www.npmjs.com/package/jest)
  * [Repositorio Git](https://github.com/jestjs/jest)
  * [Documentacion](https://jestjs.io/)





## Pre-Requisitos

* Requerido tener instalado Node.js >18.x.x







## Instalación

Pasos a seguir:

1. Clonar el repositorio
2. Arrancar un terminal
3. Localizar el PATH el directorio del proyecto
4. Ejecutar el siguiente comando

```bash
npm install
```

5. Verificar que se ha instalado todo correctamente


ln -s pre-commit.sh .git/hooks/pre-commit




## Configuración



### Implementar comando de análisis de todos los ejemplos

Pasos a seguir:

1. Crear un script en el fichero **package.json**

```bash
"scripts": {
    ...
    "spectral:oas:lint:one": "spectral lint ./examples/example1.yaml",
    "spectral:oas:lint": "spectral lint ./examples/*",
    "spectral:oas:lint-warning-as-errors": "spectral lint -F warn ./examples/*"
    ...
  },
```

Detalle:

* **test**: Ejecutará el testing definido para el proyecto
* **spectral:oas:lint:one**: Análisis de Spectral sobre un fichero seleccionado del directorio examples/
* **spectral:oas:lint**: Análisis de Spectral sobre todos los ficheros del directorio examples/
* **spectral:oas:lint-warning-as-errors**: Análisis de Spectral sobre todos los ficheros del directorio examples/ generando un error al detectar al menos un warning, es decir, para la ejecución con un warning






## Uso

Se va a intentar definir un scrip de Git Hook para la operativa de pre-commit que se encargue de :

* Ejecutar los test configurados en el proyecto
* Ejecutar una operativa de lintado con Spectral

La propuesta del script se encuentra en : **docs/pre-commit.txt**


>**Nota:**
>
>Todos los ejemplos harán uso de la configuración de spectral de **.spectral.yml**


### Creación de un Git Hook: script ad-hoc

En este caso se va crear directamente el script de Git Hook

Pasos a seguir:

1. Abrir el directorio **.git/hooks** del respositorio seleccionado
2. Localizar el archivo de ejemplo del hooks que se quiere implementar
3. Eliminar la parte ".sample" del nombre del hook o bien crear un archivo nuevo
4. Verificar el que el nombre del hook se corresponde con uno de los considerados validos. Por ejemplo: "pre-commit"
5. Cambiar los permisos de ejecución del archivo

```bash
# Ejemplo para "pre-commit" desde el directorio
chmod +x pre-commit

# Ejemplo para "pre-commit" sobre el directorio
chmod +x .git/hooks/pre-commit
```

6. Verificar que tiene el permiso asignado

```bash
ls -la .git/hooks
```

8. Elegir el lenguaje de scripting que se quiere utilizar para implementar el hook (Python, bash, shell, etc.)
9. Editar el archivo con la implementación seleccionada




### Creación de un Git Hook: script enlazado

Soluciona el problema de la confirmacion anterior

Pasos a seguir:

1 Crear un directorio **git-hooks/** en el proyecto
2 Copiar el archivo hook seleccionado del directorio **.git/hooks/** sin ".sample" o bien crea un fichero nuevo con el nombre del hook
3.Acceder a **.git/hooks/**
4. Crear un nuevo archivo vacío con el mismo nombre
5. Crear un enlace símbolico entre ellos con el siguiente comando

```bash
ln -s -f ../git-hooks/[hook-name] .git/hooks/[hook-name]

# Ejemplo para "pre-commit"
ln -s -f ../git-hooks/pre-commit .git/hooks/pre-commit
```

6. Verificar que se ha creado el enlace simbólico

```bash
ls -la .git/hooks
```




### Crear

A partir de la versión 2.9 se puede cambiar el directorio de configuración donde buscar los hooks

Pasos a seguir:

1. Arrancar un terminal
2. Localizar el PATH el directorio del proyecto
3. Verificar que el directorio "git-hooks" existe
4. Ejecutar el siguiente comando

```bash
git config core.hooksPath ./git-hooks
```

#### Para deshacer el cambio


```bash
git config --unset core.hooksPath
```

```bash
git config core.hooksPath .git/hooks
```



### Crear

Para versiones anteriores de Git se pueden crear enlaces simbolicos entre el directorio ./git/hooks y el nuevo directorio de trabajo

Pasos a seguir:

1. Arrancar un terminal
2. Localizar el PATH el directorio del proyecto
3. Verificar que el directorio "git-hooks" existe
4. Verificar que NO existe ningun enlace a pre-commit

```bash
ls -la .git/hooks
```

5. Ejecutar el siguiente comando

```bash
ln -sf ./git-hooks/pre-commit .git/hooks/pre-commit
```


6. Verificar que SÍ existe ningun enlace a pre-commit

```bash
ls -la .git/hooks
```








## Autor

* **Víctor Madrid**