/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package php.scanner;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.Reader;
import java.util.ArrayList;
import java_cup.runtime.Scanner;

/**
 *
 * @author mynor
 */
public class Directory {
    private static ArrayList<String> FilesToRead = new ArrayList<String>();
    private static String Path;
    private static String CurrentFile;
    
    private static Directory instanciaUnica;
    
    
    public static String GetCurrentFile(){
        return instanciaUnica.CurrentFile;
    }
    public static void SetCurrentFile(String s){
        instanciaUnica.CurrentFile = s;
    }
    
    public static boolean AddFile(String fileName){
        File f = new File(Path+fileName);
        if(!f.exists()){
            System.out.println("No se encuentra el archivo " + Path+fileName);
            return false;
        }
        if(!FilesToRead.contains(Path+fileName)){
            System.out.println("Se agregó la librería " + Path + fileName);
            FilesToRead.add(Path+fileName);
            instanciaUnica.CurrentFile = fileName;
            return true;
        }else{
            System.out.println("La librería " + fileName + " se definió previamente.");
            return false;
        }
    }
    
    
    public static  void setPath(String newPath){
        Path = newPath;
    }
    public static String getPath(){
        return Path;
    }
    public static Directory getInstancia(){
        if(instanciaUnica == null){
            instanciaUnica = new Directory();
        }
        return instanciaUnica;
    }
    
    public static void resetDirectory(){
        instanciaUnica = new Directory();
    }
    
    public static void CheckSemantics(String file) throws FileNotFoundException, Exception{
        
        File f = new File(Path+file);
        if(!f.exists()){
            System.out.println("Error al leer el archivo " + Path+file);
        }
        Reader reader = new BufferedReader(new FileReader(Path+file));        
        
        Lexer lexer = new Lexer(reader);
        parser p = new parser(lexer);
        p.parse();
        CurrentFile = "";
    }
}
