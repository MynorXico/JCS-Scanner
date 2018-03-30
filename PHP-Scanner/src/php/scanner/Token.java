/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package php.scanner;

/**
 *
 * @author Maynor
 */
public enum Token {
    ID, EQUALS, PLUS, TIMES, ASSIGN, MINUS, ERROR,
    AROP, CMPOP, LOGOP, ASSOP, INCDECOP, PRNTHSS, CURLY,
    BRACKET, SEMICOLON, COMMA, BOOL, INT, DOUBLE, STRING,
    VARID, CONSTANT, CTRLSTRCT, RSRVDVAR, COMMENT, DB, FUNC,
    NEWLINE, BLANK, MAGCONSTANT, RSRVWRDS, PHP, CONCAT
}
