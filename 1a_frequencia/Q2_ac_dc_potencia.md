# 1ª Frequência — Pergunta 2: Circuito AC+DC — Tensão em C1 e Potência

## Circuito

```
         R1(1kΩ)  R2(10kΩ)
         |        |
V1+ ─── A ───────────────── C1(270nF) ─── B ─── V2+
5V DC   |        |              +    -         (2Vrms,1kHz,0°)
        L1(1mH)  C2(1µF)                        |
        |        |                             R3(1kΩ)
       GND      GND                             |
                                               GND
```

**Topologia-chave:** V1 está directamente ligado ao nó A (sem componentes em série entre V1+ e A). C1 tem o terminal + em A e o terminal − em B. R1-L1 e R2-C2 são ramos paralelos de A para GND.

---

## Conceito: Superposição com AC e DC

Circuito com fonte DC (V1) e fonte AC (V2). Usa-se **superposição**:
- **DC**: V2 = 0 (curto), capacitores → aberto, indutor → curto
- **AC**: V1 = 0 (curto), usar impedâncias complexas

---

## a) Tensão em C1

### Análise DC (V2 = 0)

Comportamento dos componentes reactivos em DC:
- C1, C2 → **circuito aberto**
- L1 → **curto-circuito**

Com V1 ideal directamente em A: **V_A = 5 V** (fonte de tensão fixa o nó).

C1 é aberto → não circula corrente DC por C1 → sem tensão a dividir.
V2 = 0 → B ligado à GND através de R3 → **V_B = 0 V**

$$\boxed{V_{C1}(DC) = V_A - V_B = 5 - 0 = 5 \text{ V}}$$

Correntes DC:
- Ramo R1-L1: $I = \frac{5\text{ V}}{1\text{ k}\Omega} = 5\text{ mA}$ (L1 é curto)
- Ramo R2-C2: $I = 0$ (C2 aberto)

### Análise AC (V1 = 0, f = 1000 Hz)

Com V1 = 0 (curto), o nó A fica directamente ligado à GND. Os ramos R1-L1 e R2-C2 ficam de A(=GND) para GND — não afectam o circuito AC.

O circuito AC reduz-se a: **V2 → R3 → B → C1 → A(=GND)**

$\omega = 2\pi \times 1000 = 6283$ rad/s

$$Z_{C1} = \frac{1}{j\omega C_1} = \frac{1}{j \times 6283 \times 270\times10^{-9}} = -j589.5\ \Omega$$

**Divisor de tensão** (V2 com R3 em série a alimentar Z_C1 de B para GND):

$$V_B = V_2 \cdot \frac{Z_{C1}}{R_3 + Z_{C1}} = 2 \cdot \frac{-j589.5}{1000 - j589.5}$$

$$|Z_{total}| = \sqrt{1000^2 + 589.5^2} = 1161.5\ \Omega$$

$$|V_B| = 2 \times \frac{589.5}{1161.5} \approx 1.016\ \text{Vrms}$$

A tensão em C1 é $V_{C1} = V_A - V_B = 0 - V_B$:

$$V_{C1}(AC) = -V_2 \cdot \frac{Z_{C1}}{R_3 + Z_{C1}} = V_2 \cdot \frac{j589.5}{1000 - j589.5}$$

**Módulo (pico):**
$$V_p = 1.016 \times \sqrt{2} \approx 1.44\ \text{V}$$

**Fase:**
$$\phi = \angle(j589.5) - \angle(1000 - j589.5) = 90° - (-30.5°) = +120.5°$$

### Resultado

$$\boxed{v_{C1}(t) = 5 + 1.44\,\sin(2\pi \times 1000\,t + 120.5°)\ \text{V}}$$

**Gráfico:**

```
V_C1 (V)
6.44 ─            ·
      ·           · ·
5.00 ─ · ·     · ·   · ·   ← valor médio DC = 5 V
        · ·   · ·
3.56 ─     · ·
      ─────────────────────> t (ms)
       0    0.5    1.0

Sinusóide de 1 kHz centrada em 5 V, amplitude ±1.44 V, adiantada 120.5° de V2.
```

---

## b) Potência total dissipada

Apenas resistências dissipam potência média.

### Potência DC — R1 (de V1)

$$I_{DC} = \frac{V_1}{R_1} = \frac{5}{1000} = 5\ \text{mA}$$

$$\boxed{P_{R1} = I_{DC}^2 \times R_1 = (5\times10^{-3})^2 \times 1000 = 25\ \text{mW}}$$

### Potência AC — R3 (de V2)

$$I_{rms} = \frac{V_2}{|Z_{total}|} = \frac{2}{1161.5} \approx 1.722\ \text{mA}$$

$$\boxed{P_{R3} = I_{rms}^2 \times R_3 = (1.722\times10^{-3})^2 \times 1000 \approx 2.97\ \text{mW}}$$

### Potência em R2

R2 tem C2 em série. Em DC: C2 aberto → $I = 0$. Em AC: nó A está a GND (V1 curto) → $V_A = 0$ → corrente nula. $P_{R2} \approx 0$

### Total

| Fonte | Potência fornecida | Dissipada em |
|---|---|---|
| V1 (DC) | 25 mW | R1 (25 mW) |
| V2 (AC) | 2.97 mW | R3 (2.97 mW) |
| **Total** | **≈ 28 mW** | — |

> **Nota:** L1, C1, C2 são elementos reactivos ideais — dissipam potência média zero.
