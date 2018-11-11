/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package php.scanner;

/**
 *
 * @author mynor
 */
public class Tests {
    public static void main(String[] args){
        ManejoScopes ms = new ManejoScopes();
        
        ms.AgregarSimbolo("1", new oSymbol());
        
        ms.NuevoScope();
        ms.AgregarSimbolo("1", new oSymbol());      // Ya existe un 1
        ms.AgregarSimbolo("2", new oSymbol());      // Se inserta 2
        ms.NuevoScope();
        ms.AgregarSimbolo("2", new oSymbol());      // Ya existe 2
        ms.AgregarSimbolo("3", new oSymbol());      // Se inserta 3
        ms.FinalizaScope();
        ms.FinalizaScope();
        ms.NuevoScope();
        ms.AgregarSimbolo("1", new oSymbol());      // Ya existe un 1
        ms.AgregarSimbolo("2", new oSymbol());      // Se inserta 2
        
    }
}
