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
    
    @Override
    public String toString(){
        String s1 = "╠════════════════════╬════════════════════╬════════════════════╬════════════════════╣\n";
        String s2 = "║"+RightPad(ID,20)+"║" + RightPad(DataType,20)+"║" + RightPad(DeclType,20)+"║" + RightPad(Value,20)+"║";
            
        return s1+s2;
    }
    
    public static String RightPad(String s, int length){
        StringBuilder sb;
        if(s != null)
            sb = new StringBuilder("  "+s);
        else
            sb = new StringBuilder("  null");
        while (sb.length() < length)
        {
            sb.append(' ');
        }
        return sb.toString();
    }
    
   
}
