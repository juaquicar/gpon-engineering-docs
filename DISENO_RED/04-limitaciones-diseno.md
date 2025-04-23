# 04 Limitaciones de diseño

En cualquier red óptica —y en FTTH en particular— existen **dos grandes familias de restricciones técnicas**:

| Tipo de limitación | Causa | Efecto principal |
|--------------------|-------|------------------|
| **Potencia (atenuación)** | Pérdidas en fibra, empalmes, conectores y _splitters_ | La señal óptica llega más débil al receptor. |
| **Dispersión** | Ancho espectral de la fuente + características físicas de la fibra | Ensanchamiento de los pulsos → posible solapamiento de bits a muy alta tasa. |

---

## 1. Presupuesto de potencia (link budget)

La regla básica es:

> **Potencia TX – (∑ Pérdidas) ≥ Sensibilidad RX + Margen**

### Ejemplo típico de un ramal GPON

| Elemento | Cantidad | Pérdida unitaria (dB) | Pérdida total (dB) |
|----------|----------|-----------------------|--------------------|
| Empalmes mecánicos | 2 | 0.5 | **1.0** |
| Fusiones por arco | 4 | 0.1 | **0.4** |
| Splitters 1:8 (1.º y 2.º nivel) | 2 | 11 | **22.0** |
| Fibra (0.35 dB/km, 20 km máx.) | — | 0.35 × 20 = **7.0** | **7.0** |
| **Total de pérdidas** | | | **30.4 dB** |

**Potencia láser OLT (Clase C+)**: **+5 dBm**  
**Sensibilidad típica de la ONT**: **–28 dBm**  
**Margen recomendado**: **3 dB**

```
(+5 dBm) – (30.4 dB) = –25.4 dBm  
–25.4 dBm ≥ (–28 dBm + 3 dB) ⇒ **Enlace válido** ✔
```

> La clase B+ (28 dB) o C+ (30 dB) de las OLT define justamente el “presupuesto” máximo que puede disiparse en el enlace.

---

## 2. Dispersión

En redes PON de acceso (≤ 20 km) la **dispersión cromática** y la **PMD** (Polarisation Mode Dispersion) son poco críticas, porque:

- Se opera a **2.5 Gb/s** (GPON) o **10 Gb/s** (XGS-PON); el límite práctico está por encima.  
- Se emplea fibra **G.652.D** con dispersión < 18 ps/(nm·km) a 1550 nm.

> Para fabricantes de OLT/ONT, la dispersión dicta el tipo de modulación y la tasa máxima. Para el diseñador de planta externa, la **potencia** suele ser el cuello de botella.

---

## 3. Resumen de la fibra recomendada (G.652.D)

| Ventana | Long. de onda (nm) | Atenuación máx. (dB/km) | Dispersión cromática máx. |
|---------|-------------------|-------------------------|---------------------------|
| 2.ª | 1310 | **0.34** | **< 2.8 ps/(nm·km)** |
| 3.ª | 1550 | **0.24** | **< 18 ps/(nm·km)** |

Esto garantiza márgenes confortables para GPON/B+ y para evoluciones de 10 Gb/s sin regeneración óptica.

---

Autor: **Juan Manuel Quijada Cárdenas**  
© 2016 — Todos los derechos reservados.
