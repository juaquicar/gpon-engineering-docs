## 3. Bloque II – Gestión de puertos PON y descubrimiento de ONT

### 3.1 Habilitar Auto-Find en los puertos PON

Para que la OLT detecte automáticamente ONTs nuevas (modo “autofind”), hay que activar la función en cada puerto PON donde esperemos conexiones:

```bash
interface gpon 0/1
port 0 ont-auto-find enable
port 0 fec enable
```

Repetir para cada puerto GPON necesario.

### 3.2 Verificar ONTs no registradas

```bash
display ont autofind all
```

Muestra ONTs detectadas sin registrar. También puedes filtrar por puerto:

```bash
display ont autofind 0/1/0
```

### 3.3 Registrar ONTs por número de serie (SN)

Si has detectado una ONT mediante auto-find:

```bash
interface gpon 0/1
ont confirm 0 sn-auth 48575443350E9FC36 omci ont-lineprofile-id 1 ont-srvprofile-id 1 desc "Cliente01"
```

Para preregistrar una ONT sin que esté conectada:

```bash
interface gpon 0/1
ont add 0 sn-auth 48575443350E9FC36 omci ont-lineprofile-id 1 ont-srvprofile-id 1 desc "Preconfigurada"
```

### 3.4 Confirmar estado de ONT registrada

```bash
display ont info 0 1 0
```

Estado online y *match* indica que la ONT está configurada y operativa.

### 3.5 Ver niveles ópticos de la ONT

```bash
display ont optical-info 0 1 0
```

Permite verificar que la potencia recibida y enviada está dentro de los márgenes correctos.
