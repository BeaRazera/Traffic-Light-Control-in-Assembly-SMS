**Português** | [ English ](README.md)

# Controle de Semáforo Inteligente em Assembly (SMS)

Projeto desenvolvido em linguagem Assembly para a arquitetura x86 no simulador educacional SMS (Simple Machine Simulator). O sistema gerencia o fluxo de um semáforo de veículos e pedestres acionado por entrada do usuário.

## Funcionalidades

- **Controle de Sinalização:** Alterna os estados das luzes dos semáforos de veículos e pedestres via portas de I/O.
- **Validação de Entrada:** Monitora o teclado aguardando a tecla de solicitação do pedestre ('P' ou 'p').
- **Contagem Regressiva:** Exibe a temporização dos sinais em um display de 7 segmentos utilizando tabelas de memória.

## Mapeamento de Periféricos (I/O)

| Porta | Periférico | Descrição |
| :--- | :--- | :--- |
| 00 | Teclado | Leitura da entrada do usuário (`IN 00`) |
| 01 | Semáforo | Sinalização dos LEDs via máscara de bits (`OUT 01`) |
| 02 | Display 7 Seg | Exibição numérica da contagem (`OUT 02`) |

## Conceitos de Baixo Nível Utilizados

- Manipulação de registradores de uso geral (`AL`, `BL`)
- Instruções de Entrada e Saída de Dados (`IN`, `OUT`)
- Desvios condicionais e incondicionais (`JMP`, `JZ`, `JNZ`)
- Chamadas de sub-rotinas e retorno (`CALL`, `RET`)
- Alocação direta de tabelas em memória (`ORG`, `DB`)

## Como Executar

1. Abra o ambiente **Simple Machine Simulator (SMS)**.
2. Carregue o código no editor do simulador.
3. Monte o código e inicie a execução.
4. No periférico de **Teclado**, digite a letra `P` para acionar o ciclo de travessia.
