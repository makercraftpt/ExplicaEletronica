# Exercício Extra E3 — Rectificador de Precisão (AmOp + Díodo)

## Circuito

```
                    ┌──── D1 ────┐
                    │  (A)  (K)  │
Vin ─────────────── (+)          │
                    AmOp         Vo ──── RL (10 kΩ) ──── GND
                    (-)──────────┘
```

Díodo D1: ânodo no output do AmOp, cátodo na saída Vo = entrada (−).  
**Dados:** $V_D = 0{,}5$ V (modelo tensão constante), $V_{sat} = \pm 12$ V, $R_L = 10\ \text{k}\Omega$.  
$V_{in}(t) = 3\sin(\omega t)$ V

---

## Enunciado

a) Analise o circuito para $V_{in} > 0$: o díodo conduz? Determine $V_o$ e a tensão na saída do AmOp.

b) Analise o circuito para $V_{in} < 0$: o díodo conduz? Determine $V_o$.

c) Represente graficamente $V_{in}(t)$ e $V_o(t)$ para $V_{in} = 3\sin(\omega t)$ V.

d) Compare com um rectificador simples (sem AmOp): qual é a diferença prática? Para que serve o AmOp?

e) (Desafio) Qual a tensão máxima que aparece na saída do AmOp (antes do díodo)?

---

## Resolução

### Conceito: Super-Díodo (Rectificador de Precisão)

Num díodo simples, a tensão de condução ($V_D \approx 0{,}5$ V) cria uma zona morta — sinais pequenos não passam. O AmOp em malha fechada **compensa automaticamente** a queda no díodo: eleva a sua saída por $V_D$ para garantir que $V_o = V_{in}$ exactamente.

### a) Para $V_{in} > 0$

O AmOp tenta igualar $V^- = V^+ = V_{in} > 0$.  
Para tal, a sua saída sobe até D1 conduzir.

**D1 conduz** quando: $V_{\text{AmOp\_out}} = V_o + V_D$

Com D1 a conduzir, a malha fecha e o curto-circuito virtual actua:

$$V^- = V^+ = V_{in}$$

Como $V^- = V_o$ (realimentação directa):

$$\boxed{V_o = V_{in} \quad \text{(para } V_{in} > 0\text{)}}$$

A saída do AmOp é:

$$V_{\text{AmOp\_out}} = V_o + V_D = V_{in} + 0{,}5\ \text{V}$$

> O AmOp "eleva" a sua saída 0,5 V para compensar o díodo. A tensão em $V_o$ é exactamente $V_{in}$ — sem perda.

### b) Para $V_{in} < 0$

O AmOp tenta baixar $V^-$ abaixo de 0 V.  
Mas D1 (ânodo no output, cátodo em $V_o$) fica **inversamente polarizado** quando a saída do AmOp é negativa.

Com D1 bloqueado:
- Sem corrente no díodo → sem corrente em $R_L$ (AmOp ideal, corrente nula em $V^-$)
- $V_o = 0$ V (sem corrente, sem tensão em $R_L$)

O AmOp satura negativamente:

$$V_{\text{AmOp\_out}} = -V_{sat} = -12\ \text{V}$$

$$\boxed{V_o = 0\ \text{V} \quad \text{(para } V_{in} < 0\text{)}}$$

### c) Gráfico

```
Vin / Vo (V)
+3 ─     ·               ·
        · ·  Vo=Vin      · ·
       ·   ·  (Vin>0)   ·   ·
 0 ───·─────·───────────·─────·──> t
            │           │
            │  Vo=0     │
            └───────────┘
            (Vin<0: Vo=0)

  Vo é a meia-onda positiva de Vin, sem zona morta.
  Vin a tracejado, Vo a cheio.
```

### d) Comparação com rectificador simples

| | Rectificador simples (só díodo) | Rectificador de precisão (AmOp + díodo) |
|---|---|---|
| Condução | $V_{in} > V_D = 0{,}5$ V | $V_{in} > 0$ V |
| $V_o$ quando conduz | $V_{in} - 0{,}5$ V | $V_{in}$ (exacto) |
| Zona morta | 0 a 0,5 V | Nenhuma |
| Sinais pequenos ($< 0{,}5$ V) | Bloqueados | Rectificados correctamente |

**O AmOp serve para:** eliminar a zona morta do díodo, permitindo rectificar sinais de qualquer amplitude (incluindo mV).

### e) Tensão máxima na saída do AmOp

Para $V_{in} > 0$: $V_{\text{AmOp\_out}} = V_{in} + V_D$

$$V_{\text{AmOp\_out,max}} = 3 + 0{,}5 = 3{,}5\ \text{V} \quad \ll 12\ \text{V} \checkmark$$

Para $V_{in} < 0$: $V_{\text{AmOp\_out}} = -12\ \text{V}$ (saturação)

> Quando $V_{in}$ volta a ser positivo após um semiciclo negativo, o AmOp tem de recuperar de $-12$ V até $\approx 0{,}5$ V antes de D1 começar a conduzir — existe um pequeno atraso. Para frequências altas isto limita o desempenho.
