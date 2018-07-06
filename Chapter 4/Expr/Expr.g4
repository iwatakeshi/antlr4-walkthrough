grammar Expr;

/** The start rule; begin parsing here */
prog: stat+ ;

stat: expr NEWLINE
    | ID '=' expr NEWLINE
    | NEWLINE
    ;

expr: expr ('*' | '/') expr
    | expr ('+' | '-') expr
    | INT
    | ID
    | '(' expr ')'
    ;

// Match identifiers
ID: [a-zA-Z]+ ;
// Match integers
INT: [0-9]+ ;
// Return newlines to parser (is end-statement signal)
NEWLINE: '\r' ? '\n' ;
// Toss out whitespaces
WS: [ \t] -> skip ;
