# 1ª Frequência — Pergunta 1: Divisor de Corrente

## Conceito

Quando uma corrente $I$ chega a um nó com dois ramos em paralelo, cada ramo recebe uma fracção da corrente inversamente proporcional à sua impedância — o ramo mais "fácil" (menor impedância) leva mais corrente.

---

## Circuito

```
        I →  ──┬── Z1 ── I1 →
               │
               └── Z2 ── I2 →
```

Os dois ramos estão em paralelo: a tensão aos terminais é igual para ambos.

---

## a) Correntes I₁ e I₂ em função de Z₁, Z₂ e I

**Tensão comum aos dois ramos:**

Como estão em paralelo, a tensão $V$ é a mesma:

$$V = I_1 Z_1 = I_2 Z_2$$

**Conservação de corrente no nó:**

$$I = I_1 + I_2$$

**Resolver para I₁:**

$$I_2 = \frac{I_1 Z_1}{Z_2}$$

$$I = I_1 + \frac{I_1 Z_1}{Z_2} = I_1 \left(1 + \frac{Z_1}{Z_2}\right) = I_1 \frac{Z_1 + Z_2}{Z_2}$$

$$\boxed{I_1 = I \cdot \frac{Z_2}{Z_1 + Z_2}}$$

$$\boxed{I_2 = I \cdot \frac{Z_1}{Z_1 + Z_2}}$$

> **Regra prática:** cada ramo recebe a impedância do **outro** ramo a dividir pela soma.

---

## b) Casos limite

### i) Z₁ = 0, Z₂ finito ≠ 0

$$I_1 = I \cdot \frac{Z_2}{0 + Z_2} = I \cdot \frac{Z_2}{Z_2} = I$$

$$I_2 = I \cdot \frac{0}{0 + Z_2} = 0$$

**Conclusão:** Z₁ = 0 é um curto-circuito. Toda a corrente passa por Z₁; Z₂ fica sem corrente. Faz sentido: o curto impõe V = 0 nas duas extremidades do paralelo, logo não há corrente em Z₂.

### ii) Z₂ → ∞, Z₁ finito

$$I_1 = I \cdot \frac{Z_2}{Z_1 + Z_2} \xrightarrow{Z_2 \to \infty} I \cdot \frac{1}{1 + Z_1/Z_2} \to I$$

$$I_2 = I \cdot \frac{Z_1}{Z_1 + Z_2} \xrightarrow{Z_2 \to \infty} 0$$

**Conclusão:** Z₂ = ∞ é um circuito aberto. Toda a corrente flui por Z₁; nada passa pelo ramo aberto. Novamente óbvio: um circuito aberto não deixa passar corrente.
