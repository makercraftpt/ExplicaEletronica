# 1ª Frequência — Pergunta 3: AmOp — Thévenin, Ganho e Saturação

## Circuito

```
┌─────────────────────────┐
│  5V                     │          RF (66kΩ)
│   |  R1(15kΩ)           │   ┌──────/\/\/──────┐
│  [+]──/\/\/──┬──────────┼───┘  R3(10kΩ)  (-)  │
│              │          │  ┌──/\/\/──────┤ AmOp ├── Vo
│             R2(10kΩ)   │  │          (+) │     │
│              │          │  │  Vin───────┤     │
│             GND         │  │  R4(10kΩ)         │
└─────────────────────────┘  │──────────────────GND
     (dashed rectangle)      GND
```

**AmOp:** comportamento ideal, excepto saturação em ±15 V.

---

## Conceito

**Thévenin** substitui qualquer circuito linear por uma fonte de tensão ideal ($V_{th}$) em série com uma resistência ($R_{th}$). A resistência Thévenin é calculada com todas as fontes independentes desligadas (fontes de tensão → curto, fontes de corrente → aberto).

---

## a) Equivalente de Thévenin do rectângulo a tracejado

O rectângulo contém: 5V, R1 = 15 kΩ, R2 = 10 kΩ (divisor de tensão).

**Tensão de Thévenin** (tensão em circuito aberto nos terminais de saída):

$$V_{th} = 5 \times \frac{R_2}{R_1 + R_2} = 5 \times \frac{10}{15 + 10} = 5 \times 0.4 = \boxed{2\ \text{V}}$$

**Resistência de Thévenin** (5V substituída por curto-circuito):

$$R_{th} = R_1 \| R_2 = \frac{15 \times 10}{15 + 10} = \frac{150}{25} = \boxed{6\ \text{k}\Omega}$$

---

## b) Tensão Vo em função de Vin

**Configuração:** AmOp em malha fechada. Vin alimenta a entrada (+); a saída Thévenin alimenta a entrada (−) através de R3; RF é a resistência de realimentação (feedback).

**Condições do AmOp ideal:**
1. Corrente de entrada nula: $i^+ = i^- = 0$
2. Curto-circuito virtual: $V^- = V^+ = V_{in}$

**KCL no nó (−):** (correntes a entrar somam zero)

$$\frac{V_{th} - V_{in}}{R_{th} + R_3} + \frac{V_o - V_{in}}{R_F} = 0$$

$$\frac{2 - V_{in}}{6000 + 10000} + \frac{V_o - V_{in}}{66000} = 0$$

$$\frac{V_o - V_{in}}{66000} = -\frac{2 - V_{in}}{16000} = \frac{V_{in} - 2}{16000}$$

$$V_o - V_{in} = \frac{66}{16}(V_{in} - 2) = 4.125\,(V_{in} - 2)$$

$$\boxed{V_o = 5.125\,V_{in} - 8.25\ \text{V}}$$

> O ganho é $+5.125$ (não inversor para Vin) com offset DC de $-8.25$ V proveniente da referência Thévenin.

---

## c) Gráfico de Vo para Vp = 0.5 V

$V_{in}(t) = 0.5\sin(\omega t)$ V

$$V_o(t) = 5.125 \times 0.5\sin(\omega t) - 8.25 = 2.5625\sin(\omega t) - 8.25\ \text{V}$$

| Grandeza | Valor |
|---|---|
| Vo máximo | $2.5625 - 8.25 = -5.69$ V |
| Vo mínimo | $-2.5625 - 8.25 = -10.81$ V |
| Vo médio | $-8.25$ V |

```
Vo (V)
 0 ──────────────────────────────────> t
        ·       ·
-5.69 ─ ·         ·       ·         ·    ← máximo
       ·          ·     ·           ·
-8.25 ─────────────·───·──────────────── ← médio (DC offset)
                    · ·
-10.81 ─             ·                   ← mínimo

Dentro dos limites ±15 V: não há saturação.
```

---

## d) Vp máximo sem distorção por saturação

O offset DC é $-8.25$ V (negativo), por isso **o pico negativo de Vo atinge −15 V primeiro**.

**Condição de saturação negativa:**

$$V_{o,min} = -5.125\,V_p - 8.25 = -15\ \text{V}$$

$$5.125\,V_p = 6.75 \implies \boxed{V_{p,max} \approx 1.32\ \text{V}}$$

Verificação positiva (satura em +15 V):
$$5.125\,V_p - 8.25 = 15 \implies V_p = 4.54\ \text{V} \quad \text{(muito mais tarde)}$$

A saturação é **sempre negativa** porque o offset puxa a saída para −8.25 V.
