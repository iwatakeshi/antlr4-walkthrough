/**
  * Grammers always start with a grammar header. 
  * This grammar is called ArrayInit and must match the filename: ArrayInit.g4
  */
grammar ArrayInit;

/** A rule called init that matches comma-separated values between {...}. */
init  : '{' value (',' value)* '}'  ; // must match at least one

/** A value can be either a nested array/struct or a simple integer (INT) */
value : init
      | INT
      ;

/** Parser rules start with lowercase letters, lexer rules start with uppercase */
INT   : [0-9]+  ;             // Define token INT as one or more digits
WS    : [ \t\r\n]+ -> skip  ; // Define whitespace rule, toss it out