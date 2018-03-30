/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package php.scanner;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import javax.tools.*;
/**
 *
 * @author Maynor
 */
public class Main {
    public static void main(String[] args) throws IOException{
        String root = new File(".").getCanonicalPath()+"\\src";
        String sourcePath = root + "\\php\\scanner\\";
        
        generarLexer(sourcePath+"Lexer.flex");       
       
        
        Runtime.getRuntime().exec("javac "+sourcePath+"Interfaz.java "+ sourcePath+"Token.java " + sourcePath+"Lexer.java");
        String command = "java -cp " + root + " php.scanner.Interfaz";
        File f = new File(sourcePath+"Interfaz.class");
        while(!f.exists()){
        }
        try{
            System.out.println(new BufferedReader(new InputStreamReader(Runtime.getRuntime().exec(command).getInputStream())).readLine());       
        }catch(Exception e){
            
        }
        
        new File(sourcePath+"Interfaz.class").delete();
        new File(sourcePath+"Interfaz$1.class").delete();
        new File(sourcePath+"Interfaz$2.class").delete();
        new File(sourcePath+"Interfaz$3.class").delete();
        new File(sourcePath+"Lexer.class").delete();
        new File(sourcePath+"Lexer.java").delete();
        new File(sourcePath+"Token.class").delete();
       
    }
    
    public static void generarLexer(String path){
        File file = new File(path);
        jflex.Main.generate(file);
        
    }
}
