# 2ª Frequência — Pergunta 4: Diagrama de Bode e GBW com μA741

## Especificações

| Parâmetro | μA741 |
|---|---|
| Ganho DC em malha aberta | 200 V/mV = 2×10⁵ V/V → **106 dB** |
| GBW (produto ganho × largura de banda) | **1 MHz** |
| Slew-Rate | 0.5 V/µs |

**Requisitos do amplificador de áudio:**
- Banda: 20 Hz a 20 kHz
- Ganho: 60 dB → $A_v = 10^{60/20} = 10^3 = 1000\ \text{V/V}$

Ver também [conceitos/diagrama_bode.md](../conceitos/diagrama_bode.md) para contexto sobre GBW.

---

## Conceito: GBW e a impossibilidade de alto ganho com grande banda

Para um AmOp com polo dominante, o produto ganho × largura de banda é constante:

$$\boxed{GBW = A_v \times f_{3dB} = \text{constante}}$$

Aumentar o ganho $A_v$ **reduz proporcionalmente** a largura de banda $f_{3dB}$. Esta é a limitação fundamental dos AmOps.

---

## a) Impossibilidade com 1 AmOp

Para atingir 60 dB (Av = 1000) com o μA741:

$$f_{3dB} = \frac{GBW}{A_v} = \frac{1 \times 10^6}{1000} = \boxed{1\ \text{kHz}}$$

**Problema:** a banda de 1 kHz está muito abaixo dos 20 kHz exigidos pelo áudio.

```
Ganho (dB)
 106 ─|───────
      |       \  −20 dB/dec
  60 ─|        ·── máximo possível com Av=60dB
      |             \
   0 ─|─────────────·────────────> f (Hz)
      1    5Hz  1kHz  1MHz
           ↑         ↑
         f_corte   GBW
         com 60dB  (1MHz)
         = 1kHz ← não chega a 20kHz!
```

**Conclusão:** com um único μA741, a banda máxima a 60 dB é **1 kHz**. É **impossível** cobrir os 20 kHz exigidos com um único amplificador.

---

## b) Com dois AmOps em cascata: verificação

**Estratégia:** dividir o ganho total igualmente por dois estágios:

$$A_{v,\text{estágio}} = \sqrt{A_{v,\text{total}}} = \sqrt{1000} = 31.6\ \text{V/V} = 30\ \text{dB}$$

**Largura de banda de cada estágio:**

$$f_{3dB,\text{estágio}} = \frac{GBW}{A_{v,\text{estágio}}} = \frac{10^6}{31.6} \approx 31.6\ \text{kHz}$$

Como 31.6 kHz > 20 kHz, **cada estágio individualmente já cobre a banda de áudio.**

**Verificação da largura de banda em cascata:**

Para dois estágios idênticos, a banda resultante é ligeiramente inferior:

$$f_{3dB,\text{cascata}} = f_{3dB,\text{estágio}} \times \sqrt{\sqrt{2} - 1} = 31.6 \times 0.644 \approx 20.3\ \text{kHz}$$

✓ 20.3 kHz ≥ 20 kHz — **a banda cobre os requisitos** (mesmo com a redução da cascata).

**Verificação do ganho:**

$$A_{v,\text{total}} = 31.6 \times 31.6 = 999 \approx 1000\ \text{V/V} = 60\ \text{dB}$$ ✓

**Com dois μA741 é possível construir o amplificador.**

---

## Circuito correspondente

Dois amplificadores não-inversores em série, cada um com ganho 31.6:

$$A_{v,\text{estágio}} = 1 + \frac{R_f}{R_1} = 31.6 \implies \frac{R_f}{R_1} = 30.6$$

Valores práticos: $R_1 = 1\ \text{k}\Omega$, $R_f = 30\ \text{k}\Omega$ (ganho ≈ 31 × 31 = 961 V/V ≈ 59.7 dB — aceitável).

```
         R1(1kΩ)                    R1(1kΩ)
vi ──(+)─────────────── (−) ──(+)───────────────(−)── vo
         │     A1       │           │     A2    │
         Rf(30kΩ)       │           Rf(30kΩ)   │
         │              │           │           │
        GND            GND         GND        GND
```

Cada estágio: ganho = +31 V/V (não-inversor, sem inversão de fase).

**Diagrama de Bode da cascata:**

```
Ganho (dB)
 106 ─|──(malha aberta, 1 AmOp)
  60 ─|────────────              ← ganho total com 2 AmOps
  30 ─|──────────── \  ← cada estágio individualmente
      |              \
   0 ─|───────────────·──────────────> f (Hz)
      1             31.6k 1M
                      ↑
              f_3dB de cada estágio (31.6 kHz > 20 kHz) ✓
```
