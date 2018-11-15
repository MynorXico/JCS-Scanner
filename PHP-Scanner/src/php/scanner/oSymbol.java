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
public class oSymbol {
    String ID;
    String DataType;
    String DeclType;
    String Value;
    ArrayList<oSymbol> Parameters = new ArrayList<oSymbol>();
    
    public oSymbol(String ID, String DataType, String DeclType, String Value){
        this.ID = ID;
        this.DataType = DataType;
        this.DeclType = DeclType;
        this.Value = Value;
    }
    
    public void AddParameters(oSymbol symbol){
        Parameters.add(symbol);
    }
}
