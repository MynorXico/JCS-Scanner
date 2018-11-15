/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package php.scanner;

import java.util.ArrayList;

/**
 *
 * @author mynor
 */
public class Tests {
    public static void main(String[] args){
        ManejadorScopes ms = new ManejadorScopes();
        ms.AgregarSimbolo("1", new oSymbol("1", "2", "3", "4"));
        
        
        //Integer.valueOf("2.0");
        
        String s = "1";
        String val = "Nuevo valor";
        if(ms.GetSimbolo(s) == null){
            System.out.println("El símbolo " + s + " no se encuentra en el ámbito actual.");
        }
        else{
            ms.GetSimbolo(s).Value = val;
        }
        
        String c = "==";
        String e1 = "2";
        String e2 = "2";
        String RESULT;
        if(c.equals("==")){
            RESULT = String.valueOf(e1.equals(e2));
        }else if(c.equals("<")){
            RESULT = String.valueOf(Double.valueOf(e1) < Double.valueOf(e2));
        }else if(c.equals(">")){
            RESULT = String.valueOf(Double.valueOf(e1) > Double.valueOf(e2));
        }else if(c.equals("<=")){
            RESULT = String.valueOf(Double.valueOf(e1) <= Double.valueOf(e2));
        }else if(c.equals("!=")){
            RESULT = String.valueOf(!e1.equals(e2));
        }
        
        Directory d = new Directory();
        
        d.AddFile("File1.frag");
        d.AddFile("File2.frag");
        d.AddFile("File3.frag");
        d.AddFile("File1.frag");
    }
    
    
}
