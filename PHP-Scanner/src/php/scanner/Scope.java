/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package php.scanner;

import java.util.ArrayList;
import java.util.Spliterator;
import java.util.function.Consumer;
import java.util.function.Predicate;
import java.util.stream.Stream;

/**
 *
 * @author mynor
 */
public class Scope {
    public ArrayList<Scope> Scopes = new ArrayList();
    public Scope Parent;
    SymbolTable Table = new SymbolTable();

    public Scope() {
         //To change body of generated methods, choose Tools | Templates.
    }
    
    
    public boolean AddScope(Scope s){
        boolean add = Scopes.add(s);
        return add;
    }
    
    public Scope(Scope parent){
        Parent = parent;
    }
    
    public boolean CheckSymbol(String str){
        Scope currentScope = this;
        
        if(Table.Search(str)== null){       // No se encuentra en el "scope" actual
            while(currentScope.Parent!=null){               // Si no está en la raíz
                currentScope = currentScope.Parent;
                if(currentScope.CheckSymbol(str)){
                    return true;
                }
            }
        }else{
            return true;
        }
        
        return false;
    }
    
    public void AddSymbol(String str, oSymbol os){
        if(CheckSymbol(str)){       // Ya existe
            System.out.println("Ya existe un identificador con el nombre " + str);
        }else{
            Table.Add(str, os);
        }
    }
}
