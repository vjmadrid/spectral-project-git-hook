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
  - [Implementar comandos de análisis de todos los ejemplos con lintado](#implementar-comandos-de-análisis-de-todos-los-ejemplos-con-lintado)
- [Uso](#uso)
- [Autor](#autor)





## Descripción

Este **repositorio** se encarga de servir como una **estructura** de los **recursos utilizados** para los **artículos publicados** en la plataforma **enmilocalfunciona.io** relacionados con el uso de **Git Hooks** y basado en la serie de artículos **“Uso de Git Hooks”**

* [Uso de Git Hooks (Parte 1)](https://www.enmilocalfunciona.io/uso-de-git-hooks-para-proyectos/): Artículo de introducción teórica al uso de Git Hooks
* [Uso de Git Hooks (Parte 2)](https://www.enmilocalfunciona.io/uso-de-git-hooks-para-proyectos-parte-2/): Artículo de introducción práctica al uso de Git Hooks


Este respositorio se compone de los siguientes directorios:

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
* **git-hooks/**: Directorio que contiene referencias de los Git Hooks y que se distribuirán junto con la aplicación, posteriormente se podrán activar de diferentes maneras





## Estado

Este proyecto se encuentra finalizado





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





## Configuración



### Implementar comandos de análisis de todos los ejemplos con lintado

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

Todos los escenarios de uso serán explicados en el segúndo artículo



## Autor

* **Víctor Madrid**