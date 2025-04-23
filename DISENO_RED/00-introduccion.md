# 00 Introducción

## Necesidad de evolucionar la red de acceso

- Aumento del consumo de contenido multimedia.  
- Migración de computación y almacenamiento a la nube.  
- Creciente demanda de servicios **Triple Play**.  
- La conectividad de alta velocidad es indispensable para el desarrollo económico y la competitividad frente a los grandes operadores.

---

## Servicio Triple Play

1. **Voz** – Telefonía sobre IP (VoIP) con servicios avanzados.  
2. **Banda ancha fija** – Acceso a datos de hasta **300 Mb/s**, llegando a **1 Gb/s simétrico**.  
3. **Televisión** – IPTV, TV broadcast o vídeo bajo demanda (VOD) mediante plataformas OTT.

### Tendencias Five Play y Six Play

| Evolución | Servicios añadidos |
|-----------|-------------------|
| **Five Play** | Telefonía móvil · Banda ancha móvil (4.5 G / 5 G) |
| **Six Play**  | Domótica (control de acceso, CCTV, etc.) |

---

## Del cobre a la fibra

| Capa de red | Medio histórico | Tendencia actual |
|-------------|-----------------|------------------|
| **Acceso**      | Par de cobre / radio | Fibra |
| **Agregación**  | Cobre / radio        | Fibra |
| **Dorsal**      | Fibra                | Fibra (DWDM) |

La red de acceso conecta al usuario con la central. La presión por mayores anchos de banda está acelerando la transición del cobre o radio hacia la fibra óptica.

---

## Tecnologías xDSL

- Desarrolladas a partir de **1989**; despliegue masivo **2001-2007**.  
- **ADSL** se aprueba en **1995**.  
- Multiplexa **voz** (0-4,4 kHz) y **datos** (30 kHz-1 MHz) mediante un *splitter*.  
- Velocidad dependiente de la calidad del par y la distancia a la central.  
- **VDSL2** (hasta HDTV):  
  - **200 Mb/s** a menos de 500 m  
  - **100 Mb/s** a 500 m  
  - **50 Mb/s** a 1 km

---

## Soluciones CATV / HFC

- Redes **CATV** (TV broadcast) nacen en los años 50; auge en los 80.  
- Evolución a **HFC** al sustituir los troncales coaxiales por fibra.  
- Estándar **DOCSIS** permite voz y datos de alta velocidad sobre HFC:

| Revisión | Año | Downstream | Upstream | Observaciones |
|----------|-----|------------|----------|---------------|
| DOCSIS 1.0 | 1997 | 55 Mb/s | 10 Mb/s | MPEG-2 · 16-QAM |
| DOCSIS 1.1 | 1999 | 55 Mb/s | 10 Mb/s | QoS · menor latencia |
| DOCSIS 2.0 | 2001 | 55 Mb/s | 30 Mb/s | IPv6 · hasta 256-QAM |
| DOCSIS 3.0 | 2006 | 160 Mb/s | 120 Mb/s | *Channel bonding* |
| DOCSIS 3.1 | 2014 | 10 Gb/s | 1 Gb/s | OFDM · 4096-QAM |

**Limitaciones HFC**

- Topología activa → mayor mantenimiento.  
- Degradación de equipamiento en campo.  
- Coste de escalar a DOCSIS 3 ≈ desplegar FTTH.  
- Canal de retorno complejo.

---

## Arquitecturas FTTx

| Acrónimo | Significado | Punto de terminación de la fibra | Último tramo |
|----------|-------------|----------------------------------|--------------|
| **FTTCab / FTTN** | Fiber to the Cabinet / Node | Armario de calle | xDSL |
| **FTTC** | Fiber to the Curb | Armario en la esquina | VDSL |
| **FTTB** | Fiber to the Building | Sala de comunicaciones | Par trenzado / coaxial |
| **FTTH** | Fiber to the Home | Vivienda del usuario | Fibra completa |
| **FTTR** | Fiber to the Room | Habitación (hoteles, hospitales) | Fibra |

> **En este curso nos centraremos en FTTH** como solución óptima para redes de acceso de nueva generación.

---

Autor: **Juan Manuel Quijada Cárdenas**  
© 2016 – Todos los derechos reservados.
