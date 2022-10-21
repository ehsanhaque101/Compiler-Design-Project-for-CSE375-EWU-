grammar first;
root : declaration function;
declaration : '*' declarationlist '<' declarationtype '>' ;
declarationlist : 'include' | 'define' ;
declarationtype : type '.' type ;

function : 'int' ID '{' '}' block;
block : '[' statement ']' ;
statement :(
 expressionstate
 | selectionstate
 | iterationstate
 | state_return
 | compoundstate
 | outputstate
 | breakstate
 |forstatement
)+
;

expressionstate : tspecifier expression ';' | ';' ;
state_return : 'return' expression ';' | 'return' type ';' ;
expression : expression operator expression | expression compare expression |  expression logical expression | '(' expression ')' | type ;
operator : 'plus' | 'minus' | 'multiply' | 'divide' |'*'|'+'|'-'|'/';
compare: 'equal to' | 'not equal' | 'greater than equal' | 'less than' | 'greater than' | 'less than equal' | '='| '>='|'<='|'=='|'<'|'>' ;
logical : '&&' | '||' ;
selectionstate : 'if' '(' expression ')' block | 'if' '(' expression ')' block 'else' block ;
compoundstate : '{' expression '}' ;
breakstate : 'break' ;
iterationstate : conditionalstate | forloop ;
conditionalstate : 'while' '{' expression '}' block ;
forloop : 'for' '(' loopexpr ')' forstatement ;
loopexpr : variable '=' type ',' variable compare type ',' variable increment  ;
forstatement:'{' state_return '}' | '{' state_return  ( type operator type  ) '}' | '{' (type operator type)+ '}'
               | '{' selectionstate '}'                                                    ;
outputstate : 'print' expression ';' ;
variable : ID ;
increment : '++' | '--' ;
type : ID | DIGIT ;
tspecifier : 'integer' | 'boolean' | 'character' ;




ID : [a-zA-Z]+ ;
DIGIT : [0-9]+ ;
WS : [ \t\r\n]+ -> skip ;