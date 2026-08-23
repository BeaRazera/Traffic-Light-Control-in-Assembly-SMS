JMP Inicio   ;desvio para o inicio do programa, porque dá erro caso inicie na tabela

ORG 10
DB 9F        ;3 no display de 7 segmentos
DB B7        ;2 no display de 7 segmentos
DB 0B        ;1 no display de 7 segumentos
DB FF        ;condição de parada

ORG 20
DB DD        ;5 no display de 7 segmentos
DB 4F        ;4 no display de 7 segmentos
DB 9F        ;3 no display de 7 segumentos
DB B7        ;2 no display de 7 segmentos
DB 0B        ;1 no display de 7 segmentos
DB FF        ;condição de parada

Inicio:
MOV AL,30    ;liga a luz verde na sinaleira à esquerda e liga a luz vermelha na sinaleira à direita, 
             ;indicando qual é a de carro e qual é a de pedestre pela descrição da atividade.
             ;(0011 0000) é 30 em hexa e cada "1" liga uma luz da sinaleira
OUT 01       ;periférico sinaleira

Repetir:
IN 00        ;chama o teclado para o usuário digitar "P"
CMP AL,50    ;compara o valor digitado com o valor de "P" em hexa, fazendo uma subtração
JZ Prox      ;se o valor for zero (o que indica que os valores são iguais), faz um desvio para Prox
CMP AL,70    ;compara o valor digitado com o valor de "p" em hexa, fazendo uma subtração
JNZ Repetir  ;se o valor não for zero (o que indica que os valores são diferentes), faz um desvio para Repetir
             ;(validar de novo)
             ;em resumo, caso não seja "p" ou "P", o programa entra nesse loop e só sai caso sejam digitados corretamente

Prox:
MOV AL,50    ;liga a luz amarela na sinaleira à esquerda e a luz vermelha permanece na sinaleira à direita
             ;(0101 0000), 50 em hexa
OUT 01       ;periférico sinaleira

Display:     ;essa label serve para "limpar" o display de 7 segmentos
MOV AL, 0    ;limpa o display 1
OUT 02       ;periferico do display de 7 seg
MOV AL, 1    ;limpa o display 2
OUT 02       ;periferico do display de 7 seg

MOV BL,10    ;atribui no display a tabela que está no endereço 10 (3, 2, 1)

CALL 50      ;chama a função que está no endereço 50

ORG 50       ;endereço 50
Loop:
MOV AL,[BL]  ;o valor que está no endereço BL é copiado em AL
OUT 02       ;abre o display de 7 segmentos com o valor de AL
CMP AL, 0B   ;se AL = 0B (1), continua o programa
JZ Continua  ;continua o programa/critério de parada
INC BL       ;incrementa BL para próxima posição (BL + 1)
JMP Loop     ;desvia para loop
RET          ;retorna para CALL

Continua:
MOV AL,84    ;liga a luz vermelha na sinaleira à esquerda e a luz verde na sinaleira à direita
             ;(1000 0100), 84 em hexa
OUT 01       ;periférico sinaleira

Display2:
MOV AL, 0    ;limpa o display 1
OUT 02       ;periferico do display de 7 seg
MOV AL, 1    ;limpa o display 2
OUT 02       ;periferico do display de 7 seg

MOV BL,20    ;atribui no display a tabela que está no endereço 20 (5, 4, 3, 2, 1)

CALL 80      ;chama a função que está no endereço 50

ORG 80       ;endereço 80
Loop2:
MOV AL,[BL]  ;o valor que está no endereço BL é copiado em AL
OUT 02       ;abre o display de 7 segmentos com o valor de AL
CMP AL, 0B   ;se AL = 0B (1), continua o programa
JZ Fim       ;continua o programa/critério de parada
INC BL       ;incrementa BL para próxima posição (BL + 1)
JMP Loop2    ;desvia para loop
RET          ;retorna para CALL

Fim:
MOV AL, 0    ;limpa o display 1
OUT 02       ;periferico do display de 7 seg
MOV AL, 1    ;limpa o display 2
OUT 02       ;periferico do display de 7 seg

MOV AL,30    ;as luzes retornam para config inicial
OUT 01       ;periférico sinaleira

END
