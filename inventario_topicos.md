# Inventário de Tópicos — Electrónica Leonor

> **Estado:** completo — 2 frequências + 4 exercícios extra + 5 folhas de problemas (UC 2025/2026).

---

## 1. Mapa completo de tópicos por folha

### Folha 1 — Circuitos Lineares (DC e AC)
| Tópico | Exercícios |
|---|---|
| KVL/KCL, divisores de tensão e corrente | 1–5 |
| Análise nodal | 11 |
| Transformação estrela-triângulo | 12–13 |
| Teorema da sobreposição | 14 |
| Ponte de Wheatstone | 6 |
| Fontes comandadas (dependentes) | 9, 10, 21, 24, 28, 29 |
| Thévenin e Norton (DC) | 16–17, 20–23, 25, 27 |
| Thévenin e Norton (AC) | 19, 25, 28 |
| Circuito AC com R, L, C — fasores | 15, 18, 19, 22, 25, 28 |
| DC + AC em simultâneo | 26, 28 |
| Potência média em AC | 15, 19 |

### Folha 2 — Sinais, Amplificadores e Filtros
| Tópico | Exercícios |
|---|---|
| Ganho em V/V, A/A, W/W e dB | 1–4 |
| Modelo amplificador real (Ri, Ro, Av0) | 2–4 |
| Potência e eficiência do amplificador | 1, 3 |
| Andares em cascata (como obter V mínimo) | 2 |
| Filtro passa-baixo RC (H(jω), fc, Bode) | 5, 11 |
| Filtro passa-alto RC | 6, 7 |
| Dimensionamento de C para fc dada | 7d, 11c |

### Folha 3 — Amplificadores Operacionais
| Tópico | Exercícios |
|---|---|
| Inversor (ganho, tolerâncias, Rin) | 1–4, 7, 25 |
| Não-inversor (seguidor, ganho) | 14 |
| Rede T na malha de realimentação | 5 |
| Conversor corrente–tensão (transresistência) | 6, 15 |
| Somador inversor (ponderado) | 8 |
| Diferença: Ad, Acm, CMRR, gama modo comum | 9, 10, 13, 17–18 |
| Amplificador de instrumentação (2+3 AmOps) | 20–22 |
| Ganho malha aberta finito → erro no ganho | 7b, 14b, 15b |
| Saturação + gama linear | 2b, 14, 16, 25 |
| Corrente limitada na saída | 25 |
| Slew-Rate | 26–27 |
| Tensão de offset (Vos) | 28 |
| Filtro activo passa-baixo com AmOp | 29 |
| Filtro activo passa-alto com AmOp | 30 |
| GBW + f3dB em malha fechada | 23–24 |

### Folha 4 — Díodos
| Tópico | Exercícios |
|---|---|
| Díodo ideal — análise por regiões | 1, 12 |
| Modelo tensão constante (VD=0.7V) | 2, 5 |
| Clipper (limitador) simples e duplo | 1, 10–12 |
| Thévenin + díodo | 2 |
| Rectificador meia-onda + carregamento de bateria | 4–5 |
| Rectificador onda completa (transformador) | 8 |
| Díodo Zener: modelo, VZ0, rz | 6–7, 13 |
| Zener + condensador (filtro de ripple) | 13 |
| Limitador duplo com Zener | 7, 11 |
| Rectificador de precisão (AmOp + díodo) | 9 |

### Folha 5 — BJT
| Tópico | Exercícios |
|---|---|
| Parâmetros BJT (β, α, relações IC/IB/IE) | 1–3 |
| Polarização simples (β alto, uma fonte) | 2, 4 |
| Polarização com duas fontes ±VCC | 3–4 |
| Circuito clássico (divisor R1/R2 + RE) | 10 |
| Projecto de polarização (IC fixo) | 5 |
| Verificação região activa (VBC < 0) | todas as de DC |
| Modelo pequenos sinais: gm, rπ (modelo π) | 6–8, 10 |
| Modelo pequenos sinais em T (α, re) | 8–9 |
| Emissor-comum: ganho AC, Rin | 6–7, 10–11 |
| Seguidor de emissor (coletor-comum): ganho ≈1, Rin alto | 8–9 |
| RE desligado vs com bypass (C∞) | 10 |

---

## 2. Tópicos cobertos nas frequências + exercícios extra

| Tópico | Fonte |
|---|---|
| Divisor de corrente com impedâncias complexas | 1ª Freq Q1 |
| Circuito AC+DC — superposição, fasores, potência | 1ª Freq Q2 |
| Thévenin + AmOp: ganho, offset DC, saturação | 1ª Freq Q3 |
| Amplificador real (Ri, Ro, Av0): perdas entrada/saída | 1ª Freq Q4 |
| AmOp não-inversor + clipper + Slew-Rate | 2ª Freq Q1 |
| Amplificador de instrumentação (2 AmOps), CMRR, bias | 2ª Freq Q2 |
| BJT emissor-comum: DC (IB/IC/IE, VB/VE/VC) + AC (gm, rπ, ganho) | 2ª Freq Q3 |
| GBW + Bode + cascata de AmOps | 2ª Freq Q4 |
| AmOp inversor: ganho, Vp_max, distorção | E1 |
| AmOp não-inversor com Vref, offset DC assimétrico | E2 |
| Rectificador de precisão (super-díodo) | E3 |
| Amplificador diferença (4R): Ad, Acm, CMRR com tolerâncias | E4 |

---

## 3. Lacunas confirmadas (presentes nas folhas, não cobertas nos exercícios)

| Tópico | Folha | Prioridade no exame |
|---|---|---|
| **Filtro activo passa-baixo com AmOp** (C em paralelo com Rf) | F3: ex.29 | 🔴 Alta |
| **Filtro activo passa-alto com AmOp** (C em série com R1) | F3: ex.30 | 🔴 Alta |
| **Somador inversor ponderado** (v0 = −[a·v1 + b·v2]) | F3: ex.8 | 🔴 Alta |
| **Ganho malha aberta finito** (efeito de A real no ganho) | F3: ex.7b, 14b | 🔴 Alta |
| **Díodo Zener como regulador** | F4: ex.6–7, 13 | 🔴 Alta |
| **Rectificador onda completa** | F4: ex.8 | 🟡 Média |
| **RE sem bypass** (emissor-comum sem condensador em RE) | F5: ex.10 | 🔴 Alta |
| **Seguidor de emissor** (coletor-comum, modelo T) | F5: ex.8–9 | 🔴 Alta |
| **Projecto de polarização BJT** (escolha R1, R2, RC, RE) | F5: ex.5, 10 | 🟡 Média |
| **Filtro RC simples + fc** | F2: ex.5–7 | 🟡 Média |
| **Slew-Rate + GBW simultâneos** | F3: ex.27 | 🟡 Média |
| **Offset de entrada (Vos)** | F3: ex.28 | 🟠 Baixa |
| **Corrente de saída limitada** | F3: ex.25 | 🟠 Baixa |

---

## 4. Exame de Preparação

Criado em `exame_preparacao/` — 5 perguntas, cobertura completa, nível exigente.

| Pergunta | Tópico principal | Tópicos secundários |
|---|---|---|
| P1 | Thévenin AC + potência complexa | Fasores, factor de potência, DC+AC |
| P2 | Filtros + amplificador real | Função de transferência, fc, ganho em cascata |
| P3 | AmOp: somador + filtro activo + ganho finito | Saturação, Slew-Rate |
| P4 | Díodos: Zener + rectificador de precisão | Clipper, ripple |
| P5 | BJT completo: EC + seguidor + projecto | DC, AC, configurações, RE com e sem bypass |
