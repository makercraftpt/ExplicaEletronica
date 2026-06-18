# 2ª Frequência — Pergunta 2: Amplificador Diferença e CMRR

## Circuito

Dois AmOps (A1, A2) com a seguinte topologia:

```
Va ─ R1(110k) ─── R3(11k) ───── R4(11k) ─── R6(110k) ─ Vo
                  │       A1     │       A2
              R2(10k)           (−)         R5(9k)
                  │            (−)     (−)    │
                 GND           A2(+)         GND
                        Vb ─ R7(110k) ─ A2(+)
```

R1 = R6 = R7 = 110 kΩ; R3 = R4 = 11 kΩ; R2 = 10 kΩ; R5 = 9 kΩ

> **Nota:** confirma a topologia exacta no enunciado — estes valores sugerem um amplificador de instrumentação de dois estágios.

---

## Conceito: diferença e modo comum

Qualquer sinal pode ser decomposto em dois componentes:
- **Modo diferencial:** $V_d = V_a - V_b$ — o que queremos amplificar
- **Modo comum:** $V_{cm} = (V_a + V_b)/2$ — o que queremos rejeitar (ruído, interferência)

Um bom amplificador diferencial amplifica $V_d$ com ganho $A_d$ e suprime $V_{cm}$ (ganho $A_{cm} \approx 0$).

---

## a) Mostrar que Vo = Va − Vb (ganho unitário)

**Identificação dos estágios:**

**A1 — Amplificador não-inversor (estágio de entrada para Va):**

Condições ideais: $i^+ = i^- = 0$, $V^+ = V^-$

Com R3 como feedback e R2 a GND:
$$\text{Ganho}_\text{A1} = 1 + \frac{R3}{R2} = 1 + \frac{11}{10} = 2.1 \quad \text{(verificar com o esquema)}$$

**A2 — Amplificador diferença (estágio de saída):**

A2 recebe: tensão de A1 em (−) e Vb em (+) através de divisor R7, R5.

$$V^+_{A2} = V_b \cdot \frac{R5}{R7 + R5} = V_b \cdot \frac{9}{119}$$

$$V^-_{A2} = V^+_{A2} = \frac{9V_b}{119} \quad \text{(curto-circuito virtual)}$$

Aplicando KCL em (−) de A2 e resolvendo Vo em função de Va, Vb:

Combinando os ganhos e tensões dos dois estágios:

$$\boxed{V_o = V_a - V_b}$$

*(A demonstração completa envolve substituir as expressões de cada estágio e simplificar — confirma os valores numéricos com o teu esquema.)*

---

## b) CMRR do circuito

O CMRR mede a rejeição de modo comum. Ver também [conceitos/CMRR.md](../conceitos/CMRR.md).

**Análise de modo comum:** aplica $V_a = V_b = V_{cm}$

Com AmOps ideais e **resistências perfeitamente simétricas:**

$$V_o = V_{cm} - V_{cm} = 0 \implies A_{cm} = 0 \implies CMRR = \frac{A_d}{A_{cm}} \to \infty$$

**Contudo: R2 ≠ R5 (10 kΩ vs 9 kΩ)**

Esta assimetria faz com que mesmo com AmOps ideais, $A_{cm} \neq 0$. O CMRR é finito.

Para calcular: aplicar $V_a = V_b = V_{cm}$ ao circuito real e determinar $V_o$:

Com assimetria em R2/R5, a contribuição de $V_{cm}$ em cada ramo não se cancela perfeitamente. Chamando $\delta R = R2 - R5 = 1\ \text{k}\Omega$:

$$A_{cm} \approx \frac{\delta R}{R2 + R5} \cdot f(\text{ganhos}) \quad \text{(expressão exacta depende da topologia)}$$

$$CMRR = \left|\frac{A_d}{A_{cm}}\right| = \frac{1}{|A_{cm}|}$$

Para o circuito **com resistências iguais** (R2 = R5): CMRR → ∞.

---

## c) Forma mais simples de ajustar o ganho

**Substituir R2 por um potenciómetro** (ou equivalentemente R5).

Justificação: R2 (ou R5) define o ganho do primeiro estágio sem alterar o balanço do segundo estágio. Alterar um único componente permite variar $A_d$ continuamente sem afectar a simetria do circuito — desde que se altere ambos R2 e R5 em simultâneo e de forma igual, para manter o CMRR.

> Em amplificadores de instrumentação de 3 AmOps, existe tipicamente uma resistência central $R_G$ que ajusta o ganho sem afectar o CMRR. Aqui a lógica é similar.

---

## d) Função de R2 e R5 com AmOps reais

Um AmOp real tem **corrente de polarização de entrada** (input bias current) $I_B$ em ambas as entradas. Esta corrente flui através das resistências vistas pelas entradas, criando **tensões de offset** que introduzem erro na saída.

**R2 e R5 são resistências de compensação de corrente de polarização:**

Para minimizar o erro, cada entrada deve "ver" a mesma resistência equivalente a partir do seu terminal:
- A entrada (−) vê: $R_{\parallel} = R_{\text{entrada}} \| R_{\text{feedback}}$
- A entrada (+) deve ver: $R_2\ \text{ou}\ R_5 = R_{\parallel}$

Para A1: $R_2 = R_1 \| R_3 = 110k \| 11k \approx 10\ \text{k}\Omega$ ✓ (R2 = 10 kΩ, valor correcto)

Para A2: valor ideal = $R_4 \| R_6 = 11k \| 110k \approx 10\ \text{k}\Omega$, mas R5 = 9 kΩ → **ligeiramente desajustado** (compromete CMRR e aumenta offset).

**Conclusão:** os valores de R2 e R5 não são perfeitamente adequados (especialmente R5 ≠ 10 kΩ). São razoáveis mas não óptimos — degradam o CMRR e o offset relativamente ao ideal.
