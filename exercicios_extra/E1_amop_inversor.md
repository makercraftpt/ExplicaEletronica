# Exercício Extra E1 — Amplificador Inversor com Saturação

## Circuito

```
         R1 (4 kΩ)          Rf (20 kΩ)
Vin ──── /\/\/ ──── A ──── /\/\/ ────┐
                    │                │
                   (-)   AmOp        │
                   (+) ─── GND    Vo ┘
                    │
                   (−) = nó A
```

**Dados:** R1 = 4 kΩ, Rf = 20 kΩ, AmOp ideal com saturação $V_{sat} = \pm 12$ V.  
$V_{in}(t) = V_p \sin(\omega t)$

---

## Enunciado

a) Determine $V_o$ em função de $V_{in}$.

b) Represente graficamente $V_{in}(t)$ e $V_o(t)$ para $V_p = 1{,}5$ V, no mesmo eixo temporal. Indique os valores máximo e mínimo de $V_o$.

c) Calcule o valor máximo de $V_p$ para que $V_o$ não apresente distorção por saturação.

d) Represente $V_o(t)$ para $V_p = 3$ V, indicando os instantes em que ocorre saturação.

---

## Resolução

### Conceito: Amplificador Inversor

Num AmOp ideal em malha fechada:
1. **Corrente nula** nas entradas: $i^+ = i^- = 0$
2. **Curto-circuito virtual**: $V^- = V^+$

Como $(+)$ está ligado à GND: $V^+ = 0$ → $V^- = 0$ (nó A é virtual ground).

### a) Ganho

KCL no nó A (virtual ground = 0 V):

$$\frac{V_{in} - 0}{R_1} + \frac{V_o - 0}{R_f} = 0$$

$$\frac{V_{in}}{4\text{k}} = -\frac{V_o}{20\text{k}}$$

$$\boxed{V_o = -\frac{R_f}{R_1}\,V_{in} = -5\,V_{in}}$$

> Sinal invertido. Ganho em módulo = 5×.

### b) Gráfico para $V_p = 1{,}5$ V

$$V_o(t) = -5 \times 1{,}5\sin(\omega t) = -7{,}5\sin(\omega t)\ \text{V}$$

- $V_{o,\text{max}} = +7{,}5$ V (quando $V_{in} = -1{,}5$ V)
- $V_{o,\text{min}} = -7{,}5$ V (quando $V_{in} = +1{,}5$ V)
- Sem saturação: $7{,}5\ \text{V} < 12\ \text{V}$ ✓

```
V (V)
+7.5 ─  ·               ·
       · ·             · ·   ← Vo
      ·   ·           ·   ·
 0 ──·─────·─────────·─────·──> t
            ·       ·
      +1.5   ·     ·   ← Vin
              · · ·
-7.5 ─         ·

  Vo é invertida e amplificada 5× em relação a Vin
```

### c) $V_p$ máximo sem saturação

Saturação ocorre quando $|V_o| = 12$ V:

$$|V_o|_{\text{max}} = 5 \cdot V_p = 12\ \text{V}$$

$$\boxed{V_{p,\text{max}} = \frac{12}{5} = 2{,}4\ \text{V}}$$

### d) Gráfico para $V_p = 3$ V (com saturação)

Vo tenta atingir $\pm 15$ V mas é cortado em $\pm 12$ V.

Saturação inicia quando:

$$5 \times 3 \times |\sin(\omega t)| = 12 \implies |\sin(\omega t)| = 0{,}8 \implies \omega t = 53{,}1°$$

```
Vo (V)
+12 ─ ┌──────┐           ┌──────┐   ← saturação +12V
      │      │           │      │
      │      └─────┬─────┘      │
  0 ──┤            │            ├──> t
      │       ┌────┴────┐       │
      │       │         │       │
-12 ─ └───────┘         └───────┘   ← saturação −12V

  Forma de onda "cortada" (clipped) nos picos
  Saturação entre 53° e 127° (positivo) e 233° e 307° (negativo)
```

> **Resumo:** $V_o = -5V_{in}$ mas limitado a $\pm 12$ V. Para $V_p > 2{,}4$ V há distorção.
