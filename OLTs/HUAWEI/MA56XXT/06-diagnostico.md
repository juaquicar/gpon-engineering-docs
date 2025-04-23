## 6. Bloque V – Diagnóstico, mantenimiento y comandos útiles

### 6.1 Monitoreo del estado de las ONTs

- **Estado general de una ONT:**

```bash
display ont info 0 1 0
```

- **Potencia óptica (Rx/Tx):**

```bash
display ont optical-info 0 1 0
```

- **Tráfico en puerto Ethernet de ONT:**

```bash
display statistics ont-eth 0 1 0 ont-port 1
```

---

### 6.2 Estado de puertos PON y Uplink

- **Estado de puertos GPON:**

```bash
display port state all
```

- **Estadísticas de puerto uplink:**

```bash
display interface gigaEthernet 0/8/0
```

---

### 6.3 Guardado, backup y restauración

- **Guardar la configuración actual:**

```bash
save
```

- **Backup a servidor TFTP:**

```bash
backup configuration tftp 192.168.1.50 OLT-configuration.txt
backup data         tftp 192.168.1.50 OLT-Data.dat
```

---

### 6.4 Reinicio y restauración de fábrica

- **Reinicio de la OLT:**

```bash
reboot system
```

- **Factory reset:**

```bash
erase flash data active
erase flash data standby
```

---

### 6.5 Comandos de mantenimiento

- **Hora del sistema:**

```bash
display time
```

- **Logs y alarmas:**

```bash
display alarm active
display logbuffer
```

- **CPU y RAM:**

```bash
display cpu
display memory
```

---

### 6.6 Ver perfiles existentes

- **Perfiles de línea:**

```bash
display ont-lineprofile gpon all
```

- **Perfiles de servicio:**

```bash
display ont-srvprofile gpon all
```

- **Perfiles DBA:**

```bash
display dba-profile all
```

