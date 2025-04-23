## 5. Bloque IV – Desaprovisionamiento y eliminación de ONTs

Cuando un cliente se da de baja o se reemplaza una ONT, es importante limpiar su configuración en la OLT para evitar conflictos y liberar recursos.

---

### 5.1 Eliminar los Service-Ports asociados

```bash
undo service-port 100
undo service-port 200
undo service-port 500
```

(Usa los IDs correspondientes a cada servicio de la ONT.)

---

### 5.2 Eliminar la ONT de la OLT

```bash
interface gpon 0/1
ont delete 0 0
```

Esto borra la ONT con ID 0 del puerto 0/1/0.

---

### 5.3 Verificar que la ONT fue eliminada

```bash
display ont info 0 1 0
```

Debería no devolver datos si fue correctamente eliminada.

---

### 5.4 (Opcional) Desactivar temporalmente una ONT

En lugar de eliminarla, puedes simplemente desactivarla:

```bash
ont deactivate 0/1/0 0
```

Y volver a activarla cuando sea necesario:

```bash
ont activate 0/1/0 0
```

