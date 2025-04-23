# 03 Fibra óptica

## 1. ¿Qué es la fibra óptica?

La **fibra óptica** es un hilo muy fino y frágil —fabricado normalmente en vidrio de sílice o en plástico especial— capaz de transmitir pulsos de luz a gran velocidad y con muy baja atenuación.

![Esquema de fibra óptica](fibra.png)

### Estructura básica

| Capa | Función | Índice de refracción |
|------|---------|----------------------|
| **Núcleo** | Guía la señal óptica | *n₁* (más alto) |
| **Revestimiento** | Mantiene la luz confinada en el núcleo por reflexión interna total | *n₂ < n₁* |
| **Revestimientos externos / cubierta** | Protección mecánica y barrera ante la humedad | N/A |

---

## 2. Tipos de fibra

| Tipo | Diámetro núcleo / cubierta (μm) | Ventajas | Limitaciones | Usos típicos |
|------|---------------------------------|----------|--------------|--------------|
| **Multimodo (OMx)** | 50/125 &nbsp;·&nbsp; 62.5/125 | Láseres y LED baratos · Electrónica menos exigente | Dispersión modal → distancias ≤ 2 km | Centros de datos, campus, audiovisuales |
| **Monomodo (OSx)** | 8–10/125 | Atenuación y dispersión muy bajas → decenas de km | Alineación y electrónica más precisas | Redes de acceso FTTH, transporte DWDM |

> En redes GPON / XGS-PON se emplea **fibra monomodo** clase **G.652.D** casi de forma exclusiva.

---

## 3. Parámetros de la fibra estándar G.652.D

| Parámetro | 2.ª ventana (1310 nm) | 3.ª ventana (1550 nm) | Unidades |
|-----------|-----------------------|-----------------------|----------|
| Atenuación media | **< 0.34** | **< 0.24** | dB/km |
| Dispersión cromática | **< 2.8** | **< 18** | ps/(nm·km) |
| Dispersión a 1285 nm | — | **< 17** | ps/(nm·km) |

*La baja atenuación y la dispersión controlada hacen que G.652.D sea la opción ideal para redes de acceso pasivas de hasta 20 km sin necesidad de amplificación.*

---

## 4. Ventajas clave de la fibra frente al cobre/coaxial

- **Ancho de banda masivo** (decenas de Tb/s en fibras de transporte).
- **Baja pérdida**: ≈ 0.2 dB/km frente a varios dB/100 m del cobre.
- **Inmunidad electromagnética**: no capta interferencias ni genera ruido.
- **Peso y diámetro reducidos**: cables con cientos de fibras ocupan menos que un solo par coaxial grueso.
- **Seguridad**: es muy difícil pinchar la señal sin interrumpirla.

---

## 5. Buenas prácticas de manipulación

1. **Radio mínimo de curvatura**: ≥ 30 mm para evitar pérdidas por microdoblados.  
2. **Protección frente a humedad**: sellar empalmes y conectores.  
3. **Limpieza de conectores**: imprescindible antes de cada medición o conexión.  
4. **Gestión de excedentes**: bobinar en “figura de ocho” para no torsionar la fibra.  

---

Autor: **Juan Manuel Quijada Cárdenas**  
© 2016 — Todos los derechos reservados.
