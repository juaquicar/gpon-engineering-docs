# 06 Elementos de la red – planta externa

La **planta externa** abarca todo el tramo entre la salida de la cabecera y la roseta óptica del cliente. Para organizarla con claridad distinguiremos dos grandes familias de cajas:

| Familia | Sub-tipo | Rol principal |
|---------|----------|---------------|
| **Cajas de empalme** (sin conectores de cliente) | • **Torpedo** (alimentación) <br>• **Caja de distribución** (1.º nivel de splitteo) <br>• **Caja de empalme estándar** (derivaciones menores) | Protección de fusiones y/o splitters internos |
| **Cajas terminales** | • **CTO / CA** (2.º nivel, salidas preconectorizadas) | Presentar puertos ópticos listos para acometidas de abonado |

---

## 1. Cajas de empalme

### 1.1 Torpedo (splice closure de alimentación)

| Aspecto | Detalle |
|---------|---------|
| **Función** | Dar continuidad a cables troncales y subtroncal; NO contiene splitters. |
| **Capacidad** | 96-576 fusiones según modelo. |
| **Hermeticidad** | IP68 · IK09 · Resistencia UV. |
| **Instalación** | Arqueta subterránea, poste, fachada o cámara visitable. |
| **Ventajas** | • Alta robustez <br>• Permite reserva holgada de tubo <br>• Fácil reapertura para ampliación. |

---

### 1.2 Caja de distribución (con splitters de 1.º nivel)

| Aspecto | Detalle |
|---------|---------|
| **Función** | Albergar fusiones **+ splitters 1:4 o 1:8**. Marca el paso **subtroncal → distribución**. |
| **Capacidad típica** | 4 bandejas × 12 fusiones + 2 × splitter PLC. |
| **Acceso** | 2 entradas principales (feeder / feeder) + varias derivaciones out. |
| **Instalaciones** | Fachada, poste, cámara subterránea protegida. |
| **Etiqueta** | `CD.<Nodo>.<ID>` (ej. `CD.G1.2`) |

---

### 1.3 Caja de empalme estándar (derivaciones menores)

- Se usa para **empalmes sencillos** (bypass, paso a tubería secundaria, reparaciones).
- Puede alojar **≤ 24 fusiones** y, opcionalmente, un *splitter “tap”* 1:2 o 1:4.
- Diseño compacto IP55-IP65; no está pensado para abrirse frecuentemente.

---

## 2. Cajas terminales (CTO / CA)

### 2.1 CTO – Caja Terminal Óptica

| Parámetro | Valor habitual |
|-----------|----------------|
| **Splitters internos** | 1:8 / 1:16 (segundo nivel) |
| **Puertos preconectorizados** | 4 · 8 · 16 · 24 · 32 (SC/APC) |
| **Tipo de conector interior** | Fast-connector o fusión pigtail (SC/APC) |
| **Fibras de arrastre** | ≥ 1 fibra “muerta” por splitter para crecimiento |
| **Montaje** | Fachada, RITI, poste metálico, caja interior de edificio |
| **Etiqueta** | `CTO.<Zona>.<ID>` (ej. `CTO.PON3.7`) |

#### Funciones concretas

1. Terminar la fibra de distribución y los arrastres.  
2. Presentar puertos listos para **latiguillo drop** (0.9 mm o 2 mm) hacia el abonado.  
3. Facilitar medición y alta sin fusión adicional (plug-and-play).

---

## 3. Dispositivos ópticos pasivos

| Tipo | Formato | Uso | Pérdida típica |
|------|---------|-----|----------------|
| **Splitter PLC** | Cassette/bandeja/módulo SC | 1.º y 2.º nivel | 3.6 dB (1:2) – 19.5 dB (1:64) |
| **Splitter FBT** | Tubo metálico | Derivaciones ≤ 1:4 | Ligeramente mayor desequilibrio |

---

## 4. Cables y microtubos (resumen)

| Construcción | Ubicación | Características |
|--------------|-----------|-----------------|
| **Loose-tube** | Exterior / canalización | Gel anti-humedad · 6-288 fibras |
| **Mini-cable (microduct)** | Soplado en microtubo | 96 fibras Ø 6-8 mm |
| **Tight-buffer** | Interior / vertical | LSZH · Radio de curvatura reducido |
| **Cable drop** | CTO → ONT | 1 o 2 fibras · Preconectorizado SC/APC |

---

## 5. Conectividad y empalmes (pérdidas de referencia)

| Método | Pérdida (dB) | Reflexión (dB) | Contexto |
|--------|--------------|----------------|----------|
| Fusión arco | 0.05-0.10 | –60 | Toda la planta externa |
| Empalme mecánico | 0.25-0.35 | –45 | Reparación de emergencia |
| SC/APC | 0.20 | –60 | CTO, ONT, OLT |
| SC/UPC | 0.25 | –50 | Laboratorio, corto interior |

---

## 6. Buenas prácticas específicas

- **Diferenciar colores de tubo** entre feeder (troncal), distribution y drop.  
- Mantener **reserva mínima**: 1.5 m de fibra holgada en cada bandeja.  
- Todos los splitters deben quedar **etiquetados** con su ratio y nº de serie.  
- CTO: conservar ***diagrama de ocupación*** (puertos vs. viviendas) plastificado dentro de la tapa.  
- Torpedo: anclar con **grapas dieléctricas** y evitar torsión de mangas termorretráctiles.

---

Autor: **Juan Manuel Quijada Cárdenas**  
© 2016 — Todos los derechos reservados.
