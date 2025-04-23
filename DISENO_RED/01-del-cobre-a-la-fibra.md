# 01 Del cobre a la fibra

## 1. Evolución de los servicios: Triple Play → Five Play → Six Play

| Etapa | Servicios incluidos |
|-------|--------------------|
| **Triple Play** | **Voz IP** · **Banda ancha fija** (≤ 1 Gb/s) · **Televisión** (IPTV, Broadcast, VOD/OTT) |
| **Five Play**   | Triple Play + **Telefonía móvil** + **Banda ancha móvil** (4.5 G / 5 G) |
| **Six Play**    | Five Play + **Domótica / IoT** (control de accesos, videovigilancia, etc.) |

---

## 2. De la red de acceso de cobre a la red de fibra

### 2.1 Capas de red y medios predominantes

| Capa | Función | Medio tradicional | Tendencia |
|------|---------|-------------------|-----------|
| **Acceso** | Conecta usuario ↔ central | Par de cobre / radio | **Fibra (FTTx)** |
| **Agregación** | Concentra redes de acceso | Cobre / radio | **Fibra** |
| **Dorsal (troncal)** | Autopistas de Internet | Fibra | **Fibra (DWDM)** |

> **Conclusión**: La demanda de ancho de banda impulsa la sustitución progresiva del cobre y el coaxial por fibra óptica hasta el usuario final.

---

## 3. Tecnologías xDSL

| Tecnología | Año clave | Downstream máx. | Alcance típico | Observaciones |
|------------|-----------|-----------------|---------------|---------------|
| **ADSL**  | 1995 | 8 Mb/s | 3-5 km | Multiplexa voz y datos (splitter) |
| **ADSL2+** | 2002 | 24 Mb/s | 2-2.5 km | Mayor espectro (2.2 MHz) |
| **VDSL2** | 2006 | 200 Mb/s (≤ 300 m) | 0.3-1 km | Diseñado para Triple Play / HDTV |

*Limitación principal*: la velocidad cae rápidamente con la distancia y la calidad del par de cobre.

---

## 4. Soluciones CATV / HFC

### 4.1 Origen y concepto

- **CATV**: difusión masiva de TV (años 50; expansión en los 80).  
- **HFC**: troncales y ramales principales en fibra, tramo final en coaxial.

### 4.2 Evolución del estándar DOCSIS

| Revisión | Año | Downstream | Upstream | Características |
|----------|-----|------------|----------|-----------------|
| 1.0 | 1997 | 55 Mb/s | 10 Mb/s | MPEG-2 · 16-QAM |
| 1.1 | 1999 | 55 Mb/s | 10 Mb/s | QoS · menor latencia |
| 2.0 | 2001 | 55 Mb/s | 30 Mb/s | IPv6 · hasta 256-QAM |
| 3.0 | 2006 | 160 Mb/s | 120 Mb/s | *Channel bonding* |
| 3.1 | 2014 | 10 Gb/s | 1 Gb/s | OFDM · 4096-QAM |

### 4.3 Desventajas de las redes HFC

- Topología **activa** → más mantenimiento y fallos.  
- Degradación de componentes electrónicos en campo.  
- Escalar a DOCSIS 3.x puede costar casi lo mismo que desplegar FTTH.  
- Canal de retorno limitado.  
- Complejidad en la manipulación del coaxial.

---

## 5. Arquitecturas FTTx

| Acrónimo | “Fiber To The …” | Punto de terminación de la fibra | Último tramo |
|----------|------------------|----------------------------------|--------------|
| **FTTCab / FTTN** | Cabinet / Node | Armario de calle | xDSL |
| **FTTC** | Curb | Armario en la esquina | VDSL |
| **FTTB** | Building | Sala de comunicaciones del edificio | Cobre / coaxial |
| **FTTH** | Home | Vivienda del usuario | Fibra completa |
| **FTTR** | Room | Habitación (hoteles, hospitales) | Fibra |

> En redes de nueva generación la meta es **FTTH**, que elimina completamente las limitaciones del par de cobre y del coaxial.

---

Autor: **Juan Manuel Quijada Cárdenas**  
© 2016 — Todos los derechos reservados.
