## 4. Bloque III – Aprovisionamiento de ONT y asignación de servicios

### 4.1 Asignar VLAN nativa en la ONT (si no está en el SRVPROFILE)

```bash
ont port native-vlan 0/1/0 0 eth 1 vlan 100 priority 0
```

Esto indica que el puerto ETH1 de la ONT 0 del puerto 0/1/0 usará VLAN 100 como nativa.

---

### 4.2 Crear Service-Ports (asocian VLAN ↔ GEM ↔ ONT)

```bash
service-port 100 vlan 100 gpon 0/1/0 ont 0 gemport 1 multi-service user-vlan 100 tag-transform translate
```

Este comando establece que la VLAN 100 se entregue desde la red hacia la ONT 0 del puerto 0/1/0 a través del GEM port 1.

---

### 4.3 Añadir más servicios (VoIP, IPTV, Gestión)

Ejemplo VoIP en VLAN 200:

```bash
service-port 200 vlan 200 gpon 0/1/0 ont 0 gemport 2 multi-service user-vlan 200 tag-transform translate
```

Ejemplo Gestión en VLAN 500:

```bash
service-port 500 vlan 500 gpon 0/1/0 ont 0 gemport 3 multi-service user-vlan 500 tag-transform translate
```

---

### 4.4 Verificar servicios aplicados

```bash
display service-port port 0/1/0 ont 0
```

---

Con esto, la ONT debería tener conectividad completa para los servicios definidos: Internet, VoIP, gestión, IPTV, etc.
