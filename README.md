
Universidad Rafael Landívar</br>
Lenguajes Formales y Autómatas</br>
Proyecto No. 1</br>

# Analizador Léxico
El proyecto consiste en un analizador léxico para el lenguaje PHP utilizando la herramienta JFlex.
## Manual de Usuario

A continuación se describe la forma de uso del software "miniPHP". El uso del mismo se divide en varias etapas:

 - Iniciando la aplicación
 - Cargando archivo .php
 - Analizando el archivo
### Iniciando la Aplicación

La aplicación debe ser ejecutada por medio de la línea de comandos

#### Línea de comandos
Ubicarse en la carpeta ```src``` del proyecto y ejecutar el comando:
```
java -cp miniPHP.jar;lib/*;. php.scanner.miniPHP
```
Este comando se encarga de ejecutar ``` miniPHP.jar``` junto a sus dependencias.
Al ejecutar el programa  ```miniPHP.jar``` se genera el Lexer ``` Lexer.java``` y  se abre ```Interfaz.java``` 

Después de ejecutado el comando anterior, debería mostrarse en pantalla algo similar a esto:  </br>
![enter image description here](https://lh3.googleusercontent.com/tb4tjexpcixJA-zJI7PjweNv9oHR_Myp72giCUq02y5ITz66NmFjnXvDsMQNnwn80jzTfg502hYA)
</br>
### Cargando el archivo *".php"*
Un archivo .php puede ser cargado desde el menú *File* haciendo clic el botón "Abrir" . Después de lo cual se abrirá un cuadro solicitándole abrir el archivo deseado.</br>
![OpenFileDialog](https://lh3.googleusercontent.com/nZ1UitJXhV7vpIy_Tf91ZGkyGeGve1Soknj9x5jhQE85te80HOW26if7nQYd1LtNzlxaCNMCRmAH)
</br>
Todo lo que debe hacer es seleccionar el archivo y hacer clic sobre el botón abrir.
Inmediatamente después de haber abierto el archivo, se llenarán un jTextArea que se verán similar a esto:</br>
![enter image description here](https://lh3.googleusercontent.com/TOCROeYTZu8VdHW7J6r5mXX2o1w58J_BYXLpKfXPHBuM7lUUsH148yM-5En0gXxZr7Wc-zGn9i3I)
</br>
El jTextArea contendrá el código PHP sin modificaciones.

### Analizando el archivo
Para realizar en análisis léxico del archivo, basta con hacer clic sobre el botón con la etiqueta "Analize".
#### Errores no corregibles:
En caso de que el archivo de entrada contenga errores que no pueden ser corregidos, se muestra el siguiente cuadro de diálogo.</br>
![Mensaje de diálogo mostrando error. ](https://lh3.googleusercontent.com/TRXp--goFfo31ZrQ4IGTxXgKcl6WIQ-UimXZiHMczQ7uD6tU1u4nzRLQzmtWot8EeBHnmulGX8Gi)
</br>
El archivo ```errorslog.txt``` se encuentra en la carpeta ```src``` del proyecto y contiene una línea por cada error encontrado, indicando la línea y columna del error.
Los archivos se mostrarán marcados con rojo en el  área de texto de la derecha.</br>
![errorslog.txt](https://lh3.googleusercontent.com/3SmsfXS2Wde5Vi5Zlyfc9aiG_8tT1IJHvB_NXOepTFFLtEPg2aAi8R5faL11P6MK_FXWm5rz8gq_)
</br>
#### Errores corregibles o ningún error
En caso de que se encuentren errores que pueden ser corregidos. Se marcan con amarillo en el área de texto de la derecha y se muestran los errores en  ```errorslog.txt``` y el archivo de salida será una copia del de entrada pero con los errores corregidos y se guardará en la misma ruta del archivo cargado pero con extensión  ```.out```.</br>
![enter image description here](https://lh3.googleusercontent.com/nip0RedJumyXsat7Y-n0WdN5fF9JtPSpuLMjTWpuyjr0J7tf3g55M3JVzfjDgaPOMeQjW6c811b6)
</br>
### Consola
El programa cuenta también con una consola en la parte inferior. Esta consola se utiliza para indicar los tokens que se reconocieron del archivo.
## IDE Utilizado
El entorno de desarrollo utilizado para construir la aplicación fue NetBeans IDE 8.2.
## Notas sobre el autor
Considero que el proyecto desarrollado funciona correctamente porque fue sometido a varias pruebas y en todas fue un éxito, cumpliendo así con todas las especificaciones que el enunciado del proyecto solicita. Además es un programa robusto porque realiza las tareas de manera eficiente y presenta de una manera visual el manejo de errores; facilitando al desarrollador la identifiación de los mismos.
## Autor

* **Mynor Ottoniel Xico Tzian**
