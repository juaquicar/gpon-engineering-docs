# 05 Elementos de la red – planta interna

En la cabecera de una red FTTH (también llamada **CO – Central Office**) se concentran los equipos activos y pasivos que inyectan la señal óptica hacia la planta externa y gestionan los servicios.

| Grupo | Función general | Ejemplos de equipos |
|-------|-----------------|---------------------|
| **Infraestructura física** | Alojar, organizar y proteger el hardware | • Racks 19″ <br>• Bandejas de alimentación |
| **Transporte y conmutación** | Encaminamiento IP, backhaul y peering | • Router / Core MPLS <br>• Equipamiento de caudal (switches 10/25/40/100 GbE) |
| **Acceso óptico** | Generar, gestionar y monitorizar PON | • OLT GPON / XGS-PON <br>• Tarjetas PON y transceivers SFP/SFP+ |
| **Conexión y gestión de fibras** | Terminar, etiquetar y distribuir fibras | • Patch paneles SC/APC <br>• Organizadores de latiguillos |
| **Vídeo RF overlay \*** | Distribución de TV analógica/digital fuera de la VLAN IP | • Cabecera TV (IRDs, moduladores) <br>• Servidor de vídeo digital <br>• Transmisor-modulador óptico OFDM <br>• Amplificador EDFA <br>• Mux/Demux DWDM (1550 nm) |

\* El “RF overlay” se usa cada vez menos en favor de IPTV, pero aún aparece en despliegues que desean compatibilidad con TV coaxial existente.

---

## 1. Infraestructura física

### Rack 19″
- Normas **EIA-310** (ancho 19 inch, unidades U).  
- Canalización de energía redundante (A/B) y PDU gestionables.  
- Guías de fibra y latiguillos en la parte frontal para minimizar radio de curvatura.

---

## 2. Transporte y core IP

1. **Equipamiento de caudal**  
   - Switches de agregación L2/L3 (10/25 GbE uplinks).  
   - QoS y colas para tráfico residencial vs. corporativo.

2. **Router/Core**  
   - Encaminamiento BGP, MPLS-TE o Segment-Routing.  
   - NAT64/NAT44, CG-NAT si es necesario.  
   - Alta disponibilidad (fuentes y planos de control redundantes).

---

## 3. OLT (Optical Line Terminal)

| Parámetro típico | GPON (B+/C+) | XGS-PON |
|------------------|--------------|---------|
| Potencia láser TX | +1…+5 dBm | +4…+7 dBm |
| Sensibilidad RX | –28/–30 dBm | –29/–32 dBm |
| Usuarios / puerto | 64 – 128 | 64 – 128 |
| Tasa bruta por puerto | 2.488 Gb/s ↓ · 1.244 Gb/s ↑ | 9.953 Gb/s ↓ ↑ |

**Funciones clave**

- Medición de potencia Rx/Tx y rangos de alcance (µOLT).  
- Asignación dinámica de ancho de banda *(DBA)*.  
- Protocolo **OMCI** para gestión remota de ONT.  
- Criptografía AES 128 para cada ramal.

---

## 4. Patch panel

- Conectores **SC/APC** (8° pulido) para planta externa.  
- Etiquetado claro: \_\_OLT-PONxx / Splitter-xx / CTO-xx\_\_.  
- Inventario en software GIS/OSS para trazabilidad de empalmes.

---

## 5. Cadena de vídeo RF overlay (opcional)

1. **Cabecera TV**  
   - IRDs (Integrated Receiver Decoders) para señales satélite/terrestre.  
   - Moduladores QAM/OFDM.

2. **Servidor de vídeo digital**  
   - Playout de canales locales y VOD no IP.

3. **Transmisor-modulador óptico OFDM**  
   - Banda eléctrica UHF (≤ 900 MHz) o UHF + satélite (≤ 2.3 GHz).  
   - Control de nivel de entrada y distorsión.

4. **Amplificador óptico EDFA**  
   - Ganas configurables 13 – 23 dB.  
   - Hasta 16 salidas con potencia plana (±0.5 dB).

5. **Multiplexor DWDM (1550 nm)**  
   - Combina vídeo (1550 nm) con datos OLT (1490/1310 nm).  
   - Pérdidas típicas 0.7-1.5 dB.

---

## 6. Servicios IP en la cabecera

| VLAN | Servicio | Opinión | Ejemplo |
|------|----------|---------|---------|
| 100 | Internet | PPPoE / DHCP-IPoE | 10.0.0.0/24 |
| 200 | VoIP     | SIP / RTP | 172.20.20.0/24 |
| 300 | IPTV     | Multicast IGMP snooping | 239.0.0.0/16 |
| 500 | Gestión  | SNMP, OMCI, TR-069 | 172.20.21.0/24 |

> Separar tráfico por VLAN + GEM-port garantiza calidad de servicio (T-CONTs) y facilita la solución de incidencias.

---

### Resumen operativo

Una **planta interna bien organizada** minimiza tiempos de alta y mantenimiento:

- Documentación exhaustiva de patching y potencias.  
- Etiquetado uniforme de todas las fibras y equipos.  
- Racks con flujo de aire frontal-trasero y pasillos fríos/calientes.

---

Autor: **Juan Manuel Quijada Cárdenas**  
© 2016 — Todos los derechos reservados.
