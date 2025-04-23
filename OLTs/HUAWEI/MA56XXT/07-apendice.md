

# 07 – Apéndice técnico: ONTs, tarjetas y referencias

Este apéndice recoge información complementaria de utilidad para técnicos de campo, integradores y responsables de red que trabajen con la serie MA56XXT de Huawei.

---

## 📦 Modelos comunes de ONT compatibles

| Modelo         | Puertos ETH | POTS | CATV | Wi-Fi | Notas                             |
|----------------|-------------|------|------|-------|-----------------------------------|
| HG8546M        | 4           | 1    | No   | 2.4GHz | Uno de los modelos más usados     |
| EG8145V5       | 4           | 1    | No   | 2.4/5GHz | Ideal para entornos con Wi-Fi AC |
| EG8010Hv6      | 1           | No   | No   | No    | ONT compacta, sin Wi-Fi           |
| EG8247Q        | 4           | 2    | Sí   | 2.4GHz | Triple-play (IPTV + VoIP + datos) |
| EG8245H5       | 4           | 2    | No   | 2.4GHz | Muy extendida en entornos mixtos  |

> 🔎 **Nota:** Las ONTs Huawei pueden tener compatibilidad limitada según el `ont-lineprofile` y `ont-srvprofile` aplicados.

---

## 🔌 Tipos de tarjetas compatibles con MA56XXT

| Modelo        | Tipo              | Descripción                                                                 |
|---------------|-------------------|-----------------------------------------------------------------------------|
| H806GPBD      | GPON              | 8 puertos, muy común en despliegues residenciales                          |
| H805GPFD      | GPON              | 16 puertos, alta densidad                                                   |
| H802SCUN      | Controladora      | Tarjeta de control estándar                                                 |
| H803SCUH      | Controladora      | Mayor capacidad de procesamiento que la SCUN                               |
| H801GICF      | Uplink            | 2×10GbE SFP+, funciones avanzadas de switching                             |
| H801X2CS      | XG(S)-PON         | 2 puertos XG(S)-PON, requiere chasis compatible y ONTs de 10Gbps           |
| H801BPUA      | Power             | Módulo de alimentación, redundante                                          |
| GPIO          | Entradas/salidas  | Supervisión externa, sensores, alarmas remotas                             |

> ✅ Para una tarjeta recién insertada, recuerda ejecutar `board confirm <frame/slot>` para activarla.

---

## 🧠 Notación estándar en interfaces

Huawei utiliza el siguiente esquema para identificar interfaces físicas:

```
<frame>/<slot>/<port>
Ejemplo: 0/1/2 → Frame 0, Slot 1, Puerto 2
```

Esto aplica a puertos GPON, uplinks Ethernet, y puertos de tarjetas de servicio.

---

## 📈 Límites técnicos típicos

| Parámetro                          | Valor típico (GPON) |
|-----------------------------------|---------------------|
| ONTs por puerto GPON              | Hasta 128 (con split 1:128) |
| ONTs recomendadas por puerto      | 64 (mejor rendimiento) |
| VLANs máximas                    | 4094                |
| GEM Ports por ONT                 | Hasta 8             |
| T-CONTs por ONT                   | Hasta 4             |
| Longitud máxima FO usuario final  | 20 km (recomendado <15 km) |
| Atenuación total permitida        | 28 dB (splitters + FO + conectores) |

---

## 🛠️ Comandos útiles de referencia rápida

| Objetivo                                | Comando básico                                  |
|----------------------------------------|-------------------------------------------------|
| Ver tarjetas instaladas                | `display board 0`                               |
| Confirmar tarjeta insertada            | `board confirm 0/1`                             |
| Mostrar ONTs detectadas                | `display ont autofind all`                     |
| Ver ONTs registradas en un puerto      | `display ont info 0 1`                          |
| Ver potencia óptica de una ONT         | `display ont optical-info 0 1 0`                |
| Ver estadísticas del puerto GPON       | `display statistics gpon-port 0/1`              |
| Ver perfiles DBA                       | `display dba-profile all`                       |
| Ver perfiles de línea y servicio       | `display ont-lineprofile gpon all` <br> `display ont-srvprofile gpon all` |

---

## 📚 Documentos y enlaces recomendados

- 📘 [Huawei OLT MA5600T Series Configuration Guide (GPON)](https://support.huawei.com/)
- 📘 [Huawei GPON Planning and Deployment Guide](https://support.huawei.com/)
- 📘 [GPON Standard Overview (ITU-T G.984.x)](https://www.itu.int/rec/T-REC-G.984/en)

---

## 📝 Consideraciones finales

- Se recomienda mantener una **plantilla base de configuración** para nuevos clientes (profiles + service-ports).
- Antes de eliminar una ONT, realiza un `undo service-port` de todos sus servicios para liberar GEM ports.
- Las ONTs deben siempre presentar niveles ópticos entre -8 dBm y -27 dBm para un funcionamiento estable.

---


*Este apéndice se actualiza conforme a nuevas tarjetas, ONTs o funcionalidades introducidas en la familia MA56XXT.*

