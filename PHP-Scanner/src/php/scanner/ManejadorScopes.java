/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package php.scanner;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author mynor
 */
public class ManejadorScopes {
    static Scope s;
    Scope CurrentScope;
    private static  ManejadorScopes instanciaUnica;
    ArrayList<String> PathsToRead = new ArrayList<String>();
    private static String TablaActual = "";
    
    
    public void AddRowToTable(String s){
        TablaActual = TablaActual + s+"\n";
    }
    
    public String GetTablaActual(){
        return TablaActual;
    }
    
    public static ManejadorScopes getInstancia(){
        if(instanciaUnica == null){
            instanciaUnica = new ManejadorScopes();
        }
        return instanciaUnica;
    }
    public static void ResetSymboltable(){
        instanciaUnica = new ManejadorScopes();
        TablaActual = "";
    }
    
    
    
    public ManejadorScopes(){
        s = new Scope();
        CurrentScope = s;
    }
    
    public void NuevoScope(String scopeName){
        Scope ns = new Scope(CurrentScope);
        CurrentScope.AddScope(ns, scopeName);
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
    public void CreateSymbolTable() throws IOException{
        String output = "";
        //String fileName = Directory.getInstancia().getPath()+"SymbolTable.txt";
        String fileName = "SymbolTable.txt";
        
        File f = new File(fileName);
        if(f.exists())
            f.delete();
        
        // writer.append(str);
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(fileName, true))) {
            // writer.append(str);
            ManejadorScopes.s.GenerateSymbolTable();
            writer.append("╔════════════════════╦════════════════════╦════════════════════╦════════════════════╗\n");
            writer.append("║       Symbol       ║      DataType      ║     SymbolType     ║       Value        ║\n");
            writer.append(ManejadorScopes.getInstancia().GetTablaActual());
            writer.append("╚════════════════════╩════════════════════╩════════════════════╩════════════════════╝");
            ManejadorScopes.getInstancia();
        }
    }
    public Scope BuscarAmbito(String s){
       
        
    
        return new Scope();
    }
    
    public oSymbol GetFuncion(String scope, String functionName){
        Scope ns = ManejadorScopes.getInstancia().CurrentScope.CheckScope(scope);
        if(ns == null)
            return null;
        return ns.Table.Search(functionName);    
        
    }
    
    
}
