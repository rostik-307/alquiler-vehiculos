Aplicación de ALQUILER DE VEHICULOS

========== Datos de la página ==========

Una aplicacion para poder VISIONAR los coches que tiene una empresa
de alquiler de coches, siendo posible añadir coches y marcas
de coches, dado que la aplicación no será actualizada una vez creada

========== Esquema bbdd ==========

CAR
- id (interno de bbdd)
- idCar (autonum para mostrar (pulpo))
- model
- year
- color
- description
- observations
- brand -> extkey

BRAND
- id (interno de bbdd)
- idBrand (externo para ser referenciado autonum (pulpo x2))
- name
- details
- year

========== Mapa de navegación ==========

navegación mediante barra superior
```
TOPNAV
|| \
||  Home
| \
|  Car -> Create Car
|     \-> Tabla Car
 \
  Brand -> Create Brand
       \-> Tabla Brand
```
total ->    3 secciones principales
            2 de ellas con 2 subsecciones cada una

========== To Do List ==========

- Listado Coches
- Listado Marcas
- Creación Coches
- Creación Marcas
- Edicion en las tablas
- Borrado en las tablas
- Avisos con toast 
- Ver Detalles en las tablas
- Tests individuales para el rest
- Tests e2e en cypress