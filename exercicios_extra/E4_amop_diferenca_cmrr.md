# Exercício Extra E4 — Amplificador de Diferença e CMRR

## Circuito

```
         R1 (10 kΩ)              Rf (40 kΩ)
Va ──── /\/\/ ──── A ──────────── /\/\/ ────┐
                  (-)  AmOp                  │
                  (+)                  Vo ───┘
         R3 (10 kΩ)   │
Vb ──── /\/\/ ──── B  │
                   │  R4 (40 kΩ)
                   └── /\/\/ ──── GND
```

**Dados:** R1 = R3 = 10 kΩ, Rf = R4 = 40 kΩ, AmOp ideal com $V_{sat} = \pm 15$ V.

---

## Enunciado

a) Prove que $V_o = 4(V_b - V_a)$, aplicando as condições do AmOp ideal.

b) Calcule $V_o$ para $V_a = 3$ V, $V_b = 5$ V.

c) Calcule $V_o$ para $V_a = V_b = 4$ V (sinal de modo comum puro). O que conclui?

d) Determine o CMRR do circuito (com resistências perfeitamente casadas).

e) **(Tolerâncias)** Se R4 = 38 kΩ (em vez de 40 kΩ) e o resto inalterado, calcule o ganho diferencial $A_d$ e o ganho de modo comum $A_{cm}$. Qual o novo CMRR em dB?

---

## Resolução

### Conceito: Amplificador de Diferença

Amplifica a **diferença** entre duas tensões, rejeitando o que é comum a ambas (ruído, interferência, offset DC). É a base do CMRR.

### a) Prova de $V_o = 4(V_b - V_a)$

**Passo 1 — Tensão em (+):**

$V_b$ alimenta o divisor R3/R4:

$$V^+ = V_b \cdot \frac{R_4}{R_3 + R_4} = V_b \cdot \frac{40}{50} = 0{,}8\,V_b$$

**Passo 2 — Curto-circuito virtual:**

$$V^- = V^+ = 0{,}8\,V_b$$

**Passo 3 — KCL no nó (−):**

$$\frac{V_a - V^-}{R_1} + \frac{V_o - V^-}{R_f} = 0$$

$$\frac{V_a - 0{,}8V_b}{10\text{k}} + \frac{V_o - 0{,}8V_b}{40\text{k}} = 0$$

$$4(V_a - 0{,}8V_b) + V_o - 0{,}8V_b = 0$$

$$V_o = -4V_a + 3{,}2V_b + 0{,}8V_b = -4V_a + 4V_b$$

$$\boxed{V_o = 4(V_b - V_a)}$$

### b) Para $V_a = 3$ V, $V_b = 5$ V

$$V_o = 4(5 - 3) = 4 \times 2 = \boxed{8\ \text{V}}$$

### c) Para $V_a = V_b = 4$ V (modo comum)

$$V_o = 4(4 - 4) = \boxed{0\ \text{V}}$$

O circuito **rejeita completamente** o sinal de modo comum — o que é igual nas duas entradas não aparece na saída. Isto é exactamente o objectivo do amplificador diferencial.

### d) CMRR com resistências casadas

Com resistências perfectamente casadas:
- Ganho diferencial: $A_d = R_f/R_1 = 40/10 = 4$
- Ganho de modo comum: $A_{cm} = 0$ (demonstrado em c)

$$\text{CMRR} = \left|\frac{A_d}{A_{cm}}\right| = \frac{4}{0} = \infty$$

$$\text{CMRR}_{dB} = 20\log_{10}(\infty) = \infty\ \text{dB}$$

> Na prática, resistências reais têm tolerâncias → CMRR finito.

### e) Com R4 = 38 kΩ (tolerância de −5%)

**Novo $V^+$:**

$$V^+ = V_b \cdot \frac{38}{10 + 38} = V_b \cdot \frac{38}{48} = 0{,}792\,V_b$$

**KCL no nó (−)** (R1, Rf inalterados):

$$4(V_a - 0{,}792V_b) + V_o - 0{,}792V_b = 0$$

$$V_o = -4V_a + 3{,}168V_b + 0{,}792V_b = -4V_a + 3{,}96V_b$$

**Ganhos diferencial e de modo comum:**

Usando $V_a = V_{cm} - V_d/2$ e $V_b = V_{cm} + V_d/2$:

$$V_o = -4\!\left(V_{cm} - \frac{V_d}{2}\right) + 3{,}96\!\left(V_{cm} + \frac{V_d}{2}\right)$$

$$V_o = \underbrace{(-4 + 3{,}96)}_{A_{cm}}\,V_{cm} + \underbrace{\left(2 + 1{,}98\right)}_{A_d}\,V_d$$

$$A_{cm} = -0{,}04 \qquad A_d = 3{,}98$$

$$\text{CMRR} = \left|\frac{3{,}98}{0{,}04}\right| = 99{,}5$$

$$\boxed{\text{CMRR}_{dB} = 20\log_{10}(99{,}5) \approx 40\ \text{dB}}$$

> Uma tolerância de apenas 5% numa resistência faz o CMRR cair de ∞ para 40 dB. Em instrumentação de precisão (ECG, sensores) usa-se 0,1% ou melhor para atingir CMRR > 80 dB.
