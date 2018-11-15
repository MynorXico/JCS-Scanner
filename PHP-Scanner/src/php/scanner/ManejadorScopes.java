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
public class ManejadorScopes {
    Scope s;
    Scope CurrentScope;
    private static  ManejadorScopes instanciaUnica;
    ArrayList<String> PathsToRead = new ArrayList<String>();
    
    public static ManejadorScopes getInstancia(){
        if(instanciaUnica == null){
            instanciaUnica = new ManejadorScopes();
        }
        return instanciaUnica;
    }
    public static void ResetSymboltable(){
        instanciaUnica = new ManejadorScopes();
    }
    
    
    
    public ManejadorScopes(){
        s = new Scope();
        CurrentScope = s;
    }
    
    public void NuevoScope(){
        Scope ns = new Scope(CurrentScope);
        CurrentScope.AddScope(ns);
        CurrentScope = ns;
        System.out.println("Se creó un nuevo ámbito.");
    }
    
    public void FinalizaScope(){
        CurrentScope = CurrentScope.Parent;
        System.out.println("Se cerró un ámbito. ");
    }
    
    public void AgregarSimbolo(String s, oSymbol o){
        CurrentScope.AddSymbol(s,o);
    }
    
    public oSymbol GetSimbolo(String s){
        if(CurrentScope.CheckSymbol(s) != null){
        }
        return CurrentScope.CheckSymbol(s);
    }
}
