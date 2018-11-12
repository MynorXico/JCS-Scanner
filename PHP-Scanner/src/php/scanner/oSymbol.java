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
public class oSymbol {
    String ID;
    String DataType;
    String DeclType;
    String Value;
    
    public oSymbol(String ID, String DataType, String DeclType, String Value){
        this.ID = ID;
        this.DataType = DataType;
        this.DeclType = DeclType;
        this.Value = Value;
    }
}
