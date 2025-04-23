## 2. Bloque I – Configuración inicial y puesta en marcha

### 2.1 Conectividad y acceso de gestión

```bash
interface meth 0
ip address 192.168.88.25 255.255.255.0
ip route-static 0.0.0.0 0.0.0.0 192.168.10.1
```

### 2.2 Verificación y activación de tarjetas

```bash
display board 0
board confirm 0/1
```

### 2.3 Creación de VLANs de servicio

Normalmente crearemos 3 VLANs, 1 para INTERNET o DATOS, otra para VOIP y y otra para gestión (100, 200, 500)

```bash
vlan 100 smart
vlan desc 100 INTERNET
port vlan 100 0/8 0

interface vlanif 100
ip address 10.10.10.1 255.255.255.0
```

### 2.4 Creación de perfiles DBA

El DBA Profile (Dynamic Bandwidth Allocation Profile) es un conjunto de parámetros que define cómo se gestiona el ancho de banda en sentido ascendente (upstream) para un T-CONT en una red GPON.

El DBA Profile determina:
- **Cuánto ancho de banda mínimo está garantizado**.
- **Cuánto puede pedir de forma dinámica un usuario**, en función de la disponibilidad.
- **Con qué prioridad compite por ancho de banda**.

### 📦 Tipos de T-CONT según DBA:
Los perfiles se aplican a T-CONTs, y hay varios tipos, como:

| Tipo de T-CONT | Características principales                          |
|----------------|------------------------------------------------------|
| Tipo 1         | Ancho de banda **fijo y garantizado**.              |
| Tipo 2         | Garantizado, pero puede tener cierta flexibilidad.  |
| Tipo 3         | Mezcla de garantizado + best-effort.                |
| Tipo 4         | Solo **best-effort**, sin garantía.                 |
| Tipo 5         | Agregado de varios tipos anteriores.                |

##### 📈 Ejemplo práctico:
Un perfil DBA para VoIP puede ser de tipo 1 (fijo), para garantizar baja latencia. Uno para navegación web puede ser tipo 4 (best-effort), ya que no requiere garantía estricta.



```bash
dba-profile add profile-id 10 profile-name "20M" type3 assure 10240 max 20480
```

### 2.5 Perfiles OMCI

#### Línea (ONT-LINEPROFILE)

El ONT-LINEPROFILE en una OLT Huawei es un perfil OMCI (ONU Management and Control Interface) que define la estructura lógica de transporte de una ONT (Optical Network Terminal) dentro de una red GPON. Es decir, describe cómo se gestionará el tráfico de subida y bajada de la ONT, mediante la creación y asignación de recursos como T-CONTs, GEM Ports y mappings de VLAN.

| Componente     | Descripción                                                                                                                                         |
|----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| T-CONT         | (Transmission Container) Es una entidad lógica en el canal upstream. Se vincula a un perfil de DBA (Dynamic Bandwidth Allocation) que define su comportamiento (fijo, asegurado, best-effort...). |
| GEM Port       | (GPON Encapsulation Method Port) Canal lógico que transporta datos (Ethernet, VoIP, IPTV) encapsulados. Cada GEM puede estar ligado a un T-CONT.   |
| VLAN Mapping   | Asocia GEM ports a VLANs específicas del tráfico de usuario. Por ejemplo: GEM1 ↔ VLAN 100 (Internet), GEM2 ↔ VLAN 200 (VoIP), etc.                  |
| FEC / TR-069   | Opcionalmente, se puede habilitar FEC en upstream y TR-069 para gestión remota.                                                                     |


El ONT-LINEPROFILE actúa como el "cerebro" que instruye a la ONT cómo tratar el tráfico. Cuando se registra una ONT en la OLT, esta le envía vía OMCI el LINEPROFILE asociado. Así, aunque cada ONT puede tener distinto hardware, mientras compartan la misma lógica de transporte pueden reutilizar el mismo perfil de línea.


```bash
ont-lineprofile gpon profile-id 1 profile-name "LINE-20M"
tcont 1 dba-profile-id 10
gem add 1 eth tcont 1
gem mapping 1 0 vlan 100
commit
```

Ejemplo:

```
ont-lineprofile gpon profile-id 100 profile-name "LineProfile-Basico"
fec-upstream enable
tr069-management enable
tr069-management ip-index 0
tcont 1 dba-profile-id 10
gem add 1 eth tcont 1 encrypt on
gem mapping 1 0 vlan 100
commit
```

Este perfil:

- Crea un T-CONT vinculado al DBA ID 10.
- Crea un GEM port para datos Ethernet asignado al T-CONT.
- Mapea la VLAN 100 a ese GEM port.
- Habilita FEC y TR-069 para gestión.


#### Servicio (ONT-SRVPROFILE)

El **ONT-SRVProfile** (ONT Service Profile) es una **plantilla de configuración** usada en las **OLTs (Optical Line Terminals)** para definir cómo se comportarán los servicios que se le asignan a una **ONT (Optical Network Terminal)** en una red **GPON**.

##### 🔍 ¿Qué define el ONT-SRVProfile?

Incluye parámetros y configuraciones como:

| Componente           | Función principal                                                                 |
|----------------------|-----------------------------------------------------------------------------------|
| **T-CONTs**          | Asocia el número y tipo de T-CONTs que se usarán (con su perfil DBA correspondiente). |
| **GEM Ports**        | Define cuántos canales lógicos se usarán y cómo se enlazan con los T-CONTs.       |
| **VLAN Mapping**     | Reglas de mapeo entre GEM Ports y VLANs de usuario.                               |
| **Traffic Management** | Prioridades, colas y políticas de tráfico (QoS).                                |
| **Multicast Settings** | Si la ONT puede recibir multicast, y cómo se gestionará.                        |

### 🏗️ ¿Para qué sirve?

- Es **reutilizable**: puedes aplicar el mismo SRVProfile a muchas ONTs con el mismo servicio.
- Permite **automatizar** y **estandarizar** la configuración del servicio de usuario (Internet, VoIP, IPTV).
- Es parte clave de la **provisioning automática**.

### ⚙️ ¿Dónde entra en el proceso?

Cuando registras una ONT en una OLT, asocias:
- Un **ONT Profile** (define el hardware, número de puertos, etc.)
- Un **ONT-SRVProfile** (define cómo deben comportarse los servicios sobre esa ONT)

Juntos forman una plantilla completa de aprovisionamiento.


```bash
ont-srvprofile gpon profile-id 1 profile-name "SRV-ETH"
ont-port eth adaptive
port vlan eth 1 100
commit
```
