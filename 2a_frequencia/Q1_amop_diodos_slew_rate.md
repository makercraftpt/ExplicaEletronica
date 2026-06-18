# 2ª Frequência — Pergunta 1: AmOp com Díodos e Slew-Rate

## Circuito

```
              Vr1 = 1.5V
               |
              [D1] ← anode em A, cathode em Vr1
               |
 V1 ─── R(20Ω) ─── A ─────────── (+)┐
              |                      AmOp ── B = vB
             [D2] ← anode em Vr2,   (-) ┤
              |      cathode em A         │
             Vr2 = -3V            R2(4kΩ)─┘
                                   R1(1kΩ)
                                   GND
```

- $V_{sat} = \pm12$ V, Slew-Rate = 1.2 V/µs
- $V_D = 0.5$ V (modelo de tensão constante)
- AmOp: não-inversor com $R_1 = 1\ \text{k}\Omega$, $R_2 = 4\ \text{k}\Omega$

---

## Conceito

**Díodos como clipper (limitador):** os díodos limitam a tensão no nó A a uma janela de valores. D1 previne que VA suba acima de um limite; D2 previne que VA desça abaixo de outro. Fora dessa janela, o díodo relevante conduz e "agarra" a tensão.

---

## a) vB em função de vA

O AmOp está em **configuração não-inversora**:

**Considerações do AmOp ideal:**
1. $i^+ = i^- = 0$ (corrente nula nas entradas)
2. $V^+ = V^-$ (curto-circuito virtual)

$V^+ = v_A$, $V^- = v_B \cdot \frac{R_1}{R_1 + R_2} = \frac{v_B}{5}$

Igualar: $v_A = \frac{v_B}{5}$

$$\boxed{v_B = 5\,v_A \quad \text{(para } -12\ \text{V} < v_B < +12\ \text{V)}}$$

Com saturação:

$$v_B = \begin{cases} +12\ \text{V} & \text{se } v_A \geq +2.4\ \text{V} \\ 5\,v_A & \text{se } -2.4\ \text{V} < v_A < +2.4\ \text{V}\\ -12\ \text{V} & \text{se } v_A \leq -2.4\ \text{V} \end{cases}$$

---

## b) Valores máximo e mínimo de vA

Com AmOp ideal (Ri = ∞): não flui corrente por R=20Ω quando os díodos estão ao corte → **vA = V1** (sem carga).

**D1** (anode em A, cathode em Vr1=1.5V): conduz quando $v_A > V_{r1} + V_D$:
$$v_{A,max} = V_{r1} + V_D = 1.5 + 0.5 = \boxed{+2\ \text{V}}$$

**D2** (anode em Vr2=−3V, cathode em A): conduz quando $V_{r2} - v_A > V_D$, ou seja, $v_A < V_{r2} - V_D$:
$$v_{A,min} = V_{r2} - V_D = -3 - 0.5 = \boxed{-3.5\ \text{V}}$$

**Comparação com saturação do AmOp:**
- Saturação positiva ocorreria com $v_A = +2.4$ V, mas D1 limita a $+2.0$ V → **não satura positivamente** ($v_{B,max} = 5 \times 2 = 10$ V)
- Saturação negativa ocorre com $v_A = -2.4$ V, antes do limite do D2 (−3.5 V) → **satura negativamente** a $v_B = -12$ V quando $-3.5 < v_A < -2.4$ V

---

## c) Gráficos de V1(t) e vB(t)

$V_1(t) = 5\sin(2\pi \times 4000\,t)$ V; $T = 250\ \mu\text{s}$

Limiares da onda:
| Tensão | Tempo (ângulo) |
|---|---|
| $V_1 = +2$ V → D1 conduz | $\omega t = 23.6°$ e $156.4°$ |
| $V_1 = -2.4$ V → AmOp satura | $\omega t = 208.7°$ e $331.3°$ |
| $V_1 = -3.5$ V → D2 conduz | $\omega t = 224.4°$ e $315.6°$ |

```
V1 (V)        T=250µs
+5 ──   ·         ·
       · ·       · ·
+2  ──·───·─────·───·── ← D1 clamp
    ·       ·  ·       ·
 0 ─────────·──────────────> t
            ·       ·
-2.4─────────·─────·─── ← saturação AmOp
-3.5─────────·─···─·─── ← D2 clamp
-5 ──         ·   ·

vB (V)
+10 ──  ─────────────  ← D1 clamp (VA=2V, vB=10V)
       /             \
  0 ──                \─────────────────> t
                       \
-12 ──                  ─────────────────  ← AmOp sat
```

Valores de vB:
- $V_1 > 2$ V: $v_B = +10$ V (D1 clamp)
- $-2.4 < V_1 < 2$ V: $v_B = 5 V_1$ (linear, de −12 V a +10 V)
- $V_1 < -2.4$ V: $v_B = -12$ V (saturação, incluindo zona D2)

---

## d) Amplitude máxima de V1 sem distorção por Slew-Rate

A taxa de variação máxima de vB ocorre nos zeros da sinusoide (maior derivada).

Sem clamping, vB seria proporcional a V1: $v_B = 5 V_1 = 5 A_{V_1} \sin(\omega t)$

$$\left.\frac{dv_B}{dt}\right|_{max} = 5\,A_{V_1}\,\omega = 5\,A_{V_1}\,(2\pi \times 4000)$$

Para não haver distorção por SR:

$$5\,A_{V_1} \times 2\pi \times 4000 \leq 1.2 \times 10^6\ \text{V/s}$$

$$A_{V_1} \leq \frac{1.2 \times 10^6}{5 \times 2\pi \times 4000} = \frac{1.2 \times 10^6}{125\,664} \approx \boxed{9.55\ \text{V}}$$

> Para $A_{V_1} = 5$ V (alínea c), a taxa máxima é $5 \times 5 \times 25132 \approx 0.63\ \text{V/}\mu\text{s} < 1.2\ \text{V/}\mu\text{s}$: **sem distorção por SR**.
