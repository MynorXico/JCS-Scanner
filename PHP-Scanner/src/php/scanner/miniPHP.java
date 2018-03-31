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
public class miniPHP {
    public static void main(String[] args) throws IOException{
        String root = new File(".").getCanonicalPath()+"\\src";
        String sourcePath = root + "\\php\\scanner\\";
        
        generarLexer(sourcePath+"Lexer.flex");       
       
        File f = new File(sourcePath+"Lexer.java");
        while(!f.exists()){
            
        }
        System.out.println("Lexer succesfully generated");
        System.out.println(new BufferedReader(new InputStreamReader(Runtime.getRuntime().exec("javac "+sourcePath+"Interfaz.java "+ sourcePath+"Token.java " + sourcePath+"Lexer.java").getInputStream())).readLine());       

        String command = "java -cp " + root + " php.scanner.Interfaz";
        f = new File(sourcePath+"Interfaz.class");
        while(!f.exists()){
        }
        try{
            System.out.println(new BufferedReader(new InputStreamReader(Runtime.getRuntime().exec(command).getInputStream())).readLine());       
        }catch(Exception e){
            
        }
        
        
       
    }
    
    public static void generarLexer(String path){
        File file = new File(path);
        jflex.Main.generate(file);
        
    }
}
