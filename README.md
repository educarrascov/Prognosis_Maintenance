<p style='text-align: justify;'> Your Text </p>

# Data Science: Herramientas de Machine Learning para implementar mantenimiento preventivo en una planta de propulsión naval.

**Eduardo Carrasco Vidal**, Oficial de Marina, Ingeniero Civil Industrial.

Enlace a la publicación del documento en [Revista de Marina](https://revistamarina.cl/es/articulo/data-science-herramientas-de-machine-learning-para-implementar-mantenimiento-predictivo-en-una-planta-propulsora) Año CXXXV, Volumen 137, Número 974.   

Enlace al PDF de la [Publicación.](https://github.com/educarrascov/Prognosis_Maintenance/blob/main/PDF/2.%20Data%20Science%2C%20Mantenimiento%20predictivo.pdf)
____
_**Resumen:**
El Data Science (Ciencia de datos), forma parte fundamental hoy en día en el análisis, control estadístico y en la aplicación de la industria 4.0. Es así como, la investigación realizada consistió en implementar un analizador de bases de datos en tiempo real que permitiera utilizar los datos capturados por diversos sensores en un sistema de propulsión. A partir de lo anterior y aplicando algoritmos de Machine Learning como una herramienta de esta ciencia, se contribuyó a la implementación del mantenimiento predictivo que permite por un lado, determinar cuando es necesario realizar las tareas de mantenimiento y por otro, reducir costos al detectar potenciales fallas de manera temprana, preveniendo su ocurrencia._

**Palabras Claves:
Data Science, Machine Learning, Turbina a Gas, Mantenimiento Predictivo.**
__
## Mantenimiento:
De acuerdo con la British Standard 3811:1974 , el mantenimiento involucra a todas las acciones necesarias para mantener o recuperar un sistema, equipo o componente a un estándar aceptable en el cual pueda cumplir las funciones para el cual fue concebido.
A lo largo del tiempo, desde la revolución industrial en el siglo XIX, la forma más simple de mantenimiento fue reparar o reemplazar el equipo cuando se tenía un problema, actividad que en su mayoría era realizada por los propios operarios. Pero, la industrialización y el avance tecnológico crearon máquinas más complejas debiendo contar con personal especializado para su reparación, creando los primeros departamentos de mantenimiento centrados principalmente en solucionar fallas que se presentaran con acciones básicamente correctivas, definiéndose con ello el Mantenimiento Correctivo.
A partir del término de la Segunda Guerra Mundial, la complejidad y el avance tecnológico derivado del conflicto, llevaron al desarrollo de conceptos como la confiabilidad, referido al desempeño de un equipo, sistema o arma; bajo cualquier tipo de escenario, lo cual demandaba un mayor control en el cuidado de los activos.
En línea con lo anterior, fueron la aviación y la industria naval, los primeros desarrolladores de planes de mantenimiento que permitieran asegurar esa confiabilidad tan necesaria en un posible conflicto (Contexto de Guerra Fría), haciendo énfasis en lograr un diseño robusto, a prueba de fallos y con un adecuado programa de tareas por ejecutar durante su ciclo de vida, lo cual fue definido como el tiempo total en el cual el equipo aseguraba un desempeño óptimo de las tareas para las cuales fue creado, implementando así el Mantenimiento Preventivo.
La creación de mejores ingenieros de diseño, derivó en un mejor análisis de las fallas, tanto de las que han ocurrido en base al registro de la información, como de las potenciales por ocurrir; por lo cual, ya en la década de los 70’ se desarrolló el Mantenimiento Basado en la Confiabilidad (RCM ), como un estilo de gestión, basado en el estudio acabado de los equipos, análisis de los modos de falla y en la aplicación de técnicas de estadística, que permitieran perfeccionar los planes de mantenimiento.
A lo largo del tiempo y con la implementación de nuevas herramientas computacionales que permitieron desarrollar de mejor manera la gestión de las actividades de mantenimiento, se cambió el enfoque desde una perspectiva reactiva hacia una perspectiva proactiva, pasando desde un foco centrado en acciones de reemplazo o reparación, hacia actividades predictivas, utilizando la trazabilidad de la información disponible como una herramienta de asesoramiento en tiempo real para apoyar en la toma de decisiones, desarrollando con ello el Mantenimiento Predictivo en base a datos.

                                  Figura Nº 1: Tipologías de Mantenimiento.
                                  
Este enfoque de mantenimiento, más dinámico, plantea una forma de supervisión que permite predecir potenciales degradaciones en el sistema y con ello planificar el momento en el cual es necesario realizar una actividad de mantenimiento, posibilitando además programar y minimizar las interrupciones. Además, disminuir el alto costo de realizar actividades de mantenimiento correctivo y prevenir la indisponibilidad del sistema que trae consigo el aplicar tal tarea.
Actualmente, para su aplicación, existen diversos software que permiten analizar grandes cantidades de datos (Big Data) y de manera particular en la Armada de Chile, existen potenciales herramientas que permitirían generar bases datos como son: el IPMS como un software de monitoreo de la condición de la maquinaria en un OPV capturando a través de sensores los diferentes estados del sistema de propulsión o también el MCAS, como monitoreo de la condición de la maquinaria en una FF Tipo 23; ambos sistemas permiten capturar información a través de sensores y efectuando una modificación computacional, permitirían almacenar los datos necesarios para implementar esta tipología de mantenimiento.

## Machine Learning:
Como se mencionó anteriormente, el gran volumen de datos (Big Data) generados por el almacenamiento de la información proveniente de sensores, produce un problema generalizado en su procesamiento. En respuesta a esto, el Data Science  cuenta con una herramienta que permite simplificar esta operación y realizar un análisis en tiempo real de la misma, generando sus propios algoritmos, este instrumento se llama Machine Learning.
El Machine Learning, es un mecanismo que permite a los computadores aprender a hacer lo que para nosotros resulta natural: aprender de la experiencia. Este mecanismo, utiliza algoritmos (a través de métodos computacionales), para obtener información analizando datos, sin la necesidad de contar con una determinada ecuación como modelo, es decir, los datos se procesan en una caja negra (Blackbox) que convierte un estímulo (datos de entrada), en una respuesta (datos procesados).

                              Figura Nº 2: Diagrama lógico del Machine Learning.

El Machine Learning se presenta como una ayuda esencial para el mantenimiento predictivo, permitiendo la recolección, limpieza, procesamiento y análisis a través de dos tipos de técnicas: la primera es aprendizaje supervisado, que entrena a un modelo de variables de entrada y salida conocidos que permitan predecir futuras salidas y, el segundo, es aprendizaje no supervisado que busca patrones de reconocimiento de estructuras sólo basada en los datos de entrada.

                                   Figura Nº 3: Técnicas de Machine Learning.

A partir de lo anterior, para aplicar el Machine Learning en la resolución de un problema de datos, se plantea un flujo de trabajo basado en 6 pasos: 

                                    Figura Nº 4: Flujo de Trabajo.
                                  
Adquisición y Carga de los datos: Es el proceso de captura a través de sensores de los datos de operación de un sistema y su almacenamiento en distintos Data-Set como información estructurada SQL  y procesable.
Preprocesamiento de los datos: Obteniendo características e identificando valores atípicos (Outliers) que se encuentren por fuera del resto de los datos y con ello decidir cuales son relevantes para la resolución del problema. Parte del preprocesamiento de los datos, es dividir los datos en dos partes. Una base de datos que se utilizará para entrenamiento (Train Set) y la otra base de datos se utilizará para verificar el adecuado ajuste del algoritmo (Test Set) , esto permitirá utilizar datos que no fueron incluidos en el modelo procesado y con ello reconocer como reacciona el algoritmo ante datos desconocidos.

- Obtención de Características: Obtener características de los datos procesados es la actividad más importante del flujo de trabajo, lo cual también es conocido como ingeniería de datos, ésta permite transformar data cruda en información que puede ser utilizada en un algoritmo de Machine Learning.
- Construir y entrenar el modelo: Cuando se construye un modelo, es recomendable comenzar por un algoritmo simple debido a que será más rápida su obtención e interpretación. Un ejemplo de esto es, si se utiliza en un modelo con etiquetas (modelo de clasificación) como: "standing", "sitting", "walking", "running", "dancing" (pararse, sentarse, caminar, correr y bailar); para conocer como se ajusta a las variables de respuesta, se puede realizar una matriz de confusión que permite comparar las clasificaciones realizadas por el modelo con las creadas de manera particular, de manera de obtener su ajuste, como se muestra a continuación:
                                      Figura Nº 5: Matriz de Confusión.
                                      
Cada punto de la matriz simboliza que el algoritmo de clasificación al ingresar variables desde sensores que tengan características de "sitting", tenga un 99% de probabilidad de clasificarse en dicha etiqueta, en tanto que, al ingresar un estímulo que tenga las características de "dancing", sólo exista un 59% de probabilidad de ser clasificado en esa categoría; lo anterior, permite comparar el nivel de eficiencia de los distintos modelos a través de su matriz.
- Realizar iteraciones para encontrar el mejor modelo: Del análisis obtenido de la matriz de confusión, se puede obtener la real efectividad del modelo utilizado, esto se logra comparando los resultados con las matrices obtenidas por otros modelos.
- Integrar el mejor modelo en un sistema de producción: Se debe generar una herramienta que permita al usuario, obtener conclusiones y ayudar en la toma de decisiones. Este tipo de plataforma puede ser representada en un dashboard o una interfaz adecuada para cada nivel técnico del operador, ya sea en una aplicación a través de smartphone o en un panel de operación del sistema de monitoreo en tiempo real.
- Por último, cabe destacar que dentro de las técnicas de aprendizaje supervisado, existen modelos de clasificación (respuestas discretas) y modelos de regresión (respuestas continuas), de lo cual se puede especificar lo siguiente: si la data posee etiquetas, categorizaciones o puede ser separada en grupos específicos, se deben utilizar algoritmos de Clasificación; por otra parte, si se trabaja con un rango de datos, si la naturaleza de la respuesta es un número real como la temperatura de operación o el tiempo hasta que se produzca una falla, se deben utilizar algoritmos de Regresión.

## Aplicación de Machine Learning en una Turbina GE LM2500:

Se ha seleccionado para su análisis una planta propulsora caracterizada como una combinación de dos motor diésel eléctricos Siemens (4,5 MW cada uno) con una turbina a gas General Electric LM2500 (20MW) lo que se traduce en una propulsión CODLAG tal como se utiliza en las fragatas F-125 de la Deutsche Marine. El componente principal a analizar en esta investigación, es la turbina que mecánicamente maneja las dos hélices de paso controlable (CPP) por intermedio de una caja de engranaje de conexión cruzada.
                    Figura Nº 6: Diagrama componentes principales propulsión CODLAG.
                    
Esta máquina térmica rotativa de combustión interna utiliza como medio de trabajo el gas y tiene un ciclo termodinámico completo que incluye un fluido de entrada como aire y un fluido de egreso como gas derivado de la combustión, convirtiendo la energía calórica contenida en el combustible, en trabajo mecánico rotacional a través de su eje.
Lo anterior, es controlado en modo local a través del telégrafo (Telegraph o Lever) que de acuerdo a una posición determinada, genera la demanda de velocidad requerida para gobernar el buque.
A continuación, se muestra un resumen de los parámetros involucrados en el proceso de utilización de una turbina a gas, estos consistentes en 16 datos de acuerdo al siguiente detalle:

                            Figura Nº 7: Resumen de parámetros de funcionamiento.
                            
El sistema de monitoreo de la condición de la maquinaria de la fragata, almacena de manera automática estos parámetros de operación en una base de datos relacional, pero el acceso a los datos de operación de la turbina en la Deutsche Marine se encuentran regulados como información clasificada, por lo cual, se decidió utilizar una base de datos provista por la **University of California Irvine (UCI)** en su repositorio de Machine Learning, la cual contiene una simulación de los 16 parámetros de una turbina de similares características, durante 1 año de operación (11.934 mediciones). 	

Además, esta base de datos incluye dos variables adicionales: Compressor Degradation Coefficient (〖kM〗_C) y Gas Turbine Degradation Coefficient (〖kM〗_t), ambos representan la degradación sobre las horas de servicio remanentes de ambos componentes. En resumen, se tiene una base de datos de 18 variables, consistente en 16 variables simuladas (datos de operación), más 2 variables calculadas (coeficientes de degradación).

De acuerdo a lo descrito anteriormente, utilizando la base de datos del repositorio (UCI) y aplicando el flujo de trabajo descrito en la presente investigación, se aplicaron herramientas de Data Science con técnica de Aprendizaje Supervisado (respuesta conocida) en un modelo de clasificación, para crear un sistema de análisis de la turbina a gas que permitiera monitorear en tiempo real sus horas de servicio remanentes de acuerdo a un determinado nivel de confiabilidad.

### Modelo de Clasificación:
Preliminarmente, se deben establecer criterios para crear etiquetas al conjunto de datos (necesarios para un modelo de clasificación), estos se establecieron en base al rango permisible de los respectivos coeficientes de degradación provistos en la base de datos, utilizando las siguientes etiquetas: Operación Normal, Tomar Precaución o Reparación Urgente . Estas etiquetas han sido designadas de manera aleatoria para que el operador del sistema de monitoreo automatizado tenga una alerta del comportamiento de la turbina, con lo cual se obtiene el siguiente detalle:

                            Figura Nº 8: Resumen de cantidad de etiquetas clasificadas.

Objeto observar de mejor manera la real incidencia de la posición del telégrafo en función de las variables anteriormente descritas, se designan colores (Rojo: Reparación Urgente, Verde: Tomar Precaución, Azul: Operación Normal), para representar cada una de las etiquetas en el siguiente gráfico:

                          Figura Nº 9: Comparación de Variables en función del telégrafo.

De acuerdo con lo anterior, podemos determinar que los parámetros de temperatura de salida de la turbina (HP Turbine Exit Temperature) y temperatura de salida del compresor (GT compressor outlet air temperature), tienen mayor incidencia en la pérdida de eficiencia.
De igual manera, se realizó una matriz de correlación para determinar el nivel de relación de cada variable y de cuales variables no tenían mayor incidencia en la resolución del problema.

                            Figura Nº 10: Matriz de correlación de las 16 variables.

Como se observa en la matriz de correlación, los parámetros de presión y temperatura de entrada (inlet air, inlet pressure) son siempre 1 Bar y 15 ºC (simulación), por lo cual no tienen un nivel de significancia para la resolución del problema y pueden ser descartados de la simulación.
Realizado el análisis preliminar, se efectúa una partición de la totalidad de los datos en 2 grandes grupos. El primero de ellos (Training Set) correspondiente al 80% para efectuar el entrenamiento de la base de datos y el 20% restante (Test Set), se utilizará como variable de comprobación del algoritmo seleccionado como modelo de predicción, quedando en los siguientes resultados:

                            Figura Nº 11: Resumen de cantidad de etiquetas clasificadas.

Definido lo anterior y establecidos los grupos aleatorios, se realizó la simulación del grupo de entrenamiento (Training Set) utilizando las 16 variables continuas,  considerando como respuesta la variable discreta equivalente a la etiqueta de clasificación (Operación Normal, Tomar Precaución, Reparación Urgente), de acuerdo al siguiente resultado:

#### K-Nearest Neighbor (KNN): 
Se utilizó un modelo de KNN Weighted obteniendo un porcentaje de 94,8% de eficiencia, con la siguiente matriz de confusión:

                                    Figura 12: Matriz de Confusión KNN Weighted.

A partir de los datos expuestos y considerando los grados de respuesta y confiabilidad de los modelos, se decidió elegir como algoritmo de predicción el KNN Weighted para crear la BlackBox. 
Efectuado lo anterior se realizó lo siguiente: en primer lugar se tiene el detalle del 20% que no se utilizó para crear el algoritmo (Test Set), equivalente a las etiquetas de la figura 15. En segundo lugar, utilizando la BlackBox generada por el algoritmo a través de Matlab, se aplicó una función de predicción a esta base de datos (Test Set) para crear una nueva base de datos llamada Trained Set (detallada en la figura 15). Cabe destacar que esto se realizó para verificar la efectividad del algoritmo utilizando la base de datos desconocida para el modelo que representaría la entrada de nuevos datos derivados de la operación de la turbina a gas para luego, ser comparada con una nueva base de datos (Trained Set) obtenida tras aplicar esta función como datos entrenados, obteniendo los siguientes resultados:

                              Figura 13: Resumen de resultados tras aplicar el modelo.

A partir de los resultados expuestos en la figura 15, se puede señalar que si se implementa esta herramienta de predicción a la turbina, al ingresar nueva data al sistema a través de sus sensores de operación, existe un 99,668% de que el sistema de monitoreo encienda una alerta (Tomar Precaución), cuando existan condiciones que disminuyan el nivel de confiabilidad o que demanden tomar precaución del equipo, permitiendo al usuario tomar medidas paleativas para aumentar la eficiencia o prevenir una falla mayor.
Cabe destacar que el algoritmo aprende de la experiencia, por lo cual, el nivel de eficiencia en su predicción irá en aumento a medida que se ingrese más información al sistema (operando el equipo).

## Conclusiones y comentarios finales:
En virtud de lo demostrado en esta investigación, se puede señalar que la aplicación de este tipo de tecnología en la industria del mantenimiento beneficia no sólo a la reducción de costos, si no que, al efectuar una predicción avanzada al sistema, permite una adecuada planificación y con ello aumentar el nivel de disponibilidad de los equipos (reducción del tiempo de parada), factor preponderante en las operaciones navales.
Como fue expuesto, las herramientas de Machine Learning demostraron un alto grado de eficacia en la determinación de los estados (etiquetas), así como su capacidad para trabajar con grandes cantidades de datos, constituyéndose como una aplicación fundamental en la implementación de una estrategia de mantenimiento predictivo.
Dentro de las ventajas de utilizar este tipo de herramientas, destacan que no es necesario conocer al detalle los algoritmos matemáticos involucrados, siendo una herramienta de fácil comprensión y de grandes prestaciones, para cualquier tipo de usuario u organzación.
Finalmente, cabe destacar que la transformación digital es entendida como la integración de la tecnología en todas las áreas de una organización, esta tendencia no solo implica el replanteamiento de la gestión actual, si no que representa una oportunidad para simplificar procesos, automatizando el trabajo de las personas a través de herramientas computacionales.

## Bibliografía:
1. Atamuradov et al. (2017) Prognostics and Health Management for Maintenance Practitioners, Review Implementation and Tools. International Journal of Prognostics and Health Management.
2. Bastos et al. (2014) Application of Data Mining in a Maintenance System for Failure Prediction. Taylor and Francis Group of Safety, Reliability and Risk Analysis: London, UK.
3. Carrasco, E. [Alid P.G.] (2019). Herramientas de Machine Learning para el análisis del mantenimiento predictivo en una planta de propulsión naval. Tesis para optar al Título de Ingeniero Civil Industrial. Universidad Andrés Bello, Concepción.
4. Coble and Hines (2011) Applying the General Path Model to Estimation of Remaining Useful Life. International Journal of Prognostics and Health Management, University of Tennessee: Knoxville, USA.  
5. Coraddu, A. et al (2014) Machine Learning Approaches for improving condition-based maintenance of naval propulsion plants. IMechE, Journal of Engineering for the Maritime Environment. Vol 230 (I).
6. Dragomir et al (2009) Review of prognostic problem in condition-based maintenance. IFAC and in collaboration with the IEEE Control Systems Society.
7. Espino, Carlos (2017) Análisis Predictivo: técnicas y modelos utilizados y aplicaciones del mismo. Tesis para optar al grado académico de Ingeniero Informático. Universitat Oberta de Catalunya, España.
8. Fernández J. (2009) Ciclo Brayton -Turbinas a Gas. Universidad Tecnológica Nacional. Editorial: UTN; Mendoza, Argentina.
9. Hederra F. (2018) Información mediante Network Centric Warfare en la Armada, ¿Cómo y Cuándo?. Revista de Marina Nº 967, pp. 24-30. ISSN 0034-8511.
10. MATLAB (2018) Statistics and Machine Learning Toolbox - White Paper. The MathWorks Inc.
