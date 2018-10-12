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
import java_cup.runtime.Symbol;
import java.io.InputStreamReader;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.swing.text.BadLocationException;
import javax.tools.*;
/**
 *
 * @author Maynor
 */
public class miniPHP {
    public static void main(String[] args) throws IOException, BadLocationException, Exception{
        String root = new File(".").getCanonicalPath();
        String sourcePath = root + "\\php\\scanner\\";
        
        generarParser(sourcePath+"test1.cup");
        System.out.println("Parser Generado");
        File f1 = new File(sourcePath+"parser.java");
        while(!f1.exists()){
            f1 = new File(sourcePath+"parser.java");
        }
        
        generarLexer(sourcePath+"Lexer.flex");
        File f = new File(sourcePath+"Lexer.java");
        while(!f.exists()){
            f = new File(sourcePath+"Lexer.java");
        }
        System.out.println("Lexer succesfully generated");
        
        System.out.println(new BufferedReader(new InputStreamReader(Runtime.getRuntime().exec("javac -Xlint -cp lib/java-cup-11a.jar \""+sourcePath+"Interfaz.java\" \""+ sourcePath+"parser.java\" \"" + sourcePath+"sym.java\" \"" + sourcePath+"TError.java\" \"" + sourcePath+"Lexer.java\"").getInputStream())).readLine());       

        String command = "java php.scanner.Interfaz";
        f = new File(sourcePath+"Interfaz.class");
        while(!f.exists()){
            
        }
        try{
            System.out.println(new BufferedReader(new InputStreamReader(Runtime.getRuntime().exec(command).getInputStream())).readLine());       
        }catch(Exception e){
            System.out.println("Error compilando :S ");
        }
      
    }
    
    public static void generarLexer(String path){
        File file = new File(path);
        jflex.Main.generate(file);
    }
    public static void generarParser(String path) throws IOException, Exception{
        File file = new File(path);
        String[] parametrosASintactico = {"-parser", "parser", path};
        java_cup.Main.main(parametrosASintactico);
        
        moverArch("parser.java");
        moverArch("sym.java");      

    }
    
    
    
    
    public static void moverArch(String archNombre) {
        File arch = new File(archNombre);
        if (arch.exists()) {
            System.out.println("\n*** Moviendo " + arch + " \n***");
            Path currentRelativePath = Paths.get("");
            String nuevoDir = currentRelativePath.toAbsolutePath().toString()
                    + File.separator+"php" + File.separator + "scanner" + File.separator + arch.getName();
            System.out.println(nuevoDir);
            File archViejo = new File(nuevoDir);
            archViejo.delete();
            if (arch.renameTo(new File(nuevoDir))) {
                System.out.println("\n*** Generado " + archNombre + "***\n");
            } else {
                System.out.println("\n*** No movido " + archNombre + " ***\n");
            }

        } else {
            System.out.println("\n*** Codigo no existente ***\n");
        }
    }
}
