<h1 align="center">Insurance Claim Analytics Platform</h1> <h2 align="center">Operational Efficiency & Risk Detection Platform</h2><p align="center">

<p align="center">
  <img src="https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white" alt="R">
  <img src="https://img.shields.io/badge/Html-3776AB?style=for-the-badge&logo=html&logoColor=white" alt="Html">
  <img src="https://img.shields.io/badge/RStudio-75AADB?style=for-the-badge&logo=RStudio&logoColor=white" alt="RStudio">
  <img src="https://img.shields.io/badge/Status-Completed-success?style=for-the-badge" alt="Status">
</p>

<hr>

<h2>Índice</h2>

<ol>
  <li><a href="#intro">Introducción y Alcance</a></li>
  <li><a href="#impacto">Impacto Estratégico</a></li>
  <li><a href="#objetivos">Objetivos del Proyecto</a></li>
  <li><a href="#estructura">Estructura del Repositorio</a></li>
  <li><a href="#tecnologia">Stack Tecnológico</a></li>
  <li><a href="#hallazgos">Hallazgos Clave</a>
    <ul>
      <li><a href="#hallazgos-tiempo">Tiempo de Resolución</a></li>
      <li><a href="#hallazgos-fraude">Detección de Fraude</a></li>
      <li><a href="#hallazgos-demografico">Patrones Demográficos</a></li>
    </ul>
  </li>
  <li><a href="#guia">Guía de Implementación</a></li>
  <li><a href="#visualizaciones">Visualizaciones Destacadas</a></li>
  <li><a href="#diccionario">Diccionario de Datos</a></li>
  <li><a href="#metodologia">Metodología Analítica</a></li>
  <li><a href="#recomendaciones">Recomendaciones Estratégicas</a></li>
  <li><a href="#contribucion">Guía de Contribución</a></li>
  <li><a href="#licencia">Licencia</a></li>
</ol>

<hr>

<h2 id="intro">1. Introducción y Alcance</h2>

<p>Este proyecto implementa un marco analítico integral para datos de reclamos de seguros, enfocado en dos dimensiones críticas: <strong>tiempo de resolución</strong> y <strong>detección de anomalías y fraudes</strong>. Utilizando datos sintéticos generados con R y analizados en R Studio, la solución proporciona información procesable para la optimización de operaciones y la gestión de riesgos.</p>

<h3>1.1 Entregables Clave</h3>

<ul>
  <li>Pipeline completo de análisis en R (Main code.R)</li>
  <li>Script de generación de datos sintéticos (Cargar los paquetes.txt)</li>
  <li>Visualizaciones interactivas y estáticas</li>
  <li>Dashboard ejecutivo</li>
  <li>Framework de puntuación de riesgo de fraude</li>
  <li>Documentación integral de datos</li>
</ul>

<hr>

<h2 id="impacto">2. Impacto Estratégico</h2>

<table border="1" cellpadding="5" cellspacing="0">
  <tr bgcolor="#f2f2f2">
    <th>Área</th>
    <th>Impacto</th>
  </tr>
  <tr>
    <td>Eficiencia Operacional</td>
    <td>Identificación de cuellos de botella de hasta 60 días en reclamos de Salud</td>
  </tr>
  <tr>
    <td>Gestión de Riesgos</td>
    <td>Detección de patrones concentrados de fraude en segmentos específicos</td>
  </tr>
  <tr>
    <td>Estrategia de Datos</td>
    <td>Establecimiento de la severidad como predictor principal del tiempo de resolución</td>
  </tr>
  <tr>
    <td>Benchmarking</td>
    <td>Creación de líneas base comparativas por tipo de seguro</td>
  </tr>
  <tr>
    <td>Alerta Temprana</td>
    <td>Desarrollo de sistema de puntuación para detección proactiva de fraudes</td>
  </tr>
</table>

<hr>

<h2 id="objetivos">3. Objetivos del Proyecto</h2>

<ol>
  <li>Medir el tiempo promedio de resolución de reclamos</li>
  <li>Detectar anomalías e indicadores de fraude mediante patrones estadísticos</li>
  <li>Visualizar métricas críticas para la toma de decisiones</li>
  <li>Establecer benchmarks operativos por tipo de seguro</li>
  <li>Implementar sistema de puntuación de riesgo</li>
  <li>Habilitar capacidades de monitoreo continuo</li>
</ol>

<hr>

<h2 id="estructura">4. Estructura del Repositorio</h2>

<pre>
insurance-claims-analysis/
│
├── data/
│   ├── policies.csv              # Datos maestros de pólizas
│   ├── clients.csv               # Información de clientes
│   ├── claims.csv                # Datos de transacciones de reclamos
│   └── payments.csv              # Registros de pagos
│
├── scripts/
│   ├── Cargar los paquetes.txt   # Generación de datos sintéticos (R)
│   └── Main code.R               # Pipeline completo de análisis
│
├── outputs/
│   ├── visuals/                  # Visualizaciones generadas
│   │   ├── resolution_density_by_type.png
│   │   ├── resolution_boxplot_by_type.png
│   │   ├── resolution_by_severity_type.png
│   │   ├── monthly_resolution_trend.png
│   │   ├── top_20_suspicious_claims_heatmap.png
│   │   ├── fraud_score_by_severity.png
│   │   ├── client_resolution_efficiency.png
│   │   ├── claim_frequency_heatmap.png
│   │   └── claim_amount_heatmap.png
│   └── tables/
│       └── fraud_risk_executive_summary.html
│
├── README.md
└── .gitignore
</pre>

<hr>

<h2 id="tecnologia">5. Stack Tecnológico</h2>

<table border="1" cellpadding="5" cellspacing="0">
  <tr bgcolor="#f2f2f2">
    <th>Componente</th>
    <th>Tecnología</th>
    <th>Propósito</th>
  </tr>
  <tr>
    <td>Generación de Datos</td>
    <td>R</td>
    <td>Creación de datasets sintéticos</td>
  </tr>
  <tr>
    <td>Análisis de Datos</td>
    <td>R</td>
    <td>Análisis estadístico y modelado</td>
  </tr>
  <tr>
    <td>Visualización</td>
    <td>ggplot2, plotly</td>
    <td>Visualizaciones interactivas y estáticas</td>
  </tr>
  <tr>
    <td>Reportes</td>
    <td>gt, htmltools</td>
    <td>Generación automatizada de reportes</td>
  </tr>
  <tr>
    <td>Control de Versiones</td>
    <td>Git, GitHub</td>
    <td>Repositorio de código y colaboración</td>
  </tr>
</table>

<h3>Paquetes R Requeridos</h3>

<pre>
install.packages(c(
  "dplyr", "lubridate", "tidyverse", "ggplot2", "plotly",
  "knitr", "scales", "gt", "stringr", "htmltools"
))
</pre>

<hr>

<h2 id="hallazgos">6. Hallazgos Clave</h2>

<h3 id="hallazgos-tiempo">6.1 Tiempo de Resolución</h3>

<table border="1" cellpadding="5" cellspacing="0">
  <tr bgcolor="#f2f2f2">
    <th>Categoría</th>
    <th>Hallazgo</th>
    <th>Implicancia Estratégica</th>
  </tr>
  <tr>
    <td>General</td>
    <td>Media: 38.3 días, Mediana: 35 días, DE: 19.5 días</td>
    <td>Alta variabilidad indica procesos inconsistentes</td>
  </tr>
  <tr>
    <td>Reclamos de Salud</td>
    <td>Mediana más alta (60 días) para severidad media</td>
    <td>Cuello de botella crítico que requiere auditoría de procesos</td>
  </tr>
  <tr>
    <td>Reclamos de Vida</td>
    <td>Resolución más rápida (25 días) para severidad media</td>
    <td>Benchmark de mejores prácticas para otros segmentos</td>
  </tr>
  <tr>
    <td>Impacto de Severidad</td>
    <td>Relación monotónica clara: severidad ↑ → tiempo ↑</td>
    <td>La severidad es un predictor de alta importancia</td>
  </tr>
</table>

<h3 id="hallazgos-fraude">6.2 Detección de Fraude</h3>

<table border="1" cellpadding="5" cellspacing="0">
  <tr bgcolor="#f2f2f2">
    <th>Indicador</th>
    <th>Patrones Detectados</th>
    <th>Prioridad</th>
  </tr>
  <tr>
    <td>Concentración de Clientes</td>
    <td>Cliente #12: 6 reclamos, 40% de banderas de alto riesgo</td>
    <td>Crítica</td>
  </tr>
  <tr>
    <td>Resolución Rápida</td>
    <td>Cierre de reclamo en 1 día detectado</td>
    <td>Alta</td>
  </tr>
  <tr>
    <td>Correlación con Severidad</td>
    <td>70% de reclamos de alto riesgo son de severidad alta</td>
    <td>Media</td>
  </tr>
  <tr>
    <td>Riesgo de Cartera</td>
    <td>93% de reclamos en línea base saludable; 1 caso crítico</td>
    <td>Baja</td>
  </tr>
</table>

<h3 id="hallazgos-demografico">6.3 Patrones Demográficos de Riesgo</h3>

<ul>
  <li><strong>Segmento Vida-Joven</strong>: Exposición de $297K (200% por encima de lo esperado) - Prioridad máxima de investigación</li>
  <li><strong>Segmento Salud-Senior</strong>: Exposición de $211K (250% por encima de lo esperado) - Desviación significativa</li>
  <li><strong>Anomalía de Edad</strong>: Sin reclamos de salud menores de 41 años a pesar de altas frecuencias en grupos mayores</li>
  <li><strong>Concentración de Auto</strong>: Grupo de edad 51-60 muestra reclamos concentrados</li>
  <li><strong>Patrón de Vida</strong>: Solo aparece en el rango de edad 61-80</li>
</ul>

<hr>

<h2 id="guia">7. Guía de Implementación</h2>

<h3>7.1 Configuración Inicial</h3>

<ol>
  <li>Clonar el repositorio:</li>
</ol>

<pre>
git clone https://github.com/tuusuario/insurance-claims-analysis.git
cd insurance-claims-analysis
</pre>

<ol start="2">
  <li>Configurar directorio de trabajo en scripts R:</li>
</ol>

<pre>
# Modificar base_path en Main code.R a tu ruta local
base_path <- "C:/Tu/Ruta/Hacia/Insurance"
</pre>

<h3>7.2 Generación de Datos Sintéticos</h3>

<pre>
source("scripts/Cargar los paquetes.txt")
</pre>

<p>Este script crea cuatro archivos CSV: <code>policies.csv</code>, <code>clients.csv</code>, <code>claims.csv</code>, y <code>payments.csv</code>.</p>

<h3>7.3 Ejecución del Pipeline de Análisis</h3>

<pre>
source("scripts/Main code.R")
</pre>

<p>El script ejecuta automáticamente estas secciones:</p>
<ul>
  <li>Configuración e inicialización</li>
  <li>Preprocesamiento de datos</li>
  <li>Fusión de datos (crea <code>claims_full</code>)</li>
  <li>Análisis descriptivo</li>
  <li>Análisis de tiempo de resolución</li>
  <li>Generación de visualizaciones</li>
  <li>Detección de anomalías</li>
  <li>Puntuación de fraude</li>
  <li>Resumen ejecutivo</li>
</ul>

<hr>

<h2 id="visualizaciones">8. Visualizaciones Destacadas</h2>

<h3>8.1 Distribución del Tiempo de Resolución</h3>

<p>Análisis multi-panel por tipo de seguro y severidad que muestra:</p>
<ul>
  <li>Reclamos de Salud: Distribución más amplia y cola más larga</li>
  <li>Reclamos de Auto: Ventana de resolución más estrecha y consistente</li>
  <li>La severidad como conductor claro del tiempo de resolución</li>
  <li>Concentración de valores atípicos en reclamos de alta severidad</li>
</ul>

<h3>8.2 Tendencia Mensual de Resolución</h3>

<ul>
  <li>Patrones de rendimiento cíclico identificados</li>
  <li>Picos que superan consistentemente el benchmark de 35 días</li>
  <li>Línea de tendencia suavizada que revela la salud del proceso</li>
  <li>Indicadores de alerta temprana para intervención proactiva</li>
</ul>

<h3>8.3 Análisis de Riesgo de Fraude</h3>

<ul>
  <li>Patrones de concentración de clientes visibles en el mapa de calor</li>
  <li>Distribución de puntajes por severidad (bajo: ~21, medio: ~24, alto: ~38)</li>
  <li>Objetivos de investigación prioritaria identificados</li>
  <li>Heterocedasticidad: la varianza aumenta con la severidad</li>
</ul>

<h3>8.4 Mapas de Calor de Riesgo Demográfico</h3>

<ul>
  <li>Puntos calientes de exposición por edad y tipo de seguro</li>
  <li>Desviaciones estadísticas de los patrones esperados</li>
  <li>Visualización de concentración de riesgo</li>
  <li>Objetivos de investigación prioritaria</li>
</ul>

<hr>

<h2 id="diccionario">9. Diccionario de Datos</h2>

<h3>9.1 Tabla de Pólizas</h3>

<table border="1" cellpadding="5" cellspacing="0">
  <tr bgcolor="#f2f2f2">
    <th>Campo</th>
    <th>Tipo</th>
    <th>Descripción</th>
  </tr>
  <tr><td>policy_id</td><td>int</td><td>Identificador único de póliza</td></tr>
  <tr><td>type_insurance</td><td>string</td><td>Auto, Vida, Salud, Hogar</td></tr>
  <tr><td>modality</td><td>string</td><td>Mensual, Anual, Trimestral</td></tr>
  <tr><td>id_client</td><td>int</td><td>Clave foránea a clientes</td></tr>
  <tr><td>issue_date</td><td>date</td><td>Fecha de emisión de póliza</td></tr>
  <tr><td>start_date</td><td>date</td><td>Fecha de inicio de póliza</td></tr>
  <tr><td>end_date</td><td>date</td><td>Fecha de fin de póliza</td></tr>
  <tr><td>policy_status</td><td>string</td><td>Activa, Cancelada, Expirada, Suspendida, Renovada</td></tr>
  <tr><td>premium_monthly</td><td>numeric</td><td>Monto de prima mensual</td></tr>
  <tr><td>premium_annual</td><td>numeric</td><td>Monto de prima anual</td></tr>
  <tr><td>insured_amount</td><td>numeric</td><td>Valor total asegurado</td></tr>
  <tr><td>deductible</td><td>numeric</td><td>Monto deducible</td></tr>
</table>

<h3>9.2 Tabla de Reclamos</h3>

<table border="1" cellpadding="5" cellspacing="0">
  <tr bgcolor="#f2f2f2">
    <th>Campo</th>
    <th>Tipo</th>
    <th>Descripción</th>
  </tr>
  <tr><td>id_claim</td><td>int</td><td>Identificador único de reclamo</td></tr>
  <tr><td>id_client</td><td>int</td><td>Clave foránea a clientes</td></tr>
  <tr><td>id_policy</td><td>int</td><td>Clave foránea a pólizas</td></tr>
  <tr><td>claim_date</td><td>date</td><td>Fecha de ocurrencia del reclamo</td></tr>
  <tr><td>notification_date</td><td>date</td><td>Fecha de reporte del reclamo</td></tr>
  <tr><td>closure_date</td><td>date</td><td>Fecha de cierre del reclamo</td></tr>
  <tr><td>claim_type</td><td>string</td><td>Accidente, Robo, Incendio, Responsabilidad, Otro</td></tr>
  <tr><td>severity</td><td>factor</td><td>Baja, Media, Alta</td></tr>
  <tr><td>claimed_amount</td><td>numeric</td><td>Monto reclamado</td></tr>
  <tr><td>approved_amount</td><td>numeric</td><td>Monto aprobado</td></tr>
  <tr><td>paid_amount</td><td>numeric</td><td>Monto pagado</td></tr>
  <tr><td>claim_status</td><td>string</td><td>Registrado, En Proceso, Cerrado, Rechazado, En Investigación</td></tr>
  <tr><td>resolution_days</td><td>numeric</td><td>Días desde reclamo hasta cierre</td></tr>
</table>

<h3>9.3 Tabla de Clientes</h3>

<table border="1" cellpadding="5" cellspacing="0">
  <tr bgcolor="#f2f2f2">
    <th>Campo</th>
    <th>Tipo</th>
    <th>Descripción</th>
  </tr>
  <tr><td>id_client</td><td>int</td><td>Identificador único de cliente</td></tr>
  <tr><td>gender</td><td>string</td><td>Masculino, Femenino, Otro</td></tr>
  <tr><td>age_group</td><td>string</td><td>20-30, 31-40, 41-50, 51-60, 61-70, 71-80</td></tr>
  <tr><td>income_level</td><td>string</td><td>Bajo, Medio, Alto</td></tr>
  <tr><td>occupations</td><td>string</td><td>Profesional, Técnico, Trabajador, Jubilado, Desempleado, Otro</td></tr>
</table>

<h3>9.4 Tabla de Pagos</h3>

<table border="1" cellpadding="5" cellspacing="0">
  <tr bgcolor="#f2f2f2">
    <th>Campo</th>
    <th>Tipo</th>
    <th>Descripción</th>
  </tr>
  <tr><td>id_payment</td><td>int</td><td>Identificador único de pago</td></tr>
  <tr><td>id_policy</td><td>int</td><td>Clave foránea a pólizas</td></tr>
  <tr><td>payment_date</td><td>date</td><td>Fecha de pago</td></tr>
  <tr><td>payment_amount</td><td>numeric</td><td>Monto de pago</td></tr>
  <tr><td>payment_method</td><td>string</td><td>Débito, Tarjeta, Transferencia Bancaria, Efectivo</td></tr>
  <tr><td>payment_status</td><td>string</td><td>Pagado, Pendiente, Vencido, Rechazado</td></tr>
  <tr><td>days_overdue</td><td>numeric</td><td>Días de vencimiento del pago</td></tr>
</table>

<hr>

<h2 id="metodologia">10. Metodología Analítica</h2>

<h3>10.1 Técnicas Estadísticas</h3>

<ul>
  <li><strong>Estadísticas Descriptivas</strong>: Media, mediana, desviación estándar para tiempos de resolución</li>
  <li><strong>Análisis de Distribución</strong>: Gráficos de densidad, boxplots por categoría</li>
  <li><strong>Series Temporales</strong>: Análisis de tendencia mensual con suavizado</li>
  <li><strong>Detección de Valores Atípicos</strong>: Umbrales estadísticos (IQR, percentiles)</li>
  <li><strong>Análisis de Heterocedasticidad</strong>: Evaluación de varianza entre segmentos</li>
</ul>

<h3>10.2 Marco de Detección de Fraude</h3>

<ol>
  <li><strong>Resolución Rápida</strong>: Reclamos cerrados en menos de 5 días (25 puntos)</li>
  <li><strong>Alta Frecuencia</strong>: Más de 5 reclamos por cliente en 30 días (25 puntos)</li>
  <li><strong>Montos Extremos</strong>: Mayor al percentil 95 del monto reclamado (20 puntos)</li>
  <li><strong>Disparidad de Monto</strong>: Reclamado más del 80% del valor asegurado (20 puntos)</li>
  <li><strong>Banderas de Severidad</strong>: Reclamos de alta severidad (10 puntos)</li>
</ol>

<h3>10.3 Sistema de Puntuación de Riesgo</h3>

<ul>
  <li><strong>Cada indicador</strong>: 5-25 puntos</li>
  <li><strong>Puntuación total de riesgo</strong>: 0-100</li>
  <li><strong>Niveles de prioridad</strong>:
    <ul>
      <li>Crítica: Mayor a 45</li>
      <li>Alta: 35-44</li>
      <li>Media: 25-34</li>
      <li>Baja: Menos de 25</li>
    </ul>
  </li>
</ul>

<hr>

<h2 id="recomendaciones">11. Recomendaciones Estratégicas</h2>

<h3>11.1 Acciones Inmediatas</h3>

<ol>
  <li><strong>Investigar al Cliente #12</strong>: Revisión a nivel de cuenta de 6 reclamos en 30 días</li>
  <li><strong>Auditar Procesos de Reclamos de Salud</strong>: Análisis de causa raíz para la mediana de 60 días</li>
  <li><strong>Implementar Sistema de Alerta Temprana</strong>: Monitorear cuando los tiempos de resolución se acercan al umbral de 35 días</li>
  <li><strong>Revisar Casos de Alta Severidad</strong>: Enfocarse en valores atípicos de Auto y Vida</li>
</ol>

<h3>11.2 Iniciativas Estratégicas</h3>

<ol>
  <li><strong>Flujo de Trabajo por Segmento</strong>: Diferenciar procesos según nivel de severidad</li>
  <li><strong>Modelado Predictivo</strong>: Desarrollar modelo utilizando severidad como característica clave</li>
  <li><strong>Marco de Monitoreo Recurrente</strong>: Revisión semanal de tiempos de resolución y puntajes de fraude</li>
  <li><strong>Puntuación de Riesgo a Nivel de Cliente</strong>: Agregar puntajes de fraude por cliente para evaluación integral</li>
  <li><strong>Integración de Análisis de Redes</strong>: Identificar patrones de fraude conectados entre reclamos</li>
</ol>

<hr>

<h2 id="contribucion">12. Guía de Contribución</h2>

<p>¡Las contribuciones son bienvenidas! Siga estos pasos:</p>

<ol>
  <li>Haga fork del repositorio</li>
  <li>Cree una rama de características (<code>git checkout -b feature/caracteristica-increible</code>)</li>
  <li>Realice sus cambios (<code>git commit -m 'Agregar característica increíble'</code>)</li>
  <li>Suba los cambios (<code>git push origin feature/caracteristica-increible</code>)</li>
  <li>Abra un Pull Request</li>
</ol>

<h3>Estándares de Codificación</h3>

<ul>
  <li>Seguir la guía de estilo de R (tidyverse)</li>
  <li>Documentar funciones usando roxygen2</li>
  <li>Incluir comentarios para lógica compleja</li>
  <li>Mantener convenciones de nomenclatura consistentes</li>
</ul>

<hr>

<h2 id="licencia">13. Licencia</h2>

<p>Este proyecto está bajo la Licencia MIT - consulte el archivo LICENSE para más detalles.</p>

<hr>

<h2>Recursos Adicionales</h2>

<ul>
  <li><a href="https://app.notion.com/p/Insurance-Claims-Analysis-Time-to-Resolution-Anomaly-Detection-3344e631f1158011a4c0ce07c2df4244">Documentación Completa del Análisis</a></li>
  <li><a href="https://r4ds.had.co.nz/">R for Data Science</a></li>
  <li><a href="https://ggplot2.tidyverse.org/">Documentación de ggplot2</a></li>
  <li><a href="https://www.kaggle.com/learn/intro-to-machine-learning">Técnicas de Detección de Anomalías</a></li>
</ul>

<hr>

<h2>Contacto</h2>

<p>Para preguntas, sugerencias o consultas de colaboración, abra un issue o contacte al mantenedor del proyecto.</p>

<hr>

<p><strong>Última Actualización</strong>: Agosto 2026<br>
<strong>Estado del Proyecto</strong>: Completado - Listo para Revisión</p>

<hr>

  <sub>⭐ Star this repository if you find it useful!</sub>
</div>
