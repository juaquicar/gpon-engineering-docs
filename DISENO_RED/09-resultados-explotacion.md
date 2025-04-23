# 09 Resultados y explotación de la red

Con el diseño aprobado, es momento de **entregar documentación “as-built”** y organizar la fase operativa (puesta en marcha, legalización y soporte).

---

## 1. Entregables de planos

| Plano | Contenido | Observaciones |
|-------|-----------|---------------|
| **Situación** | Mapa general de la localidad y alcances de cobertura. | Formato georreferenciado (SHP/GeoJSON). |
| **Zonificación** | Delimitación de nodos, zonas PON y áreas de influencia (AI). | Escala 1:5 000. |
| **Central (CO)** | Distribución de racks, OLT, patch-panel, EDFA, etc. | Identificación de rutas de fibra que salen de la cabecera. |
| **GICA / Distancias** | Itinerario de troncal y subtroncal con kilometraje. | Útil para control de stock de cable. |
| **Alimentación** | Red troncal + subtroncal. | Se adjunta **desglose** por nodos. |
| **Distribución** | Rutas CD → CTO y CTO → acometida. | Incluye **desglose** por manzana o bloque. |
| **Interiores** | Canalización vertical y horizontal en edificios singulares. | Plano RITI/RITS. |

> Cada plano lleva escalas, leyenda y hoja de cambios versionada.

---

## 2. Etiquetado y cartas de empalme

### 2.1 Esquema de etiquetas

| Elemento | Formato de etiqueta | Ejemplo |
|----------|--------------------|---------|
| **CD**   | `CD.<Nodo>.<ID>,<#Div>` | `CD.G.1,1DV` |
| **CTO/CA** | `CA.<Grupo>.<ID>,<#Div>` | `CA.G.1.1,1DV` |
| **Cable** | `[<Nº Fibras> F.O. <ORIG>-<DEST>]` | `[12 F.O. EXT-INT]` |
| **Fusiones** | `nFM#<rango>` | `9FM#2-3+5+7-12` |

### 2.2 Carta de empalme

Una **carta de empalme** describe:
- Número de fibras por tubo.
- Color/secuencia de cada fibra empalmada.
- Continuidad y arrastres.
- Pérdidas tras fusión (OTDR).

Se adjunta modelo en formato XLS / PDF para actualización en campo.

---

## 3. Diseño del **DATAPLAN**

| Servicio | VLAN | Pool IP | Tipo GEM | T-CONT |
|----------|------|---------|----------|--------|
| Internet | 100 | Públicas o `10.0.0.0/24` | PPPoE | 1 |
| VoIP | 200 | `172.20.20.0/24` | DHCP | 2 |
| Gestión | 500 | `172.20.21.0/24` | DHCP | 3 |
| IPTV / Multicast | 300 | 239.0.0.0/16 | IGMP | 4 |

- Cada servicio IP se encapsula en **un GEM-port** independiente.  
- **T-CONT** define la política DBA (Dynamic Bandwidth Allocation).  
- En redes con RF Overlay, vídeo de 1550 nm se mantiene fuera de IP.

---

## 4. Configuración de equipamiento

Ejemplos prácticos:

- **Huawei MA56xxT + MikroTik** → ver guía:  
  `https://www.ispfacil.es/2017/11/configuracion-de-una-red-ftth-con-mikrotik-y-olt-huawei-ma56xxt/`
- **Televes OLT512 + MikroTik** → ver guía:  
  `https://www.ispfacil.es/2018/01/configuracion-de-una-red-ftth-con-mikrotik-y-televes-olt512/`

> Los scripts de provisión pueden automatizarse vía **NETCONF / Ansible**.

---

## 5. Legalización y licencias

| Paso | Responsable | Documentación |
|------|-------------|---------------|
| **Plan de despliegue** | Operador ↔ Ayuntamiento | Memoria técnica + trazado GIS |
| **Proyecto técnico visado** | Ingeniero colegiado | Cálculo de cargas, cumplimiento ITC-TIE |
| **Autorización de fachada** | Operador ↔ Propiedad | Acta de comunidad / LGTel art. 45 |
| **Registro en CNMC** | Operador | Fichero SNR (Infraestructura) |

---

## 6. Instrumentación para explotación

| Herramienta | Uso | Comentario |
|-------------|-----|------------|
| **OTDR multimodo/monomodo** | Certificación de enlaces y localización de fallos. | Lanza pulsos 1310/1550 nm. |
| **Power Meter & Light Source** | Medición de potencia en servicio. | Necesario en altas y SAT. |
| **Reflectómetro PON (iOLM)** | Diagnóstico sin interrumpir clientes. | Especial GPON/XGS-PON. |
| **Fusionadora core-alignment** | Empalmes con < 0.05 dB. | Registro automático de pérdida por empalme. |

---

## 7. “Checklist” de puesta en marcha

1. ✅ Pruebas OTDR dentro del presupuesto de potencia (bloque 04).  
2. ✅ Configuración OLT con perfiles DBA y OMCI correctos.  
3. ✅ Registro automático de ONT en OSS.  
4. ✅ Monitorización SNMP / Syslog habilitada.  
5. ✅ Respaldos de configuración y exportación de planos finales.

> Completar la lista garantiza SLA desde el “día 0” de producción.

---

Autor: **Juan Manuel Quijada Cárdenas**  
© 2016 — Todos los derechos reservados.
