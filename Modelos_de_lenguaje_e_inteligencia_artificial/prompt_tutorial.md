
![header](/Tutoriales-IFC/assets/header.png)

# Aprende a crear un prompt

Para obtener los mejores resultados de una consulta a un modelo de lenguaje, es muy importante utilizar el *prompt* adecuado. 

Un *prompt* es la instrucción que le damos al modelo de lenguaje para recibir un resultado, este puede ser una pregunta, una instrucción o simples palabras (cómo si usaramos un motor de búsqueda como Google), sin embargo, la calidad de los resultados, dependerá en gran medida de nuestra instrucción inicial. 

En las siguientes líneas el modelo de lenguaje mas avanzado al momento de escribir este tutorial (Gemini 2.5 Pro), te explica lo que constituye "un buen prompt"

---
## Prompt malo vs. prompt bueno 🧬

**Mal Ejemplo de Prompt:** 💩

"Háblame de la proteína Tau."

**Buen Ejemplo de Prompt:** 👍

"Actúa como un neurocientífico experto en enfermedades neurodegenerativas. Necesito un resumen conciso (máximo 300 palabras) enfocado en el papel de la proteína Tau fosforilada en la patogénesis de la enfermedad de Alzheimer. Por favor, incluye:
1.  Mecanismos moleculares clave por los cuales la Tau fosforilada contribuye a la disfunción neuronal.
2.  Menciona brevemente las principales quinasas y fosfatasas involucradas en la regulación de la fosforilación de Tau.
3.  Describe brevemente cómo la agregación de Tau fosforilada lleva a la formación de ovillos neurofibrilares.
4.  Elabora la respuesta en un lenguaje técnico adecuado para una audiencia de estudiantes de posgrado en neurociencias. Evita la jerga excesiva y define términos clave si es necesario."

---
## Desglose de un Buen Prompt para Investigación Biológica 🔬

Un prompt efectivo para investigadores en neurociencias, biología molecular y celular debe ser claro, específico y proporcionar suficiente contexto. Aquí están los componentes esenciales:

### 1. **Define el Rol (Persona)** 🧑‍🔬
Indicar al LLM qué "sombrero" debe ponerse mejora la relevancia y el tono de la respuesta.
* **Ejemplo:** "Actúa como un biólogo molecular especializado en edición genética..." o "Asume el rol de un revisor experto para una revista de neurociencia..."
* **Por qué es útil:** Ayuda al LLM a acceder a la información y al estilo de comunicación más apropiado para el campo.

### 2. **Contexto Detallado del Tema** 🧪
Proporciona información de fondo crucial para que el LLM entienda el marco de tu pregunta.
* **Ejemplo:** "Estoy investigando los mecanismos de plasticidad sináptica en el hipocampo..." o "Necesito información sobre las vías de señalización celular implicadas en la autofagia en células cancerosas..."
* **Por qué es útil:** Reduce la ambigüedad y permite que el LLM genere respuestas más enfocadas y pertinentes.

### 3. **Tarea Específica y Clara** 🎯
Sé explícito sobre lo que quieres que haga el LLM.
* **Ejemplos:**
    * "Genera una hipótesis sobre cómo el microARN X podría regular la expresión del gen Y en neuronas dopaminérgicas."
    * "Resume los hallazgos clave del siguiente artículo [pegar abstract o DOI si el modelo tiene acceso a internet/plugins]."
    * "Explica el mecanismo de acción de la técnica CRISPR-Cas9 para la edición génica en eucariotas."
    * "Diseña un esquema experimental básico para probar la interacción entre la proteína A y la proteína B utilizando co-inmunoprecipitación."
    * "Elabora una lista de posibles marcadores moleculares para identificar astrocitos reactivos en un modelo murino de isquemia cerebral."
* **Por qué es útil:** Dirige al LLM hacia el resultado deseado, evitando respuestas genéricas.

### 4. **Formato de Salida Deseado** 📄
Especifica cómo quieres que se presente la información.
* **Ejemplos:** "...en formato de lista con viñetas.", "...en un párrafo conciso.", "...como una tabla comparativa.", "...en un máximo de X palabras/párrafos."
* **Por qué es útil:** Facilita la utilización de la respuesta y ahorra tiempo en la edición posterior.

### 5. **Audiencia y Nivel de Lenguaje** 🗣️
Indica para quién es la información y el nivel de tecnicismo esperado.
* **Ejemplo:** "...para una presentación a colegas investigadores.", "...para explicar a estudiantes de licenciatura.", "...en un lenguaje técnico preciso pero accesible."
* **Por qué es útil:** Asegura que la respuesta sea comprensible y adecuada para el público objetivo.

### 6. **Restricciones y Puntos a Evitar** 🚫
Si hay aspectos que no deben incluirse o enfoques que deben evitarse, menciónalos.
* **Ejemplo:** "No incluyas información sobre tratamientos clínicos.", "Concéntrate en los mecanismos moleculares, no en los aspectos evolutivos.", "Evita la especulación excesiva y céntrate en evidencia publicada."
* **Por qué es útil:** Ayuda a refinar la respuesta y a mantenerla dentro del alcance deseado.

### 7. **(Opcional) Proporcionar Ejemplos o Datos** 📊
Si tienes un ejemplo de lo que buscas o datos específicos que el LLM debe usar, inclúyelos.
* **Ejemplo:** "Basándote en estos datos de secuenciación [pegar datos resumidos si es factible], sugiere posibles vías afectadas." o "Aquí tienes un ejemplo de un resumen que me gusta: [ejemplo]."
* **Por qué es útil:** Guía al LLM de manera más precisa hacia el tipo de respuesta que esperas.

---
Al enseñar a tus colegas y estudiantes a incorporar estos elementos en sus prompts, verán una mejora significativa en la calidad y utilidad de las respuestas de los LLMs, convirtiéndolos en herramientas aún más poderosas para la investigación biológica. ¡Mucho éxito con tu seminario!

![header](/Tutoriales-IFC/assets/header.png)

