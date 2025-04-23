## 1. Introducción técnica

Las OLT Huawei **MA5683T** (versión europea) y **MA5603T** (versión china) comparten arquitectura modular, CLI y operación. Están diseñadas para redes **GPON** y se gestionan usando el protocolo **OMCI** para la comunicación con las ONTs.

![472d67d6d20e5947859d2da31a818ff9.png](:/5c3775f2a91f44d6986485877028a3fd)

### Arquitectura física: Frames, Slots, Ports y Tipos de Tarjetas

#### Frames

Huawei utiliza el concepto de “Frame” para representar el bastidor físico donde está instalada la OLT. En la mayoría de los casos, cuando solo hay un chasis, el frame se numera como `0`.

#### Slots

Cada frame contiene varias ranuras (slots) donde se instalan tarjetas. Las posiciones de los slots varían según el modelo:

##### MA5683T / MA5603T (chasis 6U)

- Slots 0 a 5: Tarjetas de servicio (GPON, POTS, etc.)
- Slots 6 y 7: Tarjetas de control (SCUN, SCUH, SCUL)
- Slots 8 y 9: Tarjetas GIU (uplink)
- Slots 10 y 11: Fuente de alimentación (Power)
- Slot 12: GPIO

#### MA5680T (modelo vertical grande)

- Hasta 16 slots de servicio
- 2 de control
- 2 GIU
- 2 Power
- 1 GPIO

#### Ports

Cada tarjeta instalada puede contener varios **puertos físicos** (ports), numerados desde 0. El sistema completo se direcciona como:

```
<frame>/<slot>/<port>
Ej: 0/1/0 → Frame 0, Slot 1, Puerto 0
```

#### Tipos de Tarjetas Comunes

| Modelo Tarjeta | Descripción                                                                 |
|----------------|-----------------------------------------------------------------------------|
| H806GPBD       | Tarjeta GPON con 8 puertos, muy usada en despliegues residenciales         |
| H805GPFD       | Tarjeta GPON con 16 puertos, para alta densidad                            |
| H802SCUN       | Tarjeta de control estándar                                                 |
| H803SCUH       | Controladora con mayores capacidades de procesamiento                      |
| H801GICF       | Tarjeta de caudal (uplink) con 2×10GbE y funciones avanzadas de switching   |
| H801X2CS       | Tarjeta con 2 puertos XG(S)-PON (GPON de 10Gbps, si soportado por la OLT)  |
| POWER          | Tarjeta de alimentación redundante                                          |
| GPIO           | Tarjeta para entradas/salidas digitales                                     |

> **Importante**: Cada tarjeta debe ser confirmada tras su inserción con `board confirm <frame/slot>` para ser operativa.

#### Ejemplo de numeración de interfaces

Una ONT conectada al puerto 2 de una tarjeta GPON ubicada en el slot 1 se identificará como:

```
gpon 0/1/2
```



### Conceptos clave

| Componente   | Descripción                                                                                                                                 |
|--------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| **T-CONT**   | Contenedor lógico de tráfico en upstream. Asocia una política DBA y define cómo la OLT asigna slots de tiempo a la ONT.                   |
| **GEM Port** | Canal lógico de encapsulación de datos sobre GPON. Se vincula a un T-CONT. Cada GEM porta una VLAN o tipo de servicio.                    |
| **OMCI**     | Protocolo de gestión entre OLT y ONT. Define puertos, servicios, VLANs, firmware y estadísticas de forma remota y automática.             |
| **ONT-SRVPROFILE** | Define los puertos físicos (ETH, POTS, CATV) de la ONT.                                                             |
| **ONT-LINEPROFILE**| Define T-CONTs, GEM ports y el mapping de VLAN. Relaciona servicios de red con puertos OMCI internos.              |
| **DBA Profile** | Asigna tipo de tráfico (fijo, asegurado, best-effort) al T-CONT, regulando el uso del upstream.                      |
