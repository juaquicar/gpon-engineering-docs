# 08 Proceso de diseño optimizado

Este bloque describe la **metodología paso a paso** para convertir los criterios de diseño (bloque 07) en un proyecto FTTH listo para construir.

---

## 1. Ajustar el nivel de splitteo

| Densidad urbana | 1.º nivel (CD) | 2.º nivel (CTO) | Ratio total | Comentario |
|-----------------|---------------|-----------------|-------------|------------|
| **Alta verticalidad** (pisos) | 1:4 | 1:16 | **1:64** | Más fibras vivas, menos arrastre troncal |
| **Baja verticalidad** (unifamiliares) | 1:8 | 1:8  | **1:64** | Menos fibra troncal, más distribución |

---

## 2. Desglose de subredes y límites

| Subred | De → Hasta | Función | Longitud recomendada |
|--------|------------|---------|----------------------|
| **Troncal** | OLT → Torpedos | Alta capacidad, sin splitters | — |
| **Subtroncal** | Torpedo → CD | Splitters 1.º nivel | **≤ 250 m** |
| **Distribución** | CD → CTO | Splitters 2.º nivel | **≤ 100 m** |
| **Dispersión (acometida)** | CTO → Roseta | Cable drop | **70–90 m** |

### Zonas operativas

- **Zona Nodo** – Clientes servidos desde un torpedo.  
- **Zona PON** – Clientes dependientes de un mismo puerto PON en la OLT.  
- **Zona AI** – Clientes atendidos por el/los splitters de una CTO/CA.

---

## 3. Penetración inicial

| Elemento | 50 % | 65 % | 100 % |
|----------|------|------|-------|
| **CTO 16 p** | 32 UUII | 24 UUII | 16 UUII |
| **Divisor 1:8** | 16 UUII | 12 UUII | 8 UUII |

> Valor medio típico de penetración los dos primeros años: **≈ 30 %** si existe competencia.

---

## 4. Arrastres (reservas de fibra)

| Cálculo | Fórmula |
|---------|---------|
| **Arrastre distribución** | UUII_totales atendidas ÷ split_2º_nivel |
| **Arrastre troncal/subtroncal** | (fibras vivas + muertas de CTO) ÷ split_1º_nivel |

- El **torpedo** no tiene arrastre (solo continuidad).  
- Cada arrastre se fusiona igual que la fibra viva para mantener la ruta.

---

## 5. Objetivo de coste

> **Buscar el punto medio entre lo ideal (simple) y lo barato**.  
> Ajustar el número de cajas y la densidad de fibras hasta que CAPEX y OPEX se equilibren.

---

## 6. Flujo detallado de trabajo

1. **Especificaciones iniciales**  
   - Ubicación cabecera, tipo de troncal (anillo/árbol), límites de acometida, split ratio, etc.
2. **Conteo preciso de UUII** (manzana/finca).  
3. **Estimación de la solución**  
   - Verificar que el nivel de división encaja con la topología urbana.  
   - Confirmar que árbol/anillo seleccionados son viables.
4. **Prediseño de alimentación**  
   - Si hay planos de cobre/electricidad, seguir fachada.  
   - Si se canaliza, usar planos de ductos existentes.  
   - Sin documentación: bosquejar sobre calles principales comprobando presencia de cables.
5. **Trazado y ubicación de elementos**  
   - **CTO**: manzana por manzana; alinear para evitar rodeos; usar Google Maps como guía.  
   - **CD**: situarlas cerca de la troncal y evitar saturarlas de divisores.  
   - **Distribución**: unir CTO en grupos (8/4) minimizando cable; respetar pasos aéreos.  
   - **Subtroncal**: agrupar CDs en nodos, recorrido mínimo.  
   - **Troncal**: agrupar nodos; minimizar torpedos y dimensionar cable según arrastres.
6. **Conectividad final**  
   - Fase 1: Troncal + Subtroncal (central → CDs).  
   - Fase 2: Distribución (CDs → CTOs/CA).  
   - Mantener rotura mínima de tubos y documentar cartas de empalme.

---

## 7. Lista de comprobación antes de aprobar el diseño

- [ ] Presupuesto de potencia validado (bloque 04).  
- [ ] Split ratio y arrastres cubren el 100 % de la demanda futura.  
- [ ] Todas las distancias cumplen límites teóricos.  
- [ ] Planos y etiquetado coherentes (GIS/OSS).  
- [ ] Hoja de materiales (BOM) optimizada.

---

Autor: **Juan Manuel Quijada Cárdenas**  
© 2016 — Todos los derechos reservados.
