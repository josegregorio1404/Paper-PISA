
############################# Codigo ###########################################

# Librerias ----

library(haven)
library(dplyr)

# Bases de datos separadas ----

CY08MSP_STU_QQQ <- read_sas("CY08MSP_STU_QQQ.SAS7BDAT", NULL)

CY08MSP_SCH_QQQ <- read_sas("CY08MSP_SCH_QQQ.SAS7BDAT", NULL)

CY08MSP_TCH_QQQ <- read_sas("CY08MSP_TCH_QQQ.SAS7BDAT", NULL)


# Filtra durante la lectura (menos eficiente que Python para archivos muy grandes) ----


paises <- c("ARG", "BRA", "CHL", "COL", "CRI", "GTM", "MEX", "PAN", "PER", "PRY", "SLV", "URY")
paises1 <- c("BRA", "COL", "CRI", "PAN", "PER")

students <- CY08MSP_STU_QQQ %>%
  select(CNT, CNTRYID, CNTSCHID, CNTSTUID, ST250Q01JA,ST250Q03JA,ST251Q06JA,
         ST251Q07JA,ST253Q01JA, ST254Q01JA, ST254Q02JA, ST254Q03JA, ST254Q04JA,
         ST250Q02JA,ST250Q04JA, ST250Q05JA,STRATUM,ST255Q01JA, ST256Q06JA,
         ST256Q08JA, ST256Q10JA, ST251Q01JA, ST251Q03JA, ST258Q01JA, ST259Q01JA,
         ST259Q02JA, ST005Q01JA, ST006Q01JA, ST006Q02JA, ST006Q03JA, ST006Q04JA,
         ST006Q05JA, ST007Q01JA, ST008Q01JA, ST008Q02JA, ST008Q03JA, ST008Q04JA,
         ST008Q05JA, ST004D01T, ST268Q01JA, ST268Q04JA, ST268Q07JA, ST290Q01WA,
         ST290Q02WA, ST290Q03WA, ST290Q04WA, ST290Q05WA, ST290Q06WA, ST290Q07WA,
         ST290Q08WA, ST290Q09WA, ST291Q01JA, ST291Q02JA, ST291Q03JA, ST291Q04JA,
         ST291Q05JA, ST291Q06JA, ST291Q07JA, ST291Q08JA, ST291Q09JA, ST291Q10JA,
         ST289Q01WA, ST289Q02JA, ST289Q03WA, ST289Q04JA, ST289Q05WA, ST289Q06JA,
         ST289Q07JA, ST289Q08WA, ST289Q09WA, ST289Q10WA, ST289Q11WA, ST289Q14JA,
         ST293Q01JA, ST293Q02JA, ST293Q03JA, ST293Q04JA, ST293Q05JA, ST293Q06JA,
         ST293Q07JA, ST293Q09JA, ST297Q01JA, ST297Q03JA, ST297Q05JA, ST297Q06JA,
         ST297Q07JA, ST297Q09JA, ST337Q08JA, ST338Q07JA, ST338Q08JA, ST263Q02JA,
         ST263Q04JA, ST263Q08JA, ST016Q01NA, ST265Q03JA, ST265Q04JA, ST307Q01JA,
         ST307Q02JA, ST307Q05JA, ST307Q08JA, ST307Q09JA, ST301Q05JA, ST301Q08JA,
         ST345Q05JA, ST345Q06JA, ST345Q09JA, ST294Q02JA, ST295Q02JA, ST322Q04JA,
         ANXMAT, ST292Q01JA, ST292Q02JA, ST292Q03JA, ST292Q04JA, ST292Q05JA, ST292Q06JA,
         ST127Q01TA, ST127Q02TA, ST127Q03TA, ST260Q01JA, ST260Q02JA, ST260Q03JA,
         ST261Q07JA, ST261Q10JA, ST062Q01TA, ST062Q02TA, ST062Q03TA, ST266Q03JA,
         ST266Q04JA, ST266Q05JA, ST300Q01JA, ST300Q03JA, ST300Q04JA, ST300Q05JA, 
         ST300Q06JA, ST300Q07JA, ST300Q08JA, ST300Q09JA, ST300Q10JA, ST324Q02JA, 
         ST324Q04JA, ST324Q05JA, ST324Q07JA, ST324Q12JA, ST324Q13JA, ST324Q14JA, 
         PA197Q02WA, EXPECEDU, PA197Q02WA, PA197Q03WA, PA197Q04WA, PA197Q05WA,
         PV1MATH, PV2MATH, PV3MATH, PV4MATH, PV5MATH, PV6MATH, PV7MATH, PV8MATH,
         PV9MATH, PV10MATH, MATHEFF, MATHPERS, OCOD3, OCOD2, OCOD1) %>%
  filter(CNT %in% paises1)
  

school <- CY08MSP_SCH_QQQ %>%
  select(CNT, CNTSCHID, SC013Q01TA, SC016Q01TA, SC004Q02TA, SC004Q03TA, SC004Q07NA, SC211Q03JA,STRATIO, 
    SMRATIO, MCLSIZE, MTTRAIN, TEAFDBK, MACTIV, MATHEXC, ABGMATH) %>%
  filter(CNT %in% paises1)

teacher <- CY08MSP_TCH_QQQ %>%
  select(CNT, CNTSCHID, TC230Q01JA, TC230Q02JA, TC230Q03JA, TC230Q07JA,
         TC230Q08JA, TC230Q09JA, TC230Q10JA, TC230Q11JA, TC227Q01JA,
         TC227Q02JA, TC227Q03JA, TC227Q04JA, TC227Q05JA, TC227Q06JA,
         TC227Q07JA, TC227Q08JA, TC227Q09JA, TC228Q01JA, TC228Q02JA,
         TC228Q03JA, TC228Q04JA, TC228Q05JA, TC228Q06JA, TC228Q07JA,
         TC228Q08JA, TC228Q09JA, TC169Q01HA, TC169Q02HA, TC169Q03HA,
         TC169Q04HA, TC169Q05HA, TC169Q06HA, TC169Q07HA, TC169Q08HA,
         TC169Q09HA, TC169Q10HA, TC169Q11HA, TC169Q13HA, TC169Q14HA,
         TC169Q15JA, TC220Q02JA, TC220Q04JA, TC220Q06JA, TC220Q07JA,
         TC220Q08JA, TC220Q09JA, TC220Q10JA, TC220Q11JA, TC220Q12JA,
         TC185Q01HA, TC185Q02HA, TC185Q03HA, TC185Q04HA, TC185Q05HA, 
         TC185Q06HA, TC185Q08HA, TC185Q09HA, TC185Q10HA, TC185Q14HA,
         TC185Q15HA, TC185Q16HA, TC185Q18HA) %>%
  filter(CNT %in% paises1) #Hablar que en la base de datos teacher solo hay de LATAM los paises de "paises1"


# Juntar las tablas por ID de escuela y ID de pais (Revisar STATA) ----

write_dta(students, path = "C:/Users/FabiyJose/OneDrive/Desktop/proyecto voluntariado/base2/students.dta")

write_dta(school, path = "C:/Users/FabiyJose/OneDrive/Desktop/proyecto voluntariado/base2/school.dta")

write_dta(teacher, path = "C:/Users/FabiyJose/OneDrive/Desktop/proyecto voluntariado/base2/teacher.dta")

pisa_2022 <- read_dta("C:/Users/FabiyJose/OneDrive/Desktop/proyecto voluntariado/base2/pisa_2022.dta")

# Renombre de las variables ----

pisa_2022 <- pisa_2022 %>%
  rename(
    # Identificadores (comunes a todas las tablas)
    pais = CNT,
    id_pais = CNTRYID,
    id_escuela = CNTSCHID,
    id_estudiante = CNTSTUID,
    estrato = STRATUM,
    
    # Recursos en el hogar
    habitacion_propia = ST250Q01JA,
    software_educativo = ST250Q03JA,
    instrumentos_musicales = ST251Q06JA,
    obras_arte = ST251Q07JA,
    dispositivos_pantalla = ST253Q01JA,
    televisores = ST254Q01JA,
    computadoras_escritorio = ST254Q02JA,
    laptops = ST254Q03JA,
    tablets = ST254Q04JA,
    computadora_tareas = ST250Q02JA,
    celular_internet = ST250Q04JA,
    internet_hogar = ST250Q05JA,
    libros_hogar = ST255Q01JA,
    libros_ciencia = ST256Q06JA,
    libros_referencia = ST256Q08JA,
    libros_escolares = ST256Q10JA,
    vehiculos = ST251Q01JA,
    banos = ST251Q03JA,
    
    # Índice socioeconómico
    falta_comida_dinero = ST258Q01JA,
    estatus_economico_actual = ST259Q01JA,
    estatus_economico_futuro = ST259Q02JA,
    pct_desfavorecidos = SC211Q03JA,
    
    # Educación padres
    educacion_madre = ST005Q01JA,
    calificaciones_madre_1 = ST006Q01JA,
    calificaciones_madre_2 = ST006Q02JA,
    calificaciones_madre_3 = ST006Q03JA,
    calificaciones_madre_4 = ST006Q04JA,
    calificaciones_madre_5 = ST006Q05JA,
    educacion_padre = ST007Q01JA,
    calificaciones_padre_1 = ST008Q01JA,
    calificaciones_padre_2 = ST008Q02JA,
    calificaciones_padre_3 = ST008Q03JA,
    calificaciones_padre_4 = ST008Q04JA,
    calificaciones_padre_5 = ST008Q05JA,
    
    # Género
    genero = ST004D01T,
    
    # Autopercepción y actitudes
    matematica_favorita = ST268Q01JA,
    matematica_facil = ST268Q04JA,
    buen_desempeno_mate = ST268Q07JA,
    confianza_mate_1 = ST290Q01WA,
    confianza_mate_2 = ST290Q02WA,
    confianza_mate_3 = ST290Q03WA,
    confianza_mate_4 = ST290Q04WA,
    confianza_mate_5 = ST290Q05WA,
    confianza_mate_6 = ST290Q06WA,
    confianza_mate_7 = ST290Q07WA,
    confianza_mate_8 = ST290Q08WA,
    confianza_mate_9 = ST290Q09WA,
    confianza_mate_10 = ST291Q01JA,
    confianza_mate_11 = ST291Q02JA,
    confianza_mate_12 = ST291Q03JA,
    confianza_mate_13 = ST291Q04JA,
    confianza_mate_14 = ST291Q05JA,
    confianza_mate_15 = ST291Q06JA,
    confianza_mate_16 = ST291Q07JA,
    confianza_mate_17 = ST291Q08JA,
    confianza_mate_18 = ST291Q09JA,
    confianza_mate_19 = ST291Q10JA,
    familiaridad_terminos_1 = ST289Q01WA,
    familiaridad_terminos_2 = ST289Q02JA,
    familiaridad_terminos_3 = ST289Q03WA,
    familiaridad_terminos_4 = ST289Q04JA,
    familiaridad_terminos_5 = ST289Q05WA,
    familiaridad_terminos_6 = ST289Q06JA,
    familiaridad_terminos_7 = ST289Q07JA,
    familiaridad_terminos_8 = ST289Q08WA,
    familiaridad_terminos_9 = ST289Q09WA,
    familiaridad_terminos_10 = ST289Q10WA,
    familiaridad_terminos_11 = ST289Q11WA,
    familiaridad_terminos_12 = ST289Q14JA,
    participacion_mate_1 = ST293Q01JA,
    participacion_mate_2 = ST293Q02JA,
    participacion_mate_3 = ST293Q03JA,
    participacion_mate_4 = ST293Q04JA,
    participacion_mate_5 = ST293Q05JA,
    participacion_mate_6 = ST293Q06JA,
    participacion_mate_7 = ST293Q07JA,
    participacion_mate_8 = ST293Q09JA,
    instruccion_adicional_1 = ST297Q01JA,
    instruccion_adicional_2 = ST297Q03JA,
    instruccion_adicional_3 = ST297Q05JA,
    instruccion_adicional_4 = ST297Q06JA,
    instruccion_adicional_5 = ST297Q07JA,
    instruccion_adicional_6 = ST297Q09JA,
    actividades_stem_1 = ST337Q08JA,
    actividades_stem_2 = ST338Q07JA,
    actividades_stem_3 = ST338Q08JA,
    inteligencia_fija = ST263Q02JA,
    habilidades_mate_fijas = ST263Q04JA,
    creatividad_fija = ST263Q08JA,
    satisfaccion_vida = ST016Q01NA,
    seguridad_clase = ST265Q03JA,
    seguridad_escuela = ST265Q04JA,
    
    # Motivación y hábitos de estudio
    persistencia_tarea = ST307Q01JA,
    esfuerzo_desafio = ST307Q02JA,
    mas_persistente = ST307Q05JA,
    completar_tareas_dificiles = ST307Q08JA,
    terminar_tareas = ST307Q09JA,
    disfruta_aprender = ST301Q05JA,
    aprendizaje_aburrido = ST301Q08JA,
    trabajar_presion = ST345Q05JA,
    calma_estres = ST345Q06JA,
    manejo_estres = ST345Q09JA,
    estudio_manana = ST294Q02JA,
    estudio_tarde = ST295Q02JA,
    dispositivos_clase = ST322Q04JA,
    
    # Ansiedad matemáticas
    ansiedad_mate = ANXMAT,
    ansiedad_mate_1 = ST292Q01JA,
    ansiedad_mate_2 = ST292Q02JA,
    ansiedad_mate_3 = ST292Q03JA,
    ansiedad_mate_4 = ST292Q04JA,
    ansiedad_mate_5 = ST292Q05JA,
    ansiedad_mate_6 = ST292Q06JA,
    
    # Historial escolar
    repitio_grado_1 = ST127Q01TA,
    repitio_grado_2 = ST127Q02TA,
    repitio_grado_3 = ST127Q03TA,
    ausencia_prolongada_1 = ST260Q01JA,
    ausencia_prolongada_2 = ST260Q02JA,
    ausencia_prolongada_3 = ST260Q03JA,
    ausencia_trabajo = ST261Q07JA,
    ausencia_cuotas = ST261Q10JA,
    ausencia_reciente_1 = ST062Q01TA,
    ausencia_reciente_2 = ST062Q02TA,
    ausencia_reciente_3 = ST062Q03TA,
    pandillas_escuela_1 = ST266Q03JA,
    pandillas_escuela_2 = ST266Q04JA,
    pandillas_escuela_3 = ST266Q05JA,
    
    # Apoyo familiar
    discusion_rendimiento = ST300Q01JA,
    tiempo_conversacion = ST300Q03JA,
    importancia_educacion = ST300Q04JA,
    problemas_escuela = ST300Q05JA,
    relaciones_estudiantes = ST300Q06JA,
    animo_buenas_notas = ST300Q07JA,
    interes_aprendizaje = ST300Q08JA,
    plan_educacion_futura = ST300Q09JA,
    preguntas_actividades = ST300Q10JA,
    
    # Percepciones futuras
    preocupacion_preparacion = ST324Q02JA,
    informado_caminos = ST324Q04JA,
    presion_familiar = ST324Q05JA,
    preocupacion_dinero = ST324Q07JA,
    confianza_decisiones = ST324Q12JA,
    habilidades_utiles = ST324Q13JA,
    preparacion_futuro = ST324Q14JA,
    
    # Expectativas padres
    expectativa_carrera_mate_1 = PA197Q02WA,
    expectativa_carrera_mate_2 = PA197Q03WA,
    expectativa_carrera_mate_3 = PA197Q04WA,
    expectativa_carrera_mate_4 = PA197Q05WA,
    educacion_esperada = EXPECEDU,
    
    # Desempeño matemáticas
    pv_math_1 = PV1MATH,
    pv_math_2 = PV2MATH,
    pv_math_3 = PV3MATH,
    pv_math_4 = PV4MATH,
    pv_math_5 = PV5MATH,
    pv_math_6 = PV6MATH,
    pv_math_7 = PV7MATH,
    pv_math_8 = PV8MATH,
    pv_math_9 = PV9MATH,
    pv_math_10 = PV10MATH,
    autoeficacia_mate = MATHEFF,
    persistencia_mate = MATHPERS,
    
    # Ocupación padres
    ocupacion_1 = OCOD1,
    ocupacion_2 = OCOD2,
    ocupacion_3 = OCOD3,
    
    tipo_escuela = SC013Q01TA,
    financiamiento_gobierno = SC016Q01TA,
    computadoras_estudiantes = SC004Q02TA,
    computadoras_internet = SC004Q03TA,
    computadoras_profesores = SC004Q07NA,
    ratio_estudiante_profesor = STRATIO,
    ratio_estudiante_profesor_mate = SMRATIO,
    tamano_clase_mate = MCLSIZE,
    formacion_profesores_mate = MTTRAIN,
    retroalimentacion_profesores = TEAFDBK,
    actividades_extracurriculares_mate = MACTIV,
    cursos_extension_mate = MATHEXC,
    agrupacion_habilidad_mate = ABGMATH,
    
    # Enfoque enseñanza matemáticas
    enfoque_mundo_real = TC230Q01JA,
    enfoque_estructura_logica = TC230Q02JA,
    importancia_explicacion = TC230Q03JA,
    problemas_dificiles = TC230Q07JA,
    pocos_problemas_complejos = TC230Q08JA,
    objetivo_logica = TC230Q09JA,
    uso_tecnologia = TC230Q10JA,
    creatividad_matematica = TC230Q11JA,
    
    # Prácticas docentes - pensamiento matemático
    fomento_pensamiento_mate_1 = TC227Q01JA,
    fomento_pensamiento_mate_2 = TC227Q02JA,
    fomento_pensamiento_mate_3 = TC227Q03JA,
    fomento_pensamiento_mate_4 = TC227Q04JA,
    fomento_pensamiento_mate_5 = TC227Q05JA,
    fomento_pensamiento_mate_6 = TC227Q06JA,
    fomento_pensamiento_mate_7 = TC227Q07JA,
    fomento_pensamiento_mate_8 = TC227Q08JA,
    fomento_pensamiento_mate_9 = TC227Q09JA,
    
    # Prácticas docentes - razonamiento
    explicacion_razonamiento_1 = TC228Q01JA,
    explicacion_razonamiento_2 = TC228Q02JA,
    explicacion_razonamiento_3 = TC228Q03JA,
    explicacion_razonamiento_4 = TC228Q04JA,
    explicacion_razonamiento_5 = TC228Q05JA,
    explicacion_razonamiento_6 = TC228Q06JA,
    explicacion_razonamiento_7 = TC228Q07JA,
    explicacion_razonamiento_8 = TC228Q08JA,
    explicacion_razonamiento_9 = TC228Q09JA,
    
    # Uso de tecnología
    uso_software_1 = TC169Q01HA,
    uso_software_2 = TC169Q02HA,
    uso_software_3 = TC169Q03HA,
    uso_software_4 = TC169Q04HA,
    uso_software_5 = TC169Q05HA,
    uso_software_6 = TC169Q06HA,
    uso_software_7 = TC169Q07HA,
    uso_software_8 = TC169Q08HA,
    uso_software_9 = TC169Q09HA,
    uso_software_10 = TC169Q10HA,
    uso_software_11 = TC169Q11HA,
    uso_software_12 = TC169Q13HA,
    uso_software_13 = TC169Q14HA,
    uso_software_14 = TC169Q15JA,
    
    # Recursos digitales
    recursos_digitales_1 = TC220Q02JA,
    recursos_digitales_2 = TC220Q04JA,
    recursos_digitales_3 = TC220Q06JA,
    recursos_digitales_4 = TC220Q07JA,
    recursos_digitales_5 = TC220Q08JA,
    recursos_digitales_6 = TC220Q09JA,
    recursos_digitales_7 = TC220Q10JA,
    recursos_digitales_8 = TC220Q11JA,
    recursos_digitales_9 = TC220Q12JA,
    
    # Desarrollo profesional
    desarrollo_profesional_1 = TC185Q01HA,
    desarrollo_profesional_2 = TC185Q02HA,
    desarrollo_profesional_3 = TC185Q03HA,
    desarrollo_profesional_4 = TC185Q04HA,
    desarrollo_profesional_5 = TC185Q05HA,
    desarrollo_profesional_6 = TC185Q06HA,
    desarrollo_profesional_7 = TC185Q08HA,
    desarrollo_profesional_8 = TC185Q09HA,
    desarrollo_profesional_9 = TC185Q10HA,
    desarrollo_profesional_10 = TC185Q14HA,
    desarrollo_profesional_11 = TC185Q15HA,
    desarrollo_profesional_12 = TC185Q16HA,
    desarrollo_profesional_13 = TC185Q18HA
  )

# Crear la columna para expectativas de ejercicio profesiona en carreras stem ----

#Estudiante
pisa_2022$ocupacion_3 <- as.numeric(pisa_2022$ocupacion_3)

pisa_2022 <- pisa_2022 %>%
  mutate(stem = case_when(
    between(ocupacion_3, 2111, 2166) | 
    between(ocupacion_3, 2511, 2529) | 
    between(ocupacion_3, 3111, 3155) | 
    between(ocupacion_3, 3511, 3522) |
    ocupacion_3 %in% c(21, 25, 31, 35, 211:216, 251:252, 311:315, 351:352) ~ 1,
    ocupacion_3 %in% c(9997, 9998, 9999) ~ NA,
    TRUE ~ 0
  ))
    
sum(pisa_2022$stem, na.rm = TRUE)


#Padre
pisa_2022$ocupacion_2 <- as.numeric(pisa_2022$ocupacion_2)

pisa_2022 <- pisa_2022 %>%
  mutate(stem_padre = case_when(
    between(ocupacion_2, 2111, 2166) | 
    between(ocupacion_2, 2511, 2529) | 
    between(ocupacion_2, 3111, 3155) | 
    between(ocupacion_2, 3511, 3522) |
    ocupacion_2 %in% c(21, 25, 31, 35, 211:216, 251:252, 311:315, 351:352) ~ 1,
    ocupacion_2 %in% c(9997, 9998, 9999) ~ NA,
    TRUE ~ 0
  ))

sum(pisa_2022$stem_padre, na.rm = TRUE)


#Madre
pisa_2022$ocupacion_1 <- as.numeric(pisa_2022$ocupacion_1)

pisa_2022 <- pisa_2022 %>%
  mutate(stem_madre = case_when(
    between(ocupacion_1, 2111, 2166) | 
    between(ocupacion_1, 2511, 2529) | 
    between(ocupacion_1, 3111, 3155) | 
    between(ocupacion_1, 3511, 3522) |
    ocupacion_1 %in% c(21, 25, 31, 35, 211:216, 251:252, 311:315, 351:352) ~ 1,
    ocupacion_1 %in% c(9997, 9998, 9999) ~ NA,
    TRUE ~ 0
  )) #between(ocupacion_1, 2211, 2222)| ocupacion_1 %in% c(22, 24, 221, 222, 225, 226, 241:243, 2250)
     #between(ocupacion_1, 2261, 2269)| between(ocupacion_1, 2411, 2434)| between(ocupacion_1, 2631, 2634)
#22: medicina
#24: Profesionales de negocios y administración
#2631: Ciencias sociales

sum(pisa_2022$stem_madre, na.rm = TRUE)


# Recodificar las variables que sean necesarias recodificar

cuartiles <- quantile(pisa_2022$pct_desfavorecidos, probs = c(0.25, 0.5, 0.75), na.rm = TRUE)
print(cuartiles)

pisa_2022 <- pisa_2022 %>%
  mutate(pct_desfavorecidos_grp = case_when(
         pct_desfavorecidos <= 8 ~ 1,
    8  < pct_desfavorecidos & pct_desfavorecidos <= 40 ~ 2,
    40 < pct_desfavorecidos & pct_desfavorecidos <= 75 ~ 3,
    75 < pct_desfavorecidos ~ 4,
    TRUE ~ 99))

pisa_2022 %>%
  select(pais, stem) %>%
  group_by(pais) %>%
  mutate(ms = sum(is.na(stem)),
         ans =  n(),
         porc_ans= (1-(ms/ans))*100)

#Puntaje de Matemática
library(dplyr)
library(survey)

pisa_2022 <- pisa_2022 %>%
  mutate(MATH_SCORE = rowMeans(across(matches("^PV.*MATH$")), na.rm = TRUE))

survey_design <- svydesign(ids = ~1, data = pisa_2022, weights = ~W_FSTUWT)

#muestra de puntajes por países
math_paises <- data.frame(
  CNT = paises,
  promedio_mate = sapply(paises, function(pais) {
    svymean(~MATH_SCORE, subset(survey_design, CNT == pais))[[1]]  # Extrae el valor numérico
  })
)
print(math_score)






