# Diagrama de Bode

## O que é?

O **diagrama de Bode** é uma forma de representar graficamente como o ganho (e fase) de um circuito varia com a frequência. Usa escala logarítmica em ambos os eixos (frequência em décadas, ganho em dB).

É a ferramenta padrão para perceber o comportamento em frequência de amplificadores — onde funcionam bem, onde perdem ganho, e qual o produto ganho-largura de banda.

---

## Estrutura do gráfico

```
Ganho
(dB)
 ^
 |  __________
 |            \  ← declive −20 dB/dec (1 polo)
 |              \
 |________________\___________> f (Hz, log)
                 ^
                 fc (frequência de corte)
```

- Abaixo de $f_c$: ganho constante (zona de passagem)
- Acima de $f_c$: ganho cai a −20 dB por década por cada polo

---

## Conceitos chave para o exame

### 1. Ganho em dB

$$A_{dB} = 20 \log_{10}(A_v)$$

Exemplos rápidos:

| $A_v$ | $A_{dB}$ |
|---|---|
| 1 | 0 dB |
| 10 | 20 dB |
| 100 | 40 dB |
| 1000 | 60 dB |
| $10^5$ | 100 dB |

### 2. Produto Ganho–Largura de Banda (GBW)

Para um AmOp com um único polo dominante:

$$\boxed{GBW = A_v \times f_{3dB} = \text{constante}}$$

Se aumentas o ganho, a largura de banda diminui proporcionalmente, e vice-versa.

**Exemplo com μA741 (GBW = 1 MHz):**

| Ganho desejado $A_v$ | $f_{3dB}$ disponível |
|---|---|
| 1 (0 dB) | 1 MHz |
| 10 (20 dB) | 100 kHz |
| 100 (40 dB) | 10 kHz |
| 1000 (60 dB) | 1 kHz |

### 3. Frequência de corte e ganho DC do μA741

- Ganho DC em malha aberta: $200\ \text{V/mV} = 2 \times 10^5\ \text{V/V}$ → $106\ \text{dB}$
- GBW = 1 MHz
- Frequência de corte em malha aberta: $f_c = \frac{GBW}{A_{DC}} = \frac{10^6}{2 \times 10^5} = 5\ \text{Hz}$

O μA741 em malha aberta tem o ganho máximo só até ~5 Hz. A partir daí cai 20 dB/dec.

---

## Aplicação no exame (2ª Freq, Q4)

Pede-se um amplificador para áudio (20 Hz a 20 kHz) com ganho de 60 dB.

**Com 1 AmOp:** precisaria de $A_v = 1000$ com banda até 20 kHz.  
$f_{3dB} = GBW/A_v = 10^6/1000 = 1\ \text{kHz}$ → não chega a 20 kHz. **Impossível.**

**Com 2 AmOps em cascata:** cada um com $A_v = \sqrt{1000} \approx 31.6$ (30 dB cada).  
$f_{3dB} = 10^6/31.6 \approx 31.6\ \text{kHz}$ → cobre 20 kHz. **Possível.**

---

## Resumo visual

```
Bode do μA741 (malha aberta):

Ganho
(dB)
106 |___
    |   \  −20 dB/dec
 60 |    \___________
 40 |                \___
    |_____|_____|_____|______> f
        5Hz  1kHz  10kHz  1MHz
              ^
              GBW = 1MHz (ponto onde ganho = 0 dB)
```
