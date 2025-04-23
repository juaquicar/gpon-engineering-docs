# 02 Redes FTTH

## 1. Introducción y terminología FTTx

| Acrónimo | “Fiber To The…” | Descripción | Último tramo |
|----------|-----------------|-------------|--------------|
| **FTTB** | **Building**    | Fibra hasta la sala de comunicaciones del edificio; distribución interna por par trenzado o coaxial. | Cobre / coaxial |
| **FTTH** | **Home**       | Fibra hasta la vivienda; elimina todas las restricciones del cobre. | 100 % fibra |
| **FTTO / FTTU** | **Office / User** | Variantes de FTTH orientadas a oficinas o usuarios específicos. | Fibra |
| **FTTR** | **Room**       | Fibra hasta la habitación (hoteles, hospitales); auge desde 2018. | Fibra |

---

## 2. Componentes de una red FTTH

| Sigla | Nombre | Función principal |
|-------|--------|-------------------|
| **OLT** | Optical Line Terminal | Equipo en la cabecera que convierte señales eléctricas ↔ ópticas y gestiona la red PON. |
| **ODN** | Optical Distribution Network | Tramos de fibra, empalmes y **splitters** que distribuyen la señal. |
| **ONT / ONU** | Optical Network Terminal / Unit | Equipo en el hogar que convierte la señal óptica a Ethernet, Wi-Fi, etc. |
| **Red pasiva** | (98 % de los despliegues) | Solo elementos ópticos sin alimentación entre la OLT y la ONT. |
| **Red activa** | (casos puntuales) | Elementos alimentados intermedios que regeneran la señal. |

---

## 3. Arquitecturas FTTH

### 3.1 Punto a punto (P2P)

| Ventajas | Inconvenientes |
|----------|----------------|
| - Sencilla y robusta  | - No es multicast |
| - Pérdidas mínimas    | - Necesita **1 fibra / 1 puerto OLT** por abonado |
| - “Ancho de banda ilimitado” | - Mayor consumo energético y espacio en central |
| | - Muchos empalmes y cables de alta densidad |

> **Uso recomendado**: entornos empresariales o de muy baja densidad donde se requiere máximo caudal por usuario.

---

### 3.2 Punto-multipunto (árbol / estrella)

- **Concepto**: una OLT sirve a muchas ONT mediante *splitters* pasivos.  
- **Ventajas clave**  
  - Reduce el número de fibras en planta externa.  
  - Medio compartido multicast.  
  - Alcances de **decenas de kilómetros**.  
  - Coste por abonado mucho menor que P2P.  
- **Implementación**: **PON** (Passive Optical Network).

> **Uso recomendado**: despliegues residenciales masivos.

#### Otras configuraciones

| Topología | Pros | Contras |
|-----------|------|---------|
| **Bus**   | Simplicidad | Si falla el enlace principal cae toda la red; baja privacidad. |
| **Anillo**| Robustez (autorreconduce tráfico) | Mayor coste de fibra y empalmes. |

---

## 4. Solución PON

- Red **pasiva** punto-multipunto con **splitters** ópticos.  
- Ancho de banda por usuario (ejemplo GPON 1:64): **2.5 Gb/s** DL · **1.25 Gb/s** UL.  
- Cobertura: hasta **20 km** (diseños GPON) e incluso 60 km con OLT de alta potencia.  
- Inmune a interferencias electromagnéticas.  
- **Asignación de longitudes de onda**:  
  - **1310 nm** ↑ (upstream, TDMA)  
  - **1490 nm** ↓ (downstream, TDM)  
  - **1550 nm** ↓ (broadcast de vídeo RF)

---

## 5. Protocolos de la familia PON

| Norma | Año | Down / Up | Split máx. | Notas destacadas |
|-------|-----|-----------|------------|------------------|
| **APON (G.983)** | 1998 | 155 / 155 Mb/s | 1:32 | ATM en Capa 2 |
| **BPON (G.983.1-4)** | 2001 | 622 / 155 Mb/s | 1:128 | WDM para vídeo · Gestión mejorada |
| **EPON (IEEE 802.3ah)** | 2004 | 1 / 1 Gb/s | 1:64 | Tramas Ethernet · Nicho en Asia |
| **GPON (G.984)** | 2003 | 2.5 / 1.25 Gb/s | 1:128 | Encapsulado **GEM** · QoS avanzada · OMCI |
| **XG-PON (G.987)** | 2009 | 10 / 2.5 Gb/s (XG-PON1) | 1:128 | Compatible con GPON (coexistencia) |
| **XGS-PON (G.9807)** | 2016 | 10 / 10 Gb/s | 1:128 | Simétrico · Migración natural desde GPON |
| **NG-PON2** | 2015 | 40 / 10 Gb/s (4×10 G) | 1:256 | Multi-longitud (TWDM) · Longitud de 80 km |
| **WDM-PON** | — | ≥ 10 Gb/s por usuario | P2P | Una λ dedicada por ONT mediante AWG |

---

## 6. Resumen

- **FTTH** sustituye por completo el cobre, ofreciendo mayor capacidad, menor mantenimiento y gran alcance.  
- La **arquitectura PON** es el estándar de facto para entornos residenciales, mientras que **P2P** se reserva a nichos de alto caudal.
- La evolución tecnológica (GPON → XGS-PON → NG-PON2) permite incrementar el ancho de banda sin rehacer la planta externa, protegiendo la inversión.

---

Autor: **Juan Manuel Quijada Cárdenas**  
© 2016 — Todos los derechos reservados.
