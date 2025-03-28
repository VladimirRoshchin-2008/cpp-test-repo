grammar Formula;

main
    : expr EOF
    ;

expr
    : '(' expr ')'  # Parens
    | (ADD | SUB) expr  # UnaryOp
    | expr (MUL | DIV) expr  # BinaryOp
    | expr (ADD | SUB) expr  # BinaryOp
    | CELL  # Cell
    | NUMBER  # Literal
    ;


fragment INT: [-+]? UINT ;
fragment UINT: [0-9]+ ;
fragment EXPONENT: [eE] INT;
NUMBER
    : UINT EXPONENT?
    | UINT? '.' UINT EXPONENT?
    ;

ADD: '+' ;
SUB: '-' ;
MUL: '*' ;
DIV: '/' ;
CELL: [A-Z]+[0-9]+ ;
WS: [ \t\n\r]+ -> skip ;