/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package php.scanner;

import java.util.Dictionary;
import java.util.HashMap;
import java.lang.Object;
/**
 *
 * @author mynor
 */

public class SymbolTable {
    HashMap<String, oSymbol> Table = new HashMap();
    
    
    public oSymbol Search(String str){
        return Table.get(str);
    }
    
    public void Add(String str, oSymbol os){
        if(Table.get(str)!=null){
            System.out.println("Ya existe un identificador con el nombre " + str + " de tipo " + os.DataType + " declarando una " + os.DeclType);
            return;
        }
        Table.put(str, os);
        System.out.println("Se agregó correctamente el símbolo " + str + " de tipo " + os.DataType + " declarando una " + os.DeclType);
    }
    
    public void ImprTabla(){
        Table.forEach((k,v) -> 
            ManejadorScopes.getInstancia().AddRowToTable(v.toString())
        );
    }

   
}
