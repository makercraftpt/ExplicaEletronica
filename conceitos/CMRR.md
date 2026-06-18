# CMRR — Razão de Rejeição de Modo Comum

## O que é?

Um amplificador diferencial amplifica a **diferença** entre duas tensões (V⁺ − V⁻). Mas na prática, se as duas entradas sobem juntas pelo mesmo valor (sinal de modo comum), um amplificador imperfeito vai amplificar também esse sinal indesejado.

O **CMRR** (*Common-Mode Rejection Ratio*) mede o quão bem o amplificador ignora esse sinal comum. Quanto maior o CMRR, melhor.

---

## Definição formal

Um amplificador diferencial tem dois ganhos:

- **Ganho diferencial** $A_d$: resposta à diferença $(V^+ - V^-)$
- **Ganho de modo comum** $A_{cm}$: resposta ao sinal comum $\frac{V^+ + V^-}{2}$

$$\boxed{CMRR = \left|\frac{A_d}{A_{cm}}\right|}$$

Em dB:

$$CMRR_{dB} = 20\log_{10}\left|\frac{A_d}{A_{cm}}\right|$$

---

## Intuição física

Imagina que estás a medir a diferença de temperatura entre dois pontos numa sala. Um amplificador ideal vê só essa diferença. Mas se a temperatura de toda a sala subir 10°C, um amplificador real vai "ver" um bocado desse aquecimento global e interpretar erroneamente como diferença. O CMRR diz-te o quanto esse efeito é suprimido.

**Exemplo prático:** amplificadores de instrumentação para sinais biológicos (ECG). O corpo tem um sinal de 50 Hz vindo da rede elétrica que aparece nas duas entradas — é modo comum. O coração produz um sinal diferencial de mV. Um CMRR alto garante que se lê o coração, não a rede.

---

## Cálculo no exame (2ª Freq, Q2)

O circuito da pergunta 2 é um **amplificador diferença** com dois AmOps.

Para um amplificador ideal com ganhos perfeitamente emparelhados:
- $A_d = 1$ (ganho diferencial unitário, como pedido)
- $A_{cm} = 0$ (modo comum perfeitamente rejeitado)

$$CMRR_{ideal} = \frac{1}{0} \rightarrow \infty$$

Na prática, resistências com tolerância introduzem desequilíbrio, e $A_{cm} \neq 0$.

Para calcular $A_{cm}$: aplica o mesmo sinal $V_{cm}$ às duas entradas ($V_a = V_b = V_{cm}$) e calcula $V_o$. Se o circuito for perfeitamente simétrico, $V_o = 0$ e $CMRR = \infty$.

$$A_{cm} = \left.\frac{V_o}{V_{cm}}\right|_{V_a = V_b = V_{cm}}$$

---

## Resumo rápido

| Situação | $A_{cm}$ | CMRR |
|---|---|---|
| Amplificador ideal, resistências perfeitas | 0 | ∞ |
| Resistências com tolerância | pequeno mas ≠ 0 | finito, grande |
| Circuito assimétrico | significativo | baixo (mau) |
