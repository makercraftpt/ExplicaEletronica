# Exercício Extra E2 — Amplificador Não-Inversor com Tensão de Referência

## Circuito

```
         Ra (10 kΩ)
Vin ──── /\/\/ ────┐
                   A = (+)
Vref ──── /\/\/ ───┘          Rf (30 kΩ)
  2V     Rb (10 kΩ)    ┌───── /\/\/ ─────┐
                       │                  │
                      (-)   AmOp    Vo ───┘
                      (+) = A
                       │
                      R1 (10 kΩ)
                       │
                      GND
```

**Dados:** Ra = Rb = 10 kΩ, R1 = 10 kΩ, Rf = 30 kΩ, Vref = 2 V (DC), AmOp ideal com $V_{sat} = \pm 15$ V.  
$V_{in}(t) = V_p \sin(\omega t)$

---

## Enunciado

a) Determine a tensão no nó (+) em função de $V_{in}$ e $V_{ref}$.

b) Determine $V_o$ em função de $V_{in}$.

c) Para $V_{in} = 0$ V (DC), qual é o valor de $V_o$? O que representa fisicamente?

d) Para $V_{in}(t) = 2\sin(\omega t)$ V, represente graficamente $V_o(t)$. Indique máximo, mínimo e valor médio.

e) Calcule o $V_p$ máximo sem saturação.

---

## Resolução

### Conceito: Não-Inversor com Rede na Entrada

A entrada $(+)$ tem duas fontes: $V_{in}$ e $V_{ref}$ ligadas por resistências iguais — aplicar **superposição** para calcular $V^+$.

A saída realimenta a entrada $(-)$ através de Rf, com R1 para a GND — configuração não-inversora mas com offset introduzido pelo $V_{ref}$.

### a) Tensão no nó (+)

Por superposição (Ra = Rb = 10 kΩ):

$$V^+ = V_{in} \cdot \frac{R_b}{R_a + R_b} + V_{ref} \cdot \frac{R_a}{R_a + R_b} = \frac{V_{in}}{2} + \frac{V_{ref}}{2}$$

$$\boxed{V^+ = \frac{V_{in} + V_{ref}}{2} = \frac{V_{in} + 2}{2}}$$

### b) $V_o$ em função de $V_{in}$

Curto-circuito virtual: $V^- = V^+ = \dfrac{V_{in}+2}{2}$

KCL no nó $(-)$:

$$\frac{0 - V^-}{R_1} + \frac{V_o - V^-}{R_f} = 0$$

$$\frac{-V^-}{10\text{k}} + \frac{V_o - V^-}{30\text{k}} = 0$$

$$-3V^- + V_o - V^- = 0 \implies V_o = 4V^-$$

$$V_o = 4 \cdot \frac{V_{in} + 2}{2} = 2(V_{in} + 2)$$

$$\boxed{V_o = 2\,V_{in} + 4\ \text{V}}$$

> Ganho = 2×, offset DC = +4 V (vem da referência Vref = 2 V).

### c) Para $V_{in} = 0$ V

$$V_o = 2 \times 0 + 4 = 4\ \text{V}$$

Fisicamente: o circuito amplifica a referência. Com entrada nula, a saída fica no valor DC imposto por $V_{ref}$ amplificado pelo ganho do estágio $(-)$: $4 \times V^+ = 4 \times 1 = 4$ V.

### d) Gráfico para $V_{in}(t) = 2\sin(\omega t)$ V

$$V_o(t) = 2 \times 2\sin(\omega t) + 4 = 4\sin(\omega t) + 4\ \text{V}$$

| Grandeza | Valor |
|---|---|
| $V_{o,\text{max}}$ | $4 + 4 = +8$ V |
| $V_{o,\text{min}}$ | $-4 + 4 = 0$ V |
| $V_{o,\text{médio}}$ | $+4$ V |

```
Vo (V)
+8 ─      ·               ·
         · ·             · ·
        ·   ·           ·   ·
+4 ────·─────·─────────·─────·────  ← valor médio (DC offset)
              ·       ·
               ·     ·
 0 ─            · · ·

  Sinusóide centrada em +4V (nunca negativa para Vp=2V)
```

Sem saturação: $8\ \text{V} < 15\ \text{V}$ ✓

### e) $V_p$ máximo sem saturação

$$V_{o,\text{max}} = 2V_p + 4 \leq 15 \implies V_p \leq 5{,}5\ \text{V}$$
$$V_{o,\text{min}} = -2V_p + 4 \geq -15 \implies V_p \leq 9{,}5\ \text{V}$$

O limite mais restritivo é o positivo:

$$\boxed{V_{p,\text{max}} = 5{,}5\ \text{V}}$$

> **Nota:** O offset positivo (+4V) faz saturar primeiro do lado positivo.
