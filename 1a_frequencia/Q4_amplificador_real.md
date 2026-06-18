# 1ª Frequência — Pergunta 4: Amplificador Real — Ri, Ro e Carga

## Circuito

```
        Rs(600Ω)    Ri(5kΩ)  Avo·vi   Ro(150Ω)
vs ──────/\/\/──────┤+        ├──────────/\/\/────┬──── VL
(sensor)            │  Ampl.  │              RL(2kΩ)│
                    └─────────┘                    │
                                                  GND
```

Dados:
- Sensor: $v_s = 10\ \text{mV/cm}$, $R_s = 600\ \Omega$
- Amplificador: $A_{vo} = 15\ \text{V/V}$, $R_i = 5\ \text{k}\Omega$, $R_o = 150\ \Omega$
- Carga (voltímetro): $R_L = 2\ \text{k}\Omega$

---

## Conceito

Um amplificador real sofre **atenuação por divisor de tensão** em dois pontos:
1. **Entrada:** $R_s$ e $R_i$ formam um divisor → $v_i < v_s$
2. **Saída:** $R_o$ e $R_L$ formam um divisor → $V_L < A_{vo} \cdot v_i$

Um amplificador **ideal** teria $R_i \to \infty$ (sem perda à entrada) e $R_o \to 0$ (sem perda à saída).

---

## a) Valor ideal para 1 m de deslocamento

Para $d = 1\ \text{m} = 100\ \text{cm}$:

$$v_s = 10\ \text{mV/cm} \times 100\ \text{cm} = 1\ \text{V}$$

Idealmente ($R_i \to \infty$, $R_o \to 0$): toda a tensão do sensor chega à entrada, toda a tensão amplificada chega à carga.

$$\boxed{V_{L,ideal} = A_{vo} \times v_s = 15 \times 1 = 15\ \text{V}}$$

---

## b) Valor real apresentado pelo voltímetro

**Divisor de tensão na entrada** ($R_s$ e $R_i$):

$$v_i = v_s \cdot \frac{R_i}{R_s + R_i} = 1 \times \frac{5000}{600 + 5000} = \frac{5000}{5600} = 0.893\ \text{V}$$

**Tensão à saída do amplificador** (antes de $R_o$):

$$v_o = A_{vo} \cdot v_i = 15 \times 0.893 = 13.39\ \text{V}$$

**Divisor de tensão na saída** ($R_o$ e $R_L$):

$$V_L = v_o \cdot \frac{R_L}{R_o + R_L} = 13.39 \times \frac{2000}{150 + 2000} = 13.39 \times \frac{2000}{2150}$$

$$\boxed{V_L \approx 12.46\ \text{V}}$$

Diferença em relação ao ideal: $15 - 12.46 = 2.54\ \text{V}$ (erro de ≈ 17%).

**Factores de atenuação:**

| Local | Factor | Perda |
|---|---|---|
| Entrada ($R_i$ vs $R_s$) | $5000/5600 = 0.893$ | 10.7% |
| Saída ($R_L$ vs $R_o$) | $2000/2150 = 0.930$ | 7.0% |

---

## c) Qual parâmetro alterar?

**Resposta: aumentar $R_i$ (resistência de entrada).**

A perda na entrada (10.7%) é maior que na saída (7.0%), por isso o impacto de aumentar $R_i$ é superior ao de diminuir $R_o$.

**Verificação:**

Se $R_i \to \infty$ (mantendo $R_o = 150\ \Omega$):
$$V_L = 15 \times \frac{2000}{2150} = 13.95\ \text{V} \quad \text{(melhoria de +1.49 V)}$$

Se $R_o \to 0$ (mantendo $R_i = 5\ \text{k}\Omega$):
$$V_L = 15 \times \frac{5000}{5600} = 13.39\ \text{V} \quad \text{(melhoria de +0.93 V)}$$

Aumentar $R_i$ dá uma leitura mais próxima de 15 V. Um amplificador ideal tem $R_i \to \infty$ para não "roubar" corrente ao sensor.
