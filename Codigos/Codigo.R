############################# Codigo ###########################################

rm(list = ls())

# Librerias ----
#install.packages("dplyr")
library(haven)
library(dplyr)

# Bases de datos separadas ----
#setwd("C:/Users/externo.babarca/Desktop/PISA/")
setwd("C:/Users/USER/Desktop/brandon/PAPERS/RESEARCH ECONOMIC/BASES/")
#setwd("C:/Users/FabiyJose/OneDrive/Desktop/proyecto voluntariado/bases de datos/")


CY08MSP_STU_QQQ <- read_sas("CY08MSP_STU_QQQ.SAS7BDAT", NULL)

CY08MSP_SCH_QQQ <- read_sas("CY08MSP_SCH_QQQ.SAS7BDAT", NULL)

CY08MSP_TCH_QQQ <- read_sas("CY08MSP_TCH_QQQ.SAS7BDAT", NULL)


# Filtra durante la lectura (menos eficiente que Python para archivos muy grandes) ----
library(dplyr)
paises <- c("ARG", "BRA", "CHL", "COL", "CRI", "GTM", "MEX", "PAN", "PER", "PRY", "SLV", "URY")
#paises1 <- c("BRA", "COL", "CRI", "PAN", "PER")


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
         PV9MATH, PV10MATH, MATHEFF, MATHPERS, OCOD3, OCOD2, OCOD1, W_FSTUWT,SISCO,
         ESCS, ST019AQ01T, ST019BQ01T, ST019CQ01T)
#filter(CNT %in% paises)


school <- CY08MSP_SCH_QQQ %>%
  select(CNT, CNTSCHID, SC013Q01TA, SC016Q01TA, SC004Q02TA, SC004Q03TA, SC004Q07NA, SC211Q03JA,STRATIO, 
         SMRATIO, MCLSIZE, MTTRAIN, TEAFDBK, MACTIV, MATHEXC, ABGMATH)
#filter(CNT %in% paises)

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
         TC185Q15HA, TC185Q16HA, TC185Q18HA)
#filter(CNT %in% paises) #Hablar que en la base de datos teacher solo hay de LATAM los paises de "paises1"

# Juntar las tablas por ID de escuela y ID de pais (Revisar STATA) ----
library(haven)

write_dta(students, path = "students.dta")

write_dta(school, path = "school.dta")

write_dta(teacher, path = "teacher.dta")

#pisa_2022 <- read_dta("pisa_2022.dta")

pisa_2022 <- merge(school, students, by = "CNTSCHID", all.x = TRUE)

# Renombre de las variables ----

pisa_2022 <- pisa_2022 %>%
  rename(
    # Identificadores (comunes a todas las tablas)
    pais = CNT.x,
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
    
    # Ãndice socioeconÃ³mico
    falta_comida_dinero = ST258Q01JA,
    estatus_economico_actual = ST259Q01JA,
    estatus_economico_futuro = ST259Q02JA,
    pct_desfavorecidos = SC211Q03JA,
    
    # EducaciÃ³n padres
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
    
    # GÃ©nero
    genero = ST004D01T,
    
    # AutopercepciÃ³n y actitudes
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
    
    # MotivaciÃ³n y hÃ¡bitos de estudio
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
    
    # Ansiedad matemÃ¡ticas
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
    cond_migra = ST019AQ01T,
    cond_migra_mama = ST019BQ01T,
    cond_migra_papa = ST019CQ01T,
    
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
    
    # DesempeÃ±o matemÃ¡ticas
    #pv_math_1 = PV1MATH,
    #pv_math_2 = PV2MATH,
    #pv_math_3 = PV3MATH,
    #pv_math_4 = PV4MATH,
    #pv_math_5 = PV5MATH,
    #pv_math_6 = PV6MATH,
    #pv_math_7 = PV7MATH,
    #pv_math_8 = PV8MATH,
    #pv_math_9 = PV9MATH,
    #pv_math_10 = PV10MATH,
    autoeficacia_mate = MATHEFF,
    persistencia_mate = MATHPERS,
    
    # OcupaciÃ³n padres
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
    agrupacion_habilidad_mate = ABGMATH
  )

#   # Enfoque enseÃ±anza matemÃ¡ticas
#   enfoque_mundo_real = TC230Q01JA,
#   enfoque_estructura_logica = TC230Q02JA,
#   importancia_explicacion = TC230Q03JA,
#   problemas_dificiles = TC230Q07JA,
#   pocos_problemas_complejos = TC230Q08JA,
#   objetivo_logica = TC230Q09JA,
#   uso_tecnologia = TC230Q10JA,
#   creatividad_matematica = TC230Q11JA,
#   
#   # PrÃ¡cticas docentes - pensamiento matemÃ¡tico
#   fomento_pensamiento_mate_1 = TC227Q01JA,
#   fomento_pensamiento_mate_2 = TC227Q02JA,
#   fomento_pensamiento_mate_3 = TC227Q03JA,
#   fomento_pensamiento_mate_4 = TC227Q04JA,
#   fomento_pensamiento_mate_5 = TC227Q05JA,
#   fomento_pensamiento_mate_6 = TC227Q06JA,
#   fomento_pensamiento_mate_7 = TC227Q07JA,
#   fomento_pensamiento_mate_8 = TC227Q08JA,
#   fomento_pensamiento_mate_9 = TC227Q09JA,
#   
#   # PrÃ¡cticas docentes - razonamiento
#   explicacion_razonamiento_1 = TC228Q01JA,
#   explicacion_razonamiento_2 = TC228Q02JA,
#   explicacion_razonamiento_3 = TC228Q03JA,
#   explicacion_razonamiento_4 = TC228Q04JA,
#   explicacion_razonamiento_5 = TC228Q05JA,
#   explicacion_razonamiento_6 = TC228Q06JA,
#   explicacion_razonamiento_7 = TC228Q07JA,
#   explicacion_razonamiento_8 = TC228Q08JA,
#   explicacion_razonamiento_9 = TC228Q09JA,
#   
#   # Uso de tecnologÃ­a
#   uso_software_1 = TC169Q01HA,
#   uso_software_2 = TC169Q02HA,
#   uso_software_3 = TC169Q03HA,
#   uso_software_4 = TC169Q04HA,
#   uso_software_5 = TC169Q05HA,
#   uso_software_6 = TC169Q06HA,
#   uso_software_7 = TC169Q07HA,
#   uso_software_8 = TC169Q08HA,
#   uso_software_9 = TC169Q09HA,
#   uso_software_10 = TC169Q10HA,
#   uso_software_11 = TC169Q11HA,
#   uso_software_12 = TC169Q13HA,
#   uso_software_13 = TC169Q14HA,
#   uso_software_14 = TC169Q15JA,
#   
#   # Recursos digitales
#   recursos_digitales_1 = TC220Q02JA,
#   recursos_digitales_2 = TC220Q04JA,
#   recursos_digitales_3 = TC220Q06JA,
#   recursos_digitales_4 = TC220Q07JA,
#   recursos_digitales_5 = TC220Q08JA,
#   recursos_digitales_6 = TC220Q09JA,
#   recursos_digitales_7 = TC220Q10JA,
#   recursos_digitales_8 = TC220Q11JA,
#   recursos_digitales_9 = TC220Q12JA,
#   
#   # Desarrollo profesional
#   desarrollo_profesional_1 = TC185Q01HA,
#   desarrollo_profesional_2 = TC185Q02HA,
#   desarrollo_profesional_3 = TC185Q03HA,
#   desarrollo_profesional_4 = TC185Q04HA,
#   desarrollo_profesional_5 = TC185Q05HA,
#   desarrollo_profesional_6 = TC185Q06HA,
#   desarrollo_profesional_7 = TC185Q08HA,
#   desarrollo_profesional_8 = TC185Q09HA,
#   desarrollo_profesional_9 = TC185Q10HA,
#   desarrollo_profesional_10 = TC185Q14HA,
#   desarrollo_profesional_11 = TC185Q15HA,
#   desarrollo_profesional_12 = TC185Q16HA,
#   desarrollo_profesional_13 = TC185Q18HA
# )

# Crear la columna para expectativas de ejercicio profesional en carreras stem ----

#Estudiante (9997 -> N/A, 9998 -> InvÃ¡lido, 9999 -> Missing)
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
table(pisa_2022$stem, useNA = "ifany")

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
#24: Profesionales de negocios y administraciÃ³n
#2631: Ciencias sociales

sum(pisa_2022$stem_madre, na.rm = TRUE)


# Recodificar las variables que sean necesarias recodificar
cuartiles <- pisa_2022 %>%
  filter(pais %in% paises) %>%
  pull(pct_desfavorecidos) %>%  # Extrae la columna numérica
  quantile(probs = c(0.25, 0.5, 0.75), na.rm = TRUE)
print(cuartiles)

pisa_2022 <- pisa_2022 %>%
  mutate(pct_desfavorecidos_grp = case_when(
    pct_desfavorecidos <= 9 ~ 1,
    9  < pct_desfavorecidos & pct_desfavorecidos <= 35 ~ 2,
    35 < pct_desfavorecidos & pct_desfavorecidos <= 70 ~ 3,
    70 < pct_desfavorecidos ~ 4,
    TRUE ~ 99))

pisa_2022 %>%
  select(pais, stem) %>%
  group_by(pais) %>%
  mutate(ms = sum(is.na(stem)),
         ans =  n(),
         porc_ans= (1-(ms/ans))*100)

#Idea clara del trabajo futuro
library(tidyr)
trabajo_futuro <- pisa_2022 %>%
  group_by(pais,SISCO) %>%
  summarise(count=n(), .grouos = 'drop')

trabajo_futuro <- trabajo_futuro %>%
  pivot_wider(names_from = SISCO, values_from = count, values_fill = 0)
print(trabajo_futuro)

#Expectativa STEM
library(tidyr)
prueba <- pisa_2022 %>%
  group_by(pais,stem) %>%
  summarise(count=n(), .grouos = 'drop')

prueba <- prueba %>%
  pivot_wider(names_from = stem, values_from = count, values_fill = 0)
print(prueba)

table(pisa_2022$stem,useNA = "ifany")

# Puntaje de MatemÃ¡tica
library(dplyr)
library(survey)

pisa_2022 <- pisa_2022 %>%
  mutate(MATH_SCORE = rowMeans(across(matches("^PV.*MATH$")), na.rm = TRUE))

# DiseÃ±o muestral general
survey_design <- svydesign(ids = ~1, data = pisa_2022, weights = ~W_FSTUWT)

# Calcular promedio de MATH_SCORE por paÃ­s
math_score <- data.frame(
  pais = paises,
  promedio_mate = sapply(paises, function(pais_i) {
    # Filtrar el diseÃ±o muestral por paÃ­s
    svymean(~MATH_SCORE, subset(survey_design, pisa_2022$pais == pais_i))[[1]]
  })
)

print(math_score)

# Variables ----
#AspiraciÃ³n a una carrera stem: stem
#Nivel educativo de los padres: educacion_madre, educacion_padre
#Ãndice socio-econÃ³mico: ESCS
#Financiamiento de la escuela: tipo_escuela
#Acceso a recursos en el hogar:falta_comida_dinero, habitacion_propia, internet_hogar, banos, 
#GÃ©nero: genero
#CondiciÃ³n migratoria: cond_migra, cond_migra_mama, cond_migra_papa
#matematica_facil, matematica_favorita, 

#RecodificaciÃ³n y creaciÃ³n de variables
paper_corto <- pisa_2022 %>%
  filter(pais %in% paises)

table(paper_corto$pais,useNA = "ifany")
table(paper_corto$SISCO,useNA = "ifany")
table(paper_corto$stem,useNA = "ifany")
table(paper_corto$ESCS,useNA = "ifany")

#EducaciÃ³n:
#1= <ISCED level 3A> = educaciÃ³n secundaria (bachillerato o preparatoria)
#2= <ISCED level 3B, 3C> = educaciÃ³n secundaria superior con orientaciÃ³n tÃ©cnica (programas tÃ©cnicos luego de la secundaria bÃ¡sica)
#3= <ISCED level 2> = educaciÃ³n secundaria bÃ¡sica o primer ciclo de secundaria (media inferior o secundaria obligatoria)
#4= <ISCED level 1> = educaciÃ³n primaria o bÃ¡sica
#5= <no completÃ³ ISCED level 1> = no completÃ³ educaicÃ³n primaria
#6= NA = No aplica
table(paper_corto$educacion_madre,useNA = "ifany")
table(paper_corto$educacion_padre,useNA = "ifany")

paper_corto$padre_tecnica <- ifelse(paper_corto$educacion_padre %in% c(2), 1, 0)
paper_corto$padre_secundaria <- ifelse(paper_corto$educacion_padre %in% c(1), 1, 0)
paper_corto$padre_basica <- ifelse(paper_corto$educacion_padre %in% c(3), 1, 0)
paper_corto$padre_primaria <- ifelse(paper_corto$educacion_padre %in% c(4), 1, 0)
paper_corto$padre_incompelta <- ifelse(paper_corto$educacion_padre %in% c(5), 1, 0)

paper_corto$madre_tecnica <- ifelse(paper_corto$educacion_madre %in% c(2), 1, 0)
paper_corto$madre_secundaria <- ifelse(paper_corto$educacion_madre %in% c(1), 1, 0)
paper_corto$madre_basica <- ifelse(paper_corto$educacion_madre %in% c(3), 1, 0)
paper_corto$madre_primaria <- ifelse(paper_corto$educacion_madre %in% c(4), 1, 0)
paper_corto$madre_incompelta <- ifelse(paper_corto$educacion_madre %in% c(5), 1, 0)

#Graficos y estadisticas descriptivas ----
#EstadÃ­sticas descriptivas

#Tipo de escuela (1=privada, 0=publica)
table(paper_corto$tipo_escuela,useNA = "ifany")
paper_corto$tipo_escuela <- ifelse(paper_corto$tipo_escuela %in% c(2), 1, 0)

#Falta comida en el hogar
#1=nunca o casi nunca, 2=Alrededor de una vez a la semana, 3=2 a 3 veces por semana
#4=4 a 5 veces por semana, 5=todos o casi todos los dÃ­as, NA=Missing
table(paper_corto$falta_comida_dinero,useNA = "ifany")
paper_corto$falta_comida_dinero <- ifelse(paper_corto$falta_comida_dinero %in% c(2,3,4,5), 1, 0)

#HabitaciÃ³n propia
#1=Si, 0=No, NA=Missing
table(paper_corto$habitacion_propia,useNA = "ifany")
paper_corto$habitacion_propia <- ifelse(paper_corto$habitacion_propia %in% c(1), 1, 0)

#Internet en el hogar
#1=Si, 0=No, NA=Missing
table(paper_corto$internet_hogar,useNA = "ifany")
paper_corto$internet_hogar <- ifelse(paper_corto$internet_hogar %in% c(1), 1, 0)

#Banos
#0=Ninguno, 1=Uno, 2=Dos, 3=Tres o mÃ¡s, NA=Missing
table(paper_corto$banos,useNA = "ifany")
paper_corto$banos <- ifelse(paper_corto$banos %in% c(1), 0, paper_corto$banos)
paper_corto$banos <- ifelse(paper_corto$banos %in% c(2), 1, paper_corto$banos)
paper_corto$banos <- ifelse(paper_corto$banos %in% c(3), 2, paper_corto$banos)
paper_corto$banos <- ifelse(paper_corto$banos %in% c(4), 3, paper_corto$banos)

#Genero
#0=Mujer, 1=Hombre, NA=Missing
table(paper_corto$genero,useNA = "ifany")
paper_corto$genero <- ifelse(paper_corto$genero %in% c(2), 1, 0)

#CondiciÃ³n migratoria (estudiante)
#1=PaÃ­s del test, 0=Otro paÃ­s, 3=No lo sabe, NA=Missing
table(paper_corto$cond_migra,useNA = "ifany")
paper_corto$cond_migra <- ifelse(paper_corto$cond_migra %in% c(1), 1, 0)

#CondiciÃ³n migratoria (MamÃ¡)
#1=PaÃ­s del test, 0=Otro paÃ­s, 3=No lo sabe, NA=Missing
table(paper_corto$cond_migra_mama,useNA = "ifany")
paper_corto$cond_migra_mama <- ifelse(paper_corto$cond_migra_mama %in% c(1), 1, 0)

#CondiciÃ³n migratoria (PapÃ¡)
#1=PaÃ­s del test, 2=Otro paÃ­s, 3=No lo sabe, NA=Missing
table(paper_corto$cond_migra_papa,useNA = "ifany")
paper_corto$cond_migra_papa <- ifelse(paper_corto$cond_migra_papa %in% c(1), 1, 0)

#MatemÃ¡tica es fÃ¡cil para mi
#1=Totalmente en desacuerdo, 2=En desacuerdo, 3=De acuerdo, 4=Totalmente de acuerdo, NA=Missing
#1=De acuerdo, 0=En desacuerdo
table(paper_corto$matematica_facil,useNA = "ifany")
paper_corto$matematica_facil <- ifelse(paper_corto$matematica_facil %in% c(4,3), 1, 0)

#MatemÃ¡tica es uno de mis cursos favoritos
#1=Totalmente en desacuerdo, 2=En desacuerdo, 3=De acuerdo, 4=Totalmente de acuerdo, NA=Missing
#1=De acuerdo, 0=En desacuerdo
table(paper_corto$matematica_favorita,useNA = "ifany")
paper_corto$matematica_favorita <- ifelse(paper_corto$matematica_favorita %in% c(4,3), 1, 0)

#Software Educativo
#1=Si , 0=No
table(paper_corto$software_educativo,useNA = "ifany")
paper_corto$software_educativo <- ifelse(paper_corto$software_educativo %in% c(1),1,0)

#GrÃ¡ficos

#Patrimonio medio por estudiante y principales paices de estudio
survey_design_sin_na <- subset(
  survey_design, 
  !is.na(ESCS) & !is.na(W_FSTUWT)
)

por_pais <- svyby(~ESCS, ~pais, survey_design_sin_na, svymean) %>% 
  as.data.frame()


OCDE <- svymean(~ESCS, design = survey_design_sin_na) %>%
  as.data.frame() %>%
  tibble::rownames_to_column("variable") %>%                                 # Convertir el nombre de fila en columna
  mutate(variable = "OCDE") %>%                                              # Cambiar "ESCS" por "OCDE"
  rename(pais = variable, ESCS = mean, se = ESCS)                      # Renombrar la columna mean


paises_graficos <- c("ARG", "BRA", "CHL", "COL", "CRI", "GTM", "MEX", "PAN", "PER", 
                     "PRY", "SLV", "URY", "GBR","AUS","ESP","DEU","FRA","GRC","SWE",
                     "NLD","ITA","TUR","USA", "CAN", "OCDE")

LATAM <- c("ARG", "BRA", "CHL", "COL", "CRI", "GTM", 
           "MEX", "PAN", "PER", "PRY", "SLV", "URY")

grafico_data <- rbind(por_pais, OCDE) %>%
  filter(pais %in% paises_graficos) %>%
  mutate(grupo = case_when(
    pais == "OCDE" ~ "OCDE",
    pais %in% LATAM ~ "Latin America",
    TRUE ~ "Other countries"
  ))


library(ggplot2)

ggplot(grafico_data, aes(x = reorder(pais, -ESCS), y = ESCS, fill = grupo)) +
  geom_col() +
  scale_fill_manual(
    values = c("OCDE" = "red", 
               "Latin America" = "green3", 
               "Other countries" = "steelblue"),
    name = "Region") +
  labs(x = "Countries", y = "Average wealth",title = "Average student wealth by country" ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
    panel.grid.major = element_blank(),  # Elimina lÃ­neas de cuadrÃ­cula principales
    panel.grid.minor = element_blank(),  # Elimina lÃ­neas de cuadrÃ­cula secundarias
    panel.background = element_blank(),  # Fondo completamente blanco
    plot.background = element_blank(),    # Fondo del Ã¡rea del grÃ¡fico blanco
    plot.title = element_text(  # Especificaciones para centrar
      hjust = 0.5,              # Centrado horizontal (0.5 = centro)
      size = 14,                # TamaÃ±o de fuente
      face = "bold",            # Negrita
      margin = margin(b = 10)   # Margen inferior
    )
  )

#Cantidad de estudiantes por paÃ­s y gÃ©nero
paper_corto %>%
  select(pais, genero) %>%
  group_by(pais, genero) %>%
  summarise(cuenta = n(), .groups = "drop") %>%
  pivot_wider(names_from = genero, values_from = cuenta, names_prefix = "genero_") %>%
  arrange(desc(genero_0 + genero_1)) %>%
  print()

#Nivel de riqueza por paÃ­s
ggplot(paper_corto, aes(x = reorder(pais, -ESCS), y = ESCS)) +
  stat_summary(fun = mean, geom = "bar", fill = "skyblue") +
  stat_summary(fun = mean, geom = "text", aes(label = round(..y.., 1)), vjust = -0.5, size = 3) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  ggtitle("Ranking de paÃ­ses por nivel de riqueza (ascendente)") +
  xlab("PaÃ­s") +
  ylab("Media de la Riqueza")

ggplot(paper_corto, aes(x = reorder(pais, ESCS), y = ESCS, fill = as.factor(genero))) +
  stat_summary(fun = mean, geom = "bar", position = position_dodge(width = 0.9)) +
  stat_summary(fun = mean, geom = "text",
               aes(label = round(..y.., 1)),
               position = position_dodge(width = 0.9),
               vjust = -0.5, size = 3) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  ggtitle("Average student wealth by country and gender") +
  xlab("Country") +
  ylab("Average wealth") +
  scale_fill_manual(values = c("steelblue", "salmon"),
                    labels = c("Male", "Female"),
                    name = "Gender")

#Densidad por gÃ©nero
ggplot(paper_corto, aes(x = MATH_SCORE, fill = as.factor(genero), group = genero)) +
  geom_density(alpha = 0.6) +
  scale_fill_manual(values = c("steelblue", "salmon"),
                    labels = c("Male", "Female"),
                    name = "Genero") +
  ggtitle("Math score distribution by gender") +
  xlab("Math Score") +
  ylab("Density") +
  facet_wrap(. ~ pais)

# correlaciones ----

library(psych)
vars <- c("stem","madre_incompelta","padre_incompelta","ESCS","genero",
          "falta_comida_dinero", "habitacion_propia","internet_hogar","banos","matematica_facil",
          "matematica_favorita","estatus_economico_actual","estatus_economico_futuro",
          "vehiculos","software_educativo")

paper_corto <- paper_corto %>%
  select(all_of(vars), W_FSTUWT, id_estudiante) %>%
  na.omit()

survey_design_corr <- svydesign(ids = ~1, data = paper_corto, weights = ~W_FSTUWT)

svycor <- function(design, variables, method = "spearman") {
  # Extraer datos y verificar
  data <- design$variables[, variables, drop = FALSE]
  
  # Convertir a numÃ©rico
  data <- data %>% mutate(across(everything(), as.numeric))
  
  # Manejar casos con NA
  complete_cases <- complete.cases(data)
  data <- data[complete_cases, ]
  weights <- weights(design)[complete_cases]
  
  if(nrow(data) == 0) stop("No hay datos completos despuÃ©s de eliminar NA")
  
  # CÃ¡lculo de correlaciÃ³n
  if(method == "spearman") {
    data <- apply(data, 2, rank)
  }
  
  cor_matrix <- cov.wt(data, wt = weights, cor = TRUE)$cor
  colnames(cor_matrix) <- rownames(cor_matrix) <- variables
  
  return(cor_matrix)
}

# 3. Calcular correlaciones ponderadas
cor_ponderada <- svycor(survey_design_corr, vars, method = "spearman")

# 4. VisualizaciÃ³n
tabla_correlaciones <- as.data.frame(cor_ponderada)
tabla_correlaciones

library(reshape2)
library(ggplot2)
cor_long <- melt(cor_ponderada)

# Crear el grÃ¡fico de calor
ggplot(cor_long, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile(color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1, 1), space = "Lab",
                       name = "Spearman Correlation") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1),
    axis.title = element_blank()
  ) +
  coord_fixed() +
  labs(title = "Correlation Matrix")

#Exporto base de datos para regresión en Stata
write_dta(paper_corto, "paper_corto.dta")

## REGRESIÓN EN STATA ----
#//RESULTADOS DEL MODELO
#clear all
#cd "C:\Users\USER\Desktop\brandon\PAPERS\RESEARCH ECONOMIC\BASES"
#use paper_corto.dta

#***Estimamos el modelo considerando factor de ajuste
#gen peso=W_FSTUWT

#logit stem madre_incompelta padre_incompelta ESCS genero falta_comida_dinero habitacion_propia internet_hogar banos matematica_facil matematica_favorita estatus_economico_actual estatus_economico_futuro vehiculos software_educativo [pw=peso]
#**En los resultados encontramos coherencia en los signos de los coeficientes, 
#**excepto para acceso al servicio de agua y electricidad.  

#**Bondad de ajuste por pseudo R2
#fitstat

#**Evaluacion de la bondad de ajuste por clasificacion
#logit stem madre_incompelta padre_incompelta ESCS genero falta_comida_dinero habitacion_propia internet_hogar banos matematica_facil matematica_favorita estatus_economico_actual estatus_economico_futuro vehiculos software_educativo [iw=peso]
#*estat gof, group(10) table	/*Estadístico de Hosmer y Lemeshow*/
#lsens stem, genprob(cutoff_p) gensens(sensitivity) genspec(specificity)
#lroc

#**Eleccion del punto de corte optimo
#gen float youden_index = sensitivity + specificity - 1
#egen float max = max(youden_index)	/*El punto de corte optimo sera 23.58%*/
#list cutoff_p sensitivity specificity youden_index if youden_index== max
#drop cutoff_p sensitivity specificity youden_index max

#**Análisis de odd ratio
#logit stem madre_incompelta padre_incompelta ESCS genero falta_comida_dinero habitacion_propia internet_hogar banos matematica_facil matematica_favorita estatus_economico_actual estatus_economico_futuro vehiculos software_educativo [pw=peso]
#listcoef, help

#**Efectos marginales
#prchange


#Regresion logistica ----
#RegresiÃ³n muestral
library(mfx)

logit <- glm(formula = stem ~ madre_incompelta+padre_incompelta+ESCS+genero+falta_comida_dinero+
             habitacion_propia+internet_hogar+banos+matematica_facil+matematica_favorita+
             estatus_economico_actual+estatus_economico_futuro+vehiculos+software_educativo, 
             family = "binomial", data = paper_corto)
summary(logit)

#install.packages("stargazer")
library(stargazer)
stargazer(logit, type="text")

#Efectos muestrales
library(mfx)
logitmfx <- logitmfx(formula = stem ~ madre_incompelta+padre_incompelta+ESCS+genero+falta_comida_dinero+
                     habitacion_propia+internet_hogar+banos+matematica_facil+matematica_favorita+
                     estatus_economico_actual+estatus_economico_futuro+vehiculos+software_educativo, 
                     data = paper_corto)
logitmfx

#Odds ratio
cbind(Estimate=round(coef(logit),5),
      OR=round(exp(coef(logit)),5))

#Bondad de ajuste
#install.packages("pscl")
library(pscl)

pR2(logit)[["McFadden"]]

#Criterios de informaciÃ³n
AIC(logit)
BIC(logit)

#ProyecciÃ³n de probabilidades
prlogit=predict(logit,type="response")
summary(logit)

#Crear una data de las predicciones de las probabilidades
probabilidades<-cbind (logit)
probabilidades

#========ESTIMACIÃN POBLACIONAL
#DiseÃ±amos el factor poblacional--------------------------------------------

facpob <- paper_corto$W_FSTUWT # factor de expansiÃ³n

##3. DeclaraciÃ³n del diseÃ±o muestral--------------------------------------------
#install.packages("survey")
library(survey)

diseno <- svydesign(id=~id_estudiante, weight=~W_FSTUWT, data=paper_corto, nest=TRUE)

#EstimaciÃ³n logit con factor --------------------------------------------------

logit_pob <- 
  svyglm(stem ~ madre_incompelta+padre_incompelta+ESCS+genero+falta_comida_dinero+
           habitacion_propia+internet_hogar+banos+matematica_facil+matematica_favorita+
           estatus_economico_actual+estatus_economico_futuro+vehiculos+software_educativo, 
         family = binomial(link = "logit"),
         design = diseno, data = paper_corto)
summary(logit_pob)

#install.packages("stargazer")
library(stargazer)
stargazer(logit_pob, type="text")

#EFECTOS MARGINALES-------------------------------------------------
#Efecto marginal con factor-----------------------------------------------------
install.packages("margins")
library(margins)

margins(logit_pob,design = diseno)
summary(margins(logit_pob,design = diseno))

#BONDAD DE AJUSTE---------------------------------
#Con factor--------------------
#install.packages("jtools")
library(jtools)

summary(logit_pob)

#PROYECCIÃN DE PROBABILIDADES-------------------------------------------
prlogitpob=predict(logit_pob,type="response")
prlogitpob

head(prlogitpob)

summary(prlogitpob)

#METRICAS DEL MODELO ----
#Resumen del modelo
resumen <- summary(logit_pob);resumen

#Odds ratio
odds_ratio1 <- exp(modelo$coefficients);inicio <- Sys.time()
intervalos_confianza1 <- exp(confint(resumen));fin <- Sys.time();fin - inicio

resultados1 <- data.frame("Odds Ratio" = odds_ratio1, "IC 2.5%" = intervalos_confianza1[, 1], "IC 97.5%" = intervalos_confianza1[, 2])
print(resultados1)

#Evaluación de capacidad predictiva
fitted.results2 <- predict(logit_pob, newdata = paper_corto, type = 'response')
fitted.results2 <- ifelse(fitted.results2 >= 0.5, 1, 0)

misClasificError2 <- mean(fitted.results2 != paper_corto$stem)
print(paste('Accuracy', round(1 - misClasificError2, digits = 3)))

#Matriz de confusion
install.packages("caret")
install.packages("vcd")
library(caret)
library(ggplot2)
library(vcd)

fitted.results2 <- as.factor(fitted.results2)
paper_corto$stem <- as.factor(paper_corto$stem)

confusionMatrix(data = fitted.results2, reference = paper_corto$stem, positive = "1")

matriz_confusion1 <- table(paper_corto$stem, fitted.results2, dnn = c("Real", "Predicción"))
rownames(matriz_confusion1) <- c("NO STEM", "STEM")
colnames(matriz_confusion1) <- c("NO STEM", "STEM")

mosaic(matriz_confusion1, shade = TRUE, colorize = TRUE, gp = gpar(fill = matrix(c("skyblue", "darkblue", "darkblue", "skyblue"), 2, 2)),pop=TRUE)

matriz_ajustada <- log1p(matriz_confusion1)  # Aplicar logaritmo para reducir diferencias
mosaic(matriz_ajustada, 
       shade = TRUE, 
       colorize = TRUE, 
       gp = gpar(fill = matrix(c("skyblue", "darkblue", "darkblue", "skyblue"), 2, 2)))

#Curva ROC
#install.packages("ROCR")
library(ROCR)
p1 <- predict(logit_pob, newdata = paper_corto, type = "response")
p1 <- as.numeric(p1)
pr1 <- prediction(p1, paper_corto$stem)
prf1 <- performance(pr1, measure = "tpr", x.measure = "fpr")
plot(prf1)

#AUC
auc1 <- performance(pr1, measure = "auc")
auc1 <- auc1@y.values[[1]]
print(auc1)
