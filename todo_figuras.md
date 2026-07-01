# TODO — Figuras a Desenhar

> **Convenção de pastas:**
> - PNGs → guardar em `figuras/`
> - Ficheiros Falstad (.txt) → guardar em `falstad/`
>
> **Legenda:**
> - 🔲 Por fazer
> - ✅ Feito
> - ⚡ Tem circuito Falstad (ou precisa de um)
> - 📐 Diagrama / modelo — não tem simulação Falstad útil

---

## 1ª Frequência

| # | Ficheiro PNG | O que mostrar | Falstad? |
|---|---|---|---|
| 🔲 | `figuras/fig_1freq_q1_divisor_corrente.png` | Fonte de corrente I com dois ramos em paralelo: Z₁ em cima, Z₂ em baixo. Correntes I₁ e I₂ marcadas. | ⚡ `falstad/circ_1freq_q1.txt` |
| 🔲 | `figuras/fig_1freq_q2_ac_dc.png` | Fonte DC (5 V) + fonte AC (Vp·sin) em série → R1 → nó A → C para massa, R2 para massa. Tensão Vc e corrente IC marcadas. | ⚡ `falstad/circ_1freq_q2.txt` |
| 🔲 | `figuras/fig_1freq_q3_thevenin_amop.png` | **Bloco esquerdo** (tracejado): 5 V, R1=15 kΩ, R2=10 kΩ. **Bloco direito:** AmOp inversor com R3=10 kΩ (entrada −), RF=66 kΩ (feedback), Vin na entrada +. Saída Vo. | ⚡ `falstad/circ_1freq_q3.txt` |
| 🔲 📐 | `figuras/fig_1freq_q4_modelo_ampl.png` | Modelo em blocos: fonte vs → Rs → nó 1 → Ri para massa → fonte dependente Avo·vi → Ro → nó 2 → RL para massa → VL. | — (diagrama de blocos) |

---

## 2ª Frequência

| # | Ficheiro PNG | O que mostrar | Falstad? |
|---|---|---|---|
| 🔲 | `figuras/fig_2freq_q1_amop_diodos.png` | Fonte V1 → R=20 Ω → nó A. D1 entre nó A e Vr1=+1.5 V (ânodo em A). D2 entre Vr2=−3 V e nó A (cátodo em A). Nó A → entrada (+) do AmOp não-inversor (R1=1 kΩ, R2=4 kΩ). Saída vB. | ⚡ `falstad/circ_2freq_q1.txt` |
| 🔲 | `figuras/fig_2freq_q2_amp_instrumentacao.png` | 2 AmOps (A1, A2). Va → R1=110 kΩ → entrada (−) de A1. Vb → R6=110 kΩ → entrada (+) de A2. Feedback de A1: R3=11 kΩ. Feedback de A2: R4=11 kΩ. Ligação central R2=10 kΩ. Saída de A2 → R5=9 kΩ → Vo. | ⚡ `falstad/circ_2freq_q2.txt` |
| 🔲 | `figuras/fig_2freq_q3_bjt_dc.png` | BJT NPN emissor-comum. VCC=+10 V. R1=56 kΩ (VCC→base), R2=15 kΩ (base→GND), RC=2.2 kΩ (VCC→coletor), RE=1.2 kΩ (emissor→GND). Marcar VB, VC, VE, IC, IE. | ⚡ `falstad/circ_2freq_q3_dc.txt` |
| 🔲 📐 | `figuras/fig_2freq_q3_bjt_ac.png` | Modelo π de pequenos sinais: resistência rπ entre B e E, fonte dependente gm·vπ entre C e E, RC em paralelo com RL no coletor. Marcar vi (entrada na base), vo (saída no coletor). | — (modelo, não Falstad) |
| 🔲 | `figuras/fig_2freq_q4_cascata_amops.png` | Dois AmOps não-inversores em série. Cada um: R1=1 kΩ (de − para massa), Rf=30 kΩ (feedback). Entrada vi, saída vo. | ⚡ `falstad/circ_2freq_q4.txt` |

---

## Exercícios Extra

| # | Ficheiro PNG | O que mostrar | Falstad? |
|---|---|---|---|
| 🔲 | `figuras/fig_E1_amop_inversor.png` | AmOp inversor. Vin → R1=4 kΩ → entrada (−). Rf=20 kΩ de saída para (−). Entrada (+) à massa. Saída Vo. | ✅ `falstad/circ_E1.txt` (já fornecido) |
| 🔲 | `figuras/fig_E2_amop_nao_inversor.png` | Divisor Ra=Rb=10 kΩ entre Vin e Vref=2 V → entrada (+). AmOp não-inversor: R1=10 kΩ (− para massa), Rf=30 kΩ (feedback). Saída Vo. | ✅ `falstad/circ_E2.txt` (já fornecido) |
| 🔲 | `figuras/fig_E3_rectificador_precisao.png` | Vin → entrada (+). D1: ânodo no output do AmOp, cátodo em Vo. Vo → entrada (−). RL=10 kΩ para massa. | ✅ `falstad/circ_E3.txt` (já fornecido) |
| 🔲 | `figuras/fig_E4_amop_diferenca.png` | Va → R1=10 kΩ → entrada (−). Rf=40 kΩ de saída para (−). Vb → R3=10 kΩ → entrada (+). R4=40 kΩ de (+) para massa. Saída Vo. | ✅ `falstad/circ_E4.txt` (já fornecido) |

---

## Exame de Preparação

| # | Ficheiro PNG | O que mostrar | Falstad? |
|---|---|---|---|
| ✅ | `figuras/fig_exam_p1_rc_thevenin.png` | Vs AC → R=2 kΩ em série → nó A → C=100 nF para massa em paralelo com RL=3 kΩ. Marcar VTh (tensão em A com RL desligado) e ZTh. | ✅ `falstad/circ_exam_p1.txt` |
| ✅ | `figuras/fig_exam_p2_filtro_pb.png` | AmOp inversor. Vi → R1=10 kΩ → entrada (−). Malha de feedback: Rf=100 kΩ em **paralelo** com Cf=1 nF. Entrada (+) à massa. Saída Vo. | ✅ `falstad/circ_exam_p2.txt` |
| ✅ | `figuras/fig_exam_p3_somador.png` | AmOp inversor com 2 entradas. V1 → R1=10 kΩ → nó (−). V2 → R2=30 kΩ → nó (−). Rf=60 kΩ de saída para (−). Entrada (+) à massa. Saída Vo. | ✅ `falstad/circ_exam_p3.txt` |
| ✅ | `figuras/fig_exam_p4_zener_clipper.png` | Vi=15sin(ωt) → R=1.5 kΩ → nó A. Em paralelo: ramo positivo (DZ1 cátodo para cima + D1 em série, limita em +8.7 V) e ramo negativo (DZ2 + D2 em antiparalelo, limita em −8.7 V). Saída Vo=nó A. | ✅ `falstad/circ_exam_p4.txt` |
| ✅ | `figuras/fig_exam_p5_bjt_ec.png` | BJT NPN. VCC=12 V. R1=100 kΩ (VCC→base), R2=33 kΩ (base→GND), RC=3.3 kΩ (VCC→coletor), RE=2.2 kΩ (emissor→GND), CE em paralelo com RE. Rsig=1 kΩ, RL=10 kΩ. Condensadores de acoplamento C1, C2. | ✅ `falstad/circ_exam_p5.txt` |

---

## Conceitos (opcional mas útil)

| # | Ficheiro PNG | O que mostrar | Falstad? |
|---|---|---|---|
| 🔲 📐 | `figuras/fig_conceito_cmrr_blocos.png` | Diagrama: sinal diferencial Vd e sinal modo-comum Vcm → bloco AmOp → Ad·Vd + Acm·Vcm = Vo. Seta de ruído/interferência como Vcm. | — |
| 🔲 📐 | `figuras/fig_conceito_bode_polo.png` | Gráfico de Bode: ganho em dB (eixo Y) vs frequência em Hz (eixo X, log). Linha horizontal até fc, depois −20 dB/dec. Marcar fc, GBW, −3 dB. | — |

---

## Exame de Preparação 2

| # | Ficheiro PNG | O que mostrar | Falstad? |
|---|---|---|---|
| 🔲 | `figuras/fig_exam2_p1_rlc_serie.png` | Fonte Vs=20∠0°V → R=2kΩ → L=50mH → C=100nF, todos em série. Marcar corrente I e tensões VR, VL, VC. | ⚡ `falstad/circ_exam2_p1.txt` |
| 🔲 | `figuras/fig_exam2_p2_filtro_pb.png` | AmOp inversor. Vi → C1=16nF em série com R1=10kΩ → entrada (−). Feedback: Rf=100kΩ **em paralelo** com Cf=160pF. Entrada (+) à massa. Saída Vo. | ⚡ `falstad/circ_exam2_p2.txt` |
| 🔲 📐 | `figuras/fig_exam2_p3_integrador.png` | AmOp inversor. Vi → R=10kΩ → entrada (−). Feedback: C=10nF de saída para (−). Entrada (+) à massa. Saída Vo. | ⚡ `falstad/circ_exam2_p3.txt` |
| 🔲 | `figuras/fig_exam2_p4_zener_regulador.png` | Vin=15V (DC) → R=560Ω → nó A. Zener Vz=9V de nó A para massa (cátodo em cima). RL=2.7kΩ em paralelo com o Zener. Saída Vo=nó A. Marcar IR, IZ, IL. | ⚡ `falstad/circ_exam2_p4.txt` |
| 🔲 | `figuras/fig_exam2_p5_bjt_inversor.png` | BJT NPN. VCC=5V → RC=1kΩ → coletor. Base: VIN → RB=10kΩ → base. Emissor à massa. Saída Vo=coletor. Marcar IB, IC, VIN, VO. | ⚡ `falstad/circ_exam2_p5.txt` |

---

## Resumo de contagem

| Secção | PNGs a criar | Falstad a criar | Falstad já feito |
|---|---|---|---|
| 1ª Frequência | 4 | 3 | 0 |
| 2ª Frequência | 5 | 4 | 0 |
| Exercícios Extra | 4 | 0 | 4 ✅ |
| Exame Preparação 1 | 5 | 5 | 0 |
| Exame Preparação 2 | 5 | 5 | 0 |
| Conceitos | 2 | 0 | 0 |
| **Total** | **25** | **17** | **4** |

---

## Workflow acordado

1. Miro desenha o circuito e exporta como PNG com o nome exacto da tabela acima
2. Miro envia o PNG aqui no chat
3. Eu coloco em `figuras/` e actualizo o markdown com `![](../figuras/fig_xxx.png)`
4. Miro envia o texto Falstad (copiado do Falstad → Edit → Export) com o nome `circ_xxx.txt`
5. Eu guardo em `falstad/` e adiciono link no markdown: `[Simular no Falstad](../falstad/circ_xxx.txt)`
