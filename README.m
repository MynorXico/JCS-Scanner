
Universidad Rafael Landívar</br>
Compiladores </br>
Proyecto No. 2</br>

# Analizador Léxico
El proyecto consiste en un analizador sintáctico para el lenguaje DECAF utilizando la herramienta JFlex.
## Manual de Usuario

A continuación se describe la forma de uso del software "DECAF". El uso del mismo se divide en varias etapas:

 - Iniciando la aplicación
 - Cargando archivo .frag
 - Analizando el archivo
### Iniciando la Aplicación

La aplicación debe ser ejecutada por medio de la línea de comandos o haciendo doble clic sobre el fichero .jar
#### Doble clic sobre fichero .JAR
Ubicarse en la carpeta ```src``` del proyecto y hacer doble clic sobre el archivo jflex.jar
#### Línea de comandos
Ubicarse en la carpeta ```src``` del proyecto y ejecutar el comando:
```
java -cp miniCS.jar;lib/*;. php.scanner.Interfaz
```
Este comando se encarga de ejecutar ``` minic.jar``` junto a sus dependencias.
Al ejecutar el programa  ```minic.jar``` se genera el Lexer ``` Lexer.java``` ,  ``` Parser.java ```el parser  y  se abre ```Interfaz.java``` 

### Cargando el archivo *".frag"*
Un archivo .frag puede ser cargado desde el menú *File* haciendo clic el botón "Abrir" . Después de lo cual se abrirá un cuadro solicitándole abrir el archivo deseado.</br>

Todo lo que debe hacer es seleccionar el archivo y hacer clic sobre el botón abrir.
Inmediatamente después de haber abierto el archivo, se llenará un jTextArea
</br>
El jTextArea contendrá el código C# sin modificaciones.

### Analizando el archivo
Para realizar en análisis sintáctico del archivo, basta con hacer clic sobre el botón con la etiqueta "Analize".
#### Errores no corregibles:
En caso de que el archivo de entrada contenga errores que no pueden ser corregidos, se muestra un cuadro de diálogo.</br>

#### Errores corregibles o ningún error
En caso de que se encuentren errores que pueden ser corregidos. Se marcan con amarillo en el área de texto de la derecha y se muestran los errores y el archivo de salida será un archivo indicando los tokens y/o errores encontrados; este se guardará en la misma ruta del archivo cargado pero con extensión  ```.out```.
### Consola
El programa cuenta también con una consola en la parte inferior. Esta consola se utiliza para indicar los tokens y/o errores que se reconocieron del archivo.
## IDE Utilizado
El entorno de desarrollo utilizado para construir la aplicación fue NetBeans IDE 8.2.
## Notas sobre el autor
Considero que el proyecto desarrollado funciona correctamente porque fue sometido a varias pruebas y en todas fue un éxito, cumpliendo así con todas las especificaciones que el enunciado del proyecto solicita. Además es un programa robusto porque realiza las tareas de manera eficiente y presenta de una manera visual el manejo de errores; facilitando al desarrollador la identifiación de los mismos.
## Autor

* **Mynor Ottoniel Xico Tzian**
