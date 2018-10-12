/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package php.scanner;

/**
 *
 * @author mynor
 */
public class TError {
    public String lexema, tipo, descripcion;
    public int linea, columna;
    
    public TError(String le, int li, int co, String t, String de){
        lexema = le;
        linea = li;
        columna = co;
        tipo = t;
        descripcion = de;
    }
}
