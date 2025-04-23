# 07 Diseño optimizado de redes FTTH

El objetivo de un **diseño optimizado** es equilibrar coste, escalabilidad y facilidad de explotación. Para ello se trabaja sobre cuatro ejes:

1. **Nivel de splitteo**
2. **Topología de red**
3. **Penetración prevista** (clientes activos vs. potenciales)
4. **Arrastres** (fibras de reserva)

---

## 1. Flujo general del diseño

| Etapa | Resultado |
|-------|-----------|
| **1. Especificaciones** | Alcance geográfico, densidad, split ratio deseado, límites de acometida, etc. |
| **2. Conteo de UUII** | Censo de viviendas, locales y oficinas *in situ* o por GIS. |
| **3. Estimación de solución FTTH** | Verificar que el nivel de división y topología satisfacen la morfología urbana. |
| **4. Prediseño de alimentación** | Trazo preliminar de troncal y subtroncal (fachada / canalización). |
| **5. Trazado definitivo** | Ubicación de CTO, cajas de distribución (CD) y torpedos. |
| **6. Conectividad** | Matriz de empalmes y etiquetado; cálculo de arrastres. |

> *Consejo:* Diseñar “de atrás hacia adelante”; empezar por la ubicación de CTO y CDs en cada manzana y retroceder hasta la OLT.

---

## 2. Elección del nivel de splitteo

| Arquitectura | 1.º nivel (CD) | 2.º nivel (CTO) | Total | Uso recomendado |
|--------------|---------------|-----------------|-------|-----------------|
| **4:16**     | 1:4 | 1:16 | **1:64** | **Alta verticalidad** (bloques de pisos) |
| **8:8**      | 1:8 | 1:8  | **1:64** | **Baja densidad** (chalets, unifamiliares) |

- **4:16**: más fibras vivas en distribución, menos arrastre en troncal.  
- **8:8**: más ahorro de fibra troncal, mayor longitud de distribución.

---

## 3. Topología conceptual

| Subred | Desde – Hasta | Cable típico | Observaciones |
|--------|---------------|-------------|---------------|
| **Troncal** | OLT → Torpedos | 144–288 F loose tube | Sin splitters; alta capacidad |
| **Subtroncal** | Torpedo → CD | 24–48 F | Contiene splitters 1.º nivel |
| **Distribución** | CD → CTO | 12–24 F | Malla en fachada / poste |
| **Dispersión (acometidas)** | CTO → Roseta hogar | Drop 1–2 F | Instalación en alta de cliente |

> Límites recomendados: **250 m** (Torpedo-CD), **100 m** (CD-CTO), **≤ 70 m** acometida.

---

## 4. Estudio de penetración

La **penetración** define cuántas fibras o puertos se cablean en la primera fase:

| Penetración CTO | Ejemplo | Significado |
|-----------------|---------|-------------|
| **50 %** | CTO 16 puertos cubre 32 UUII | Se equipa 1 puerto cada 2 viviendas |
| **65 %** | CTO 16 puertos cubre 24 UUII | Apropiado en zonas con menor competencia |
| **100 %** | CTO 16 puertos cubre 16 UUII | Instalación completa desde el minuto cero |

> Ajustar la penetración inicial permite **reducir CAPEX** y escalar cuando la demanda crece.

---

## 5. Arrastres (fibras de reserva)

- **Arrastre de distribución**: fibras “muertas” que llegan a la CTO para soportar un **2.º splitter** o una **segunda CTO** en el futuro.  
  - Cálculo: `UUII_totales / división_2º_nivel`
- **Arrastre troncal / subtroncal**: fibras de reserva en la CD para escalado de splitters 1.º nivel.  
  - Cálculo: `(fibras vivas + muertas de la CTO) / división_1º_nivel`

> Regla práctica: **un arrastre = una fibra extra** fusionada siguiendo la misma ruta que la fibra viva.

---

## 6. Buenas prácticas de optimización

1. **Ubicar CTO** con Google Maps allí donde ya exista caja eléctrica/teleco → menos quejas vecinales.  
2. **Evitar pasar acometidas aéreas** sobre avenidas anchas; buscar fachada opuesta o canalizar.  
3. **Minimizar CDs** sin saturarlas: punto óptimo entre distancia de cable y nº divisores.  
4. **Etiquetado único** (ISO 14763-2) en planos y cartas de empalme para agilizar reparaciones.  
5. **Verificar link budget** tras cada iteración (ver bloque 04) con software OTDR virtual.

---

Autor: **Juan Manuel Quijada Cárdenas**  
© 2016 — Todos los derechos reservados.
