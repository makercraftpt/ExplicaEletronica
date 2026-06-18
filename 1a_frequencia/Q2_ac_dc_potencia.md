# 1ª Frequência — Pergunta 2: Circuito AC+DC — Tensão em C1 e Potência

## Circuito

```
         R1(1kΩ)         R2(10kΩ)        C1(270nF)
V1 ──/\/\/──── A ──/\/\/──── B ──||──── C ──── V2
5V DC          |             |              (+) (2Vrms,1kHz,0°)
               L1(1mH)      C2(1µF)            |
               |             |             R3(1kΩ)
              GND           GND              |
                                            GND
```

---

## Conceito: Superposição com AC e DC

Circuito com uma fonte DC (V1) e uma fonte AC (V2). Usa-se **superposição**:
- Analisar DC (V2 = 0, curto-circuito): capacitores → aberto, indutor → curto
- Analisar AC (V1 = 0, curto-circuito): usar impedâncias complexas

A tensão total em C1 é a soma de ambas as contribuições.

---

## a) Tensão em C1

### Análise DC (V2 = 0)

Comportamento dos componentes reactivos em DC (regime estacionário):
- C1, C2 → **circuito aberto** (bloqueiam DC)
- L1 → **curto-circuito** (resistência nula em DC)

Com C1 e C2 abertos: nenhuma corrente flui por R2 (não há caminho fechado).  
Com L1 curto: nó A fica directamente ligado à GND → $V_A = 0$  
Sem corrente em R2: $V_B = V_A = 0$  
V2 = 0 (curto): $V_C = 0$

$$\boxed{V_{C1}(DC) = V_B - V_C = 0 \text{ V}}$$

Faz sentido: C1 bloqueia DC por definição. A tensão DC em C1 é zero.

### Análise AC (V1 = 0, f = 1000 Hz)

$\omega = 2\pi \times 1000 = 6283$ rad/s

**Impedâncias:**
$$Z_{L1} = j\omega L = j \times 6283 \times 10^{-3} = j6.28\ \Omega$$
$$Z_{C1} = \frac{1}{j\omega C_1} = \frac{1}{j \times 6283 \times 270 \times 10^{-9}} = -j589.5\ \Omega$$
$$Z_{C2} = \frac{1}{j\omega C_2} = \frac{1}{j \times 6283 \times 10^{-6}} = -j159.2\ \Omega$$

**Simplificação no nó A** (R1 || L1 com V1 = 0, ou seja, R1 ligado à GND):

$$Z_A = R_1 \| Z_{L1} = \frac{1000 \times j6.28}{1000 + j6.28} \approx j6.28\ \Omega$$

(|Z_L1| ≪ R1, o indutor domina o paralelo — virtualmente um curto para AC)

**Impedância vista do nó B para GND:**

$$Z_B = Z_{C2} \| (R_2 + Z_A) = \frac{-j159.2 \times (10000 + j6.28)}{-j159.2 + 10000 + j6.28} \approx -j159\ \Omega$$

(|Z_C2| ≪ R2, o condensador C2 domina — é o ramo mais fácil para AC)

**Impedância total vista por V2:**

$$Z_{total} = R_3 + Z_{C1} + Z_B = 1000 + (-j589.5) + (-j159.2) = 1000 - j748.7\ \Omega$$

$$|Z_{total}| = \sqrt{1000^2 + 748.7^2} = \sqrt{1{,}000{,}000 + 560{,}551} \approx 1249\ \Omega$$

**Tensão AC em C1** (divisor de tensão):

$$\hat{V}_{C1}(AC) = V_2 \cdot \frac{Z_{C1}}{Z_{total}} = 2 \cdot \frac{-j589.5}{1000 - j748.7}$$

$$|\hat{V}_{C1}| = 2 \times \frac{589.5}{1249} \approx 0.944\ \text{Vrms} \quad \Rightarrow \quad V_p = 0.944 \times \sqrt{2} \approx 1.335\ \text{V}$$

**Fase:**
$$\phi = \angle(-j589.5) - \angle(1000 - j748.7) = -90° - (-36.8°) = -53.2°$$

### Resultado

$$\boxed{V_{C1}(t) = 1.335 \sin(2\pi \times 1000\, t - 53.2°)\ \text{V}}$$

**Gráfico:**

```
V_C1 (V)
+1.335 ─ ·             ·
        · ·           · ·
  0 ───·───·─────────·───·────> t (ms)
            · ·     · ·
-1.335 ─     ·     ·
               · · ·

Período T = 1 ms; sem componente DC; desfasado -53.2° de V2.
```

---

## b) Potência total dissipada

### Potência DC (de V1)

DC percorre apenas: V1 → R1 → L1(curto) → GND

$$I_{DC} = \frac{V_1}{R_1} = \frac{5}{1000} = 5\ \text{mA}$$

$$\boxed{P_{V1} = V_1 \times I_{DC} = 5 \times 5 \times 10^{-3} = 25\ \text{mW}}$$

Toda dissipada em R1: $P_{R1} = I_{DC}^2 \times R_1 = (5\times10^{-3})^2 \times 1000 = 25\ \text{mW}$ ✓

### Potência AC (de V2)

Corrente eficaz fornecida por V2:

$$I_{V2} = \frac{V_2}{|Z_{total}|} = \frac{2}{1249} \approx 1.60\ \text{mA (rms)}$$

Apenas **resistências** dissipam potência média. A potência real é dada pela parte resistiva de $Z_{total}$:

$$\boxed{P_{V2} = I_{V2}^2 \times \text{Re}(Z_{total}) = (1.60 \times 10^{-3})^2 \times 1000 \approx 2.56\ \text{mW}}$$

Dissipada essencialmente em R3 (≈ 2.55 mW); R2 e R1 recebem corrente AC negligenciável.

### Total

| Fonte | Potência fornecida | Dissipada em |
|---|---|---|
| V1 (DC) | 25 mW | R1 (25 mW) |
| V2 (AC) | 2.56 mW | R3 (≈ 2.55 mW), R2 (≈ 0.006 mW) |
| **Total** | **≈ 27.6 mW** | — |

> **Nota:** L1, C1, C2 são elementos reactivos ideais — dissipam potência média zero.
