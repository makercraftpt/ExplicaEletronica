# 2ª Frequência — Pergunta 3: BJT — Amplificador Emissor-Comum

## Circuito

```
        +9V
         │
       RC(3.6kΩ)
         │
RB(570kΩ)│     C2
+9V──/\/\/──B   C──||──────── (+)vo
            │NPN│
           VBE  E          RL(10kΩ)
                │                    │
               C3   RE(2kΩ)          │
                    │                │
               ─────────────────    (-)vo
                     -9V
         C1
vi ──||──── base (entrada acoplada por condensador)
```

β = 100, VT = 25 mV, VBE = 0.7 V (modelo de junção)

**Capacitores:** C1 (entrada), C2 (saída), C3 (bypass do emissor) — impedância negligenciável para as frequências do sinal → **curto-circuito para AC**

---

## Conceito

O transistor bipolar (BJT) funciona como amplificador quando polarizado na **região activa** (junção B-E directamente polarizada, junção B-C inversamente polarizada). Na região activa: $I_C = \beta I_B$.

A análise divide-se em:
1. **DC (circuito equivalente DC):** calcula os pontos de polarização (IB, IC, IE, VC, VE)
2. **AC (circuito equivalente AC):** calcula o ganho usando o modelo de pequenos sinais

---

## a) Circuito equivalente DC

Regras: condensadores → **circuito aberto** (bloqueiam DC). Fontes DC (+9V, −9V) mantêm-se.

```
+9V ─ RB(570kΩ) ─── B
                     │ VBE = 0.7V
                     E
                     │
                    RE(2kΩ)
                     │
                    -9V

+9V ─ RC(3.6kΩ) ─── C (coletor, sem ligação AC em DC)
```

Resistência de carga RL (10kΩ) está desligada em DC (C2 está aberto).

---

## b) Correntes de polarização IB, IC, IE

**KVL pelo malha de base:**

$$+9 - I_B \cdot R_B - V_{BE} - I_E \cdot R_E - (-9) = 0$$

$$18 - 0.7 = I_B \cdot R_B + (1+\beta) I_B \cdot R_E$$

$$17.3 = I_B \cdot (570\times10^3 + 101 \times 2\times10^3) = I_B \times 772\,000$$

$$\boxed{I_B = \frac{17.3}{772\,000} \approx 22.4\ \mu\text{A}}$$

$$\boxed{I_C = \beta \cdot I_B = 100 \times 22.4\ \mu\text{A} = 2.24\ \text{mA}}$$

$$\boxed{I_E = (1+\beta) I_B = 101 \times 22.4 = 2.26\ \text{mA}}$$

**Verificação da região activa:**

$$V_B = +9 - I_B \cdot R_B = 9 - 22.4\times10^{-6} \times 570\times10^3 = 9 - 12.77 = -3.77\ \text{V}$$

$$V_E = V_B - V_{BE} = -3.77 - 0.7 = -4.47\ \text{V}$$

$$V_C = +9 - I_C \cdot R_C = 9 - 2.24\times10^{-3}\times3600 = 9 - 8.06 = 0.93\ \text{V}$$

| Condição região activa | Verificação |
|---|---|
| $V_{BE} = V_B - V_E = 0.7\ \text{V} > 0$ | ✓ (B-E directamente polarizada) |
| $V_{BC} = V_B - V_C = -3.77 - 0.93 = -4.7\ \text{V} < 0$ | ✓ (B-C inversamente polarizada) |
| $V_{CE} = V_C - V_E = 0.93 + 4.47 = 5.4\ \text{V} \gg V_{CEsat}$ | ✓ (activo, não saturado) |

**O transistor está na região activa.** ✓

---

## c) Circuito equivalente AC e ganho vo/vi

**Regras para AC:** condensadores → **curto-circuito**. Fontes DC (±9V) → **curto-circuito** (massa AC).

Efeito dos capacitores:
- C1: vi liga-se directamente à base
- C2: coletor liga-se directamente à carga RL
- C3: **bypasses RE** → emissor ligado à massa AC (GND)

**Parâmetros do modelo de pequenos sinais:**

$$g_m = \frac{I_C}{V_T} = \frac{2.24 \times 10^{-3}}{25 \times 10^{-3}} = 89.6\ \text{mA/V}$$

$$r_\pi = \frac{\beta}{g_m} = \frac{100}{89.6 \times 10^{-3}} \approx 1.12\ \text{k}\Omega$$

**Circuito AC equivalente:**

```
vi ─────────── B
               │  rπ(1.12kΩ)     gm·vπ↑     RC(3.6kΩ)||RL(10kΩ) ─── vo
               └─────────────── E(GND) ─────────────────────────────
```

$$v_\pi = v_i \quad \text{(emissor em GND por C3)}$$

$$v_o = -g_m \cdot v_\pi \cdot (R_C \| R_L)$$

$$R_C \| R_L = \frac{3.6 \times 10}{3.6 + 10} = \frac{36}{13.6} \approx 2.647\ \text{k}\Omega$$

$$\boxed{\frac{v_o}{v_i} = -g_m \cdot (R_C \| R_L) = -89.6 \times 10^{-3} \times 2647 \approx -237\ \text{V/V}}$$

O sinal negativo indica **inversão de fase** de 180° — característica do emissor-comum. Em módulo, o ganho é **237 V/V ≈ 47.5 dB**.
