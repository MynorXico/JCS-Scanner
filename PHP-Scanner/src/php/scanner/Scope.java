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
    public String name;
    
    public Scope() {
         //To change body of generated methods, choose Tools | Templates.
    }
    
    
    public boolean AddScope(Scope s, String scopeName){
        s.name = scopeName;
        boolean add = Scopes.add(s);
        
        return add;
    }
    
    public Scope(Scope parent){
        Parent = parent;
    }
    
    public oSymbol CheckSymbol(String str){
        Scope currentScope = this;
        
        if(currentScope.Table.Search(str)!=null){
            return currentScope.Table.Search(str);
        }else{
            while(currentScope.Parent != null){
                currentScope = currentScope.Parent;
                if(currentScope.Table.Search(str) != null){
                    return currentScope.Table.Search(str);
                }
            }
        }
        
        return null;
    }
    
    public Scope CheckScope(String s){
        Scope currentScope = this;
        if(currentScope.name.equals(s)){
            return currentScope;
        }else{
            while(currentScope.Parent != null){
                currentScope = currentScope.Parent;
                for(int i = 0; i < currentScope.Scopes.size(); i++){
                    if(currentScope.Scopes.get(i).name.equals(s)){
                        return currentScope.Scopes.get(i);
                    }
                }
            }
        }
        return null;

    }
    
    public void AddSymbol(String str, oSymbol os){
        if(CheckSymbol(str)!=null){       // Ya existe
            System.out.println("Ya existe un identificador con el nombre " + str);
        }else{
            Table.Add(str, os);
        }
    }
    public void GenerateSymbolTable(){
        Scope cs = this;
        
        
        cs.Table.ImprTabla();
        for(int i = 0; i < cs.Scopes.size(); i++){            
            //cs = cs.Scopes.get(i);
            
            ManejadorScopes.getInstancia().AddRowToTable("╠══════════════════════════════╬══════════════════════════════╬══════════════════════════════╬══════════════════════════════╣\n║                              ║           INICIA " + oSymbol.RightPad("          ║       "+cs.Scopes.get(i).name,15) +"                   ║                              ║");
            //cs.GenerateSymbolTable();
            cs.Scopes.get(i).GenerateSymbolTable();
            //if(cs.name!=null)
            ManejadorScopes.getInstancia().AddRowToTable("╠══════════════════════════════╬══════════════════════════════╬══════════════════════════════╬══════════════════════════════╣\n║                              ║       FIN    " + oSymbol.RightPad("              ║       "+ cs.Scopes.get(i).name,15) +"                   ║                              ║");            
        }
    }
}
