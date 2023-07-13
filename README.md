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
  - [Crear el hook directamente](#crear-el-hook-directamente)
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


Una buena forma de facilitar a otros la configuración de su repositorio es incluir un script en el repositorio que cree la configuración necesaria. Esto es especialmente cierto si desea configurar más de un enlace simbólico o realizar otros comandos para los nuevos usuarios del repositorio.

versionar los hooks en un repositorio separado y suministrar un script para configurar el repositorio del proyecto para usar este repositorio como su directorio de hooks. De cualquier manera se asegura de que los ganchos son de versión controlada y más fácil de compartir a través de un equipo que sólo puede ser un positivo.



## Uso

>**Nota:**
>
>Todos los ejemplos harán uso de la configuración de spectral de **.spectral.yml**

### Crear el hook directamente


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