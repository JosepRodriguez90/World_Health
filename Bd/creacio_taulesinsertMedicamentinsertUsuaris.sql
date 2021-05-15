SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE IF NOT EXISTS `usuari` (
  `id_usuari` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id taula autoincrementada',
  `nom` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nom de la persona',
  `cognom` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Cognom de la persona',
  `telefon` int(13) NOT NULL COMMENT 'Telefon ',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Correu electronic',
  `dni` varchar(9) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'DNI del usuari',
  `contrasenya` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Contrasenya de usuari',
  `num_colegiat` int(9) NOT NULL COMMENT 'Numero de colegiat de usuari',
  `altres` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Informacio de usuari',
  PRIMARY KEY (`id_usuari`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `medicaments` (
  `id_medicament` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del medicament',
  `composicio` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Composicio del medicament',
  `nom` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nom del medicament',
  `codi_barres` varchar(19) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Codi de barres del medicament',
  `comentaris` varchar(2000) CHARACTER SET utf32 COLLATE utf32_spanish_ci NOT NULL COMMENT 'Comentari del medicament',
  PRIMARY KEY (`id_medicament`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `efectes_secundaris` (
  
  `id_efectes` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del efecte secundari',
  `descripcio` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Descripcio del efecte secundari',
  `id_medicament` int(11) NOT NULL,
  FOREIGN KEY ( `id_medicament`) REFERENCES `medicaments`( `id_medicament`),
  PRIMARY KEY (`id_efectes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `forma_farmaceutica` (
  `id_forma` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la forma farmaceutica',
  `descripcio` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Descripcio de la forma farmaceutica',
  `id_medicament` int(11) NOT NULL,
  FOREIGN KEY ( `id_medicament`) REFERENCES `medicaments`( `id_medicament`),
  PRIMARY KEY (`id_forma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `laboratori` (
  `id_laboratori` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del laboratori',
  `descripcio` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Descripcio del laboratori',
  `nom` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nom del laboratori',
  `id_medicament` int(11) NOT NULL,
  FOREIGN KEY ( `id_medicament`) REFERENCES `medicaments`( `id_medicament`),
  PRIMARY KEY (`id_laboratori`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `patologia` (
  `id_patologia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la patologia',
  `descripcio` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Descripcio de la patologia',
  `id_medicament` int(11) NOT NULL,
  FOREIGN KEY ( `id_medicament`) REFERENCES `medicaments`( `id_medicament`),
  PRIMARY KEY (`id_patologia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



CREATE TABLE IF NOT EXISTS `simptomatologia` (
  `id_simptomatologia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la simptomatologia',
  `descripcio` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Descripcio de la simptomatologia',
  `id_medicament` int(11) NOT NULL,
  FOREIGN KEY ( `id_medicament`) REFERENCES `medicaments`( `id_medicament`),
  PRIMARY KEY (`id_simptomatologia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `arbol` 
  ( nodo int NOT NULL, texto varchar (500), pregunta BOOLEAN, 
  PRIMARY KEY (nodo) 
);


-- Inserts


INSERT INTO medicaments (
  composicio,
  nom,
  codi_barres,
  comentaris
  )
VALUES (
  'El principio activo es aripiprazol.
   Cada ml contiene 1 mg de aripiprazol.
   Los demás componentes son edetato disódico,
   fructosa, glicerina, ácido láctico, parahidroxibenzoato de metilo (E 218),
   propilenglicol, parahidroxibenzoato de propilo (E 216), hidróxido sódico,
   sacarosa, agua purificada, y sabor naranja.',
  'ABILIFY solución oral 150ml',
  '8470006527382',
  'Vía oral: se deben tomar los comprimidos bucodispersables o
	la solución oral como una alternativa a los comprimidos en 
	pacientes que tengan dificultad para tragar. El comprimido 
	bucodispersable se debe introducir en la boca, sobre la lengua, 
	donde rápidamente se dispersará con la saliva. Se puede tomar con o sin líquido. 
	Se puede es disolver en agua y beber la suspensión resultante.
   Vía parenteral:
   - liberación normal: se administra por vía IM. Con el fin de aumentar 
	la absorción y minimizar la variabilidad, se recomienda realizar la inyección 
	en el deltoides o en el músculo glúteo mayor evitando zonas adiposas.
   - liberación prolongada: únicamente por vía IM La suspensión se debe inyectar 
	inmediatamente después de ser reconstituida, pero puede conservarse en el vial 
	a una temperatura inferior a 25 ºC durante 4 horas. La suspensión se debe inyectar 
	lentamente en el glúteo o el deltoides, en una única administración.'
);
INSERT INTO efectes_secundaris (
    descripcio,
    id_medicament
)
VALUES (
    'diabetes mellitus,problemas para dormir,ansiedad,temblor,cansancio,mareo',
    1
);
INSERT INTO forma_farmaceutica (
    descripcio,
    id_medicament
)
VALUES (
    'liquid',
    1
);
INSERT INTO laboratori (
    descripcio,
    nom,
    id_medicament
)
VALUES (
    '2881 Route des Crêtes, 06904 Sophia Antipolis, França',
    'Elaiapharm',
    1
);
INSERT INTO patologia (
    descripcio,
    id_medicament
)
VALUES (
    'esquizofrenia',
    1
);
INSERT INTO simptomatologia (
    descripcio,
    id_medicament
)
VALUES (
    'Se utiliza para tratar adultos y adolescentes de 15 años o más que padecen una 
    enfermedad caracterizada por síntomas tales como oír, ver y sentir cosas que no existen, 
    desconfianza, creencias erróneas, habla incoherente y monotonía emocional y de 
    comportamiento. Las personas en este estado pueden también sentirse deprimidas, 
    culpables, inquietas o tensas.',
    1
);



INSERT INTO medicaments (
  composicio,
  nom,
  codi_barres,
  comentaris
  )
VALUES (
  'El principio activo es aripiprazol.
   Cada ml contiene 1 mg de aripiprazol.
   Los demás componentes son edetato disódico,
   fructosa, glicerina, ácido láctico, parahidroxibenzoato de metilo (E 218),
   propilenglicol, parahidroxibenzoato de propilo (E 216), hidróxido sódico,
   sacarosa, agua purificada, y sabor naranja.',
  'ABILIFY solución oral 480ml',
  '8470006527399',
  'Vía oral: se deben tomar los comprimidos bucodispersables o
	la solución oral como una alternativa a los comprimidos en 
	pacientes que tengan dificultad para tragar. El comprimido 
	bucodispersable se debe introducir en la boca, sobre la lengua, 
	donde rápidamente se dispersará con la saliva. Se puede tomar con o sin líquido. 
	Se puede es disolver en agua y beber la suspensión resultante.
   Vía parenteral:
   - liberación normal: se administra por vía IM. Con el fin de aumentar 
	la absorción y minimizar la variabilidad, se recomienda realizar la inyección 
	en el deltoides o en el músculo glúteo mayor evitando zonas adiposas.
   - liberación prolongada: únicamente por vía IM La suspensión se debe inyectar 
	inmediatamente después de ser reconstituida, pero puede conservarse en el vial 
	a una temperatura inferior a 25 ºC durante 4 horas. La suspensión se debe inyectar 
	lentamente en el glúteo o el deltoides, en una única administración.'
);
INSERT INTO efectes_secundaris (
    descripcio,
    id_medicament
)
VALUES (
    'diabetes mellitus,problemas para dormir,ansiedad,temblor,cansancio,mareo',
    2
);
INSERT INTO forma_farmaceutica (
    descripcio,
    id_medicament
)
VALUES (
    'liquid',
    2
);
INSERT INTO laboratori (
    descripcio,
    nom,
    id_medicament
)
VALUES (
    '2881 Route des Crêtes, 06904 Sophia Antipolis, França',
    'Elaiapharm',
    2
);
INSERT INTO patologia (
    descripcio,
    id_medicament
)
VALUES (
    'esquizofrenia',
    2
);
INSERT INTO simptomatologia (
    descripcio,
    id_medicament
)
VALUES (
    'Se utiliza para tratar adultos y adolescentes de 15 años o más que padecen una 
    enfermedad caracterizada por síntomas tales como oír, ver y sentir cosas que no existen, 
    desconfianza, creencias erróneas, habla incoherente y monotonía emocional y de 
    comportamiento. Las personas en este estado pueden también sentirse deprimidas, 
    culpables, inquietas o tensas.',
    2
);



INSERT INTO medicaments (
  composicio,
  nom,
  codi_barres,
  comentaris
  )
VALUES (
  'El principio activo es sonidegib (como fosfato). Cada cápsula contiene 200 mg de sonidegib.
   Los demás componentes son:
   Contenido de la cápsula: crospovidona de tipo A, lactosa monohidrato (ver sección 2, “Odomzo contiene lactosa”), estearato de magnesio, poloxámero 188, sílice coloidal anhidra, laurilsulfato de sodio.
   Cubierta de la cápsula: gelatina, óxido de hierro rojo (E172), dióxido de titanio (E171).
   Tinta de impresión: óxido de hierro negro (E172), propilenglicol (E1520), shellac.',
  'ODOMZO Cáps. dura 200 mg',
  '8470007235705',
  'Vía oral. Las cápsulas deben tragarse enteras. No se deben masticar ni triturar. 
  No se deben abrir las cápsulas debido al riesgo de teratogenicidad. Tomar como mínimo 
  dos horas después de una comida y al menos una hora antes de la siguiente comida para 
  prevenir el aumento del riesgo de aparición de acontecimientos adversos debidos a una mayor 
  exposición de sonidegib cuando se toma con comidas. Si se producen vómitos durante el 
  curso del tratamiento, no se permite una redosificación del paciente antes de la 
  siguiente dosis prescrita. Si se olvida una dosis, se la debe tomar tan pronto como se 
  dé cuenta, a no ser que hayan transcurrido más de seis horas desde la hora establecida; 
  en este caso, el paciente se debe esperar y tomar la siguiente dosis prescrita.'
);
INSERT INTO efectes_secundaris (
    descripcio,
    id_medicament
)
VALUES (
    'dificultad para respirar o tragar,hinchazón de la cara,labios, lengua o garganta,picor grave de la piel,con una erupción de color rojo o protuberancias.',
    3
);
INSERT INTO forma_farmaceutica (
    descripcio,
    id_medicament
)
VALUES (
    'solid',
    3
);
INSERT INTO laboratori (
    descripcio,
    nom,
    id_medicament
)
VALUES (
    'Polarisavenue 87, 2132 JH Hoofddorp, Països Baixos',
    'Sun Pharmaceutical Industries Europe B.V.',
    3
);
INSERT INTO patologia (
    descripcio,
    id_medicament
)
VALUES (
    'cáncer',
    3
);
INSERT INTO simptomatologia (
    descripcio,
    id_medicament
)
VALUES (
    'Odomzo se utiliza para tratar a los adultos con un tipo de cáncer de piel denominado 
    carcinoma basocelular. Se utiliza cuando el cáncer se ha extendido a nivel local y 
    no puede ser tratado con cirugía o radiación.',
    3
);


  INSERT INTO medicaments (
  composicio,
  nom,
  codi_barres,
  comentaris
  )
VALUES (
  'El principio activo es ibuprofeno. Cada  ml de suspensión oral contiene 20 mg de ibuprofeno.
   Los demás componentes (excipientes) son: glicerol (E-422), jarabe de maltitol (E-965), 
   celulosa microcristalina, goma xantana, ácido cítrico anhidro, citrato sódico, benzoato 
   sódico (E-211), polisorbato 80, sacarina sódica, esencia de naranja y agua purificada.',
  'IBUPROFENO ALDO-UNIÓN Susp. oral 200ml',
  '8470006534045',
  'Siga exactamente las instrucciones de administración de este medicamento indicadas por su médico o farmacéutico. En caso de duda, consulte  de nuevo a su médico o farmacéutico.
   Se debe utilizar la dosis eficaz más baja durante el menor tiempo necesario para aliviar los síntomas. Si tiene una infección, consulte sin demora a un médico si los síntomas (como fiebre y dolor) persisten o empeoran (ver sección 2).
   Recuerde tomar su medicamento.
   Su médico le indicará la duración del tratamiento con Ibuprofeno Aldo-Unión. No suspenda el tratamiento antes, ya que entonces no se obtendrían los resultados esperados. Del mismo modo tampoco emplee este medicamento más tiempo del indicado por su médico.
   Ibuprofeno Aldo-Unión es una suspensión para la administración por vía oral.
   Instrucciones de uso:
   Para una dosificación exacta, el envase contiene una jeringa oral graduada de 5 ml. Primero debe agitar la suspensión, luego el dosificador se introduce en el tapón perforado, se invierte el frasco, se tira del émbolo hasta que el líquido alcance la cantidad prescrita por el médico, se vuelve el frasco a su posición inicial y se retira el dosificador.
   La jeringa deberá limpiarse y secarse después de cada uso.
   Si tiene el estómago sensible, tome el medicamento con las comidas.'
);
INSERT INTO efectes_secundaris (
    descripcio,
    id_medicament
)
VALUES (
    'Gastrointestinales:

Los efectos adversos más frecuentes que ocurren con los medicamentos como Ibuprofeno son los gastrointestinales: úlceras pépticas, hemorragias digestivas, perforaciones (en algunos casos mortales), especialmente en pacientes de edad avanzada. También se han observado náuseas, vómitos, diarrea, flatulencia, estreñimiento, ardor de estómago, dolor abdominal, sangre en heces, aftas bucales, empeoramiento de colitis ulcerosa y enfermedad de Crohn ((enfermedad crónica en la que el sistema inmune ataca el intestino provocando inflamación que produce generalmente diarrea con sangre).

Menos frecuentemente se ha observado la aparición de gastritis.

Raros: inflamación del esófago, estrechamiento del esófago (estenosis esofágica), exacerbación de enfermedad de los divertículos intestinales, colitis hemorrágica inespecífica (gastroenteritis que cursa con diarrea con sangre).

Muy raros: pancreatitis.

 

Cardiovasculares:

Los medicamentos como Ibuprofeno, pueden asociarse con un moderado aumento de riesgo de sufrir un ataque al corazón (“infarto de miocardio”) o cerebral (“ictus”).

También se ha observado edema (retención de líquidos), hipertensión arterial, e insuficiencia cardiaca en asociación con tratamientos con medicación del tipo Ibuprofeno Aldo-Unión.

 

Cutáneos:

Frecuentes: erupción en la piel.

Poco frecuentes: enrojecimiento de la piel, picor o hinchazón de la piel, púrpura (manchas violáceas en la piel).

Muy raros: caída del cabello, eritema multiforme (lesión en la piel), reacciones en la piel por influencia de la luz, inflamación de los vasos sanguíneos de la piel.

Excepcionalmente pueden darse infecciones cutáneas graves y complicaciones en el tejido blando durante la varicela.

Los medicamentos como Ibuprofeno pueden asociarse, en muy raras ocasiones a reacciones ampollosas muy graves como el síndrome de Stevens Jonson (erosiones diseminadas que afectan a la piel y a dos o más mucosas y lesiones de color púrpura, preferiblemente en el tronco) y la Necrolisis Epidérmica Tóxica (erosiones en mucosas y lesiones dolorosas con necrosis y desprendimiento de la epidermis).

Se puede producir una reacción cutánea grave conocida como síndrome DRESS. Los síntomas del síndrome DRESS incluyen: erupción cutánea, inflamación de los ganglios linfáticos y eosinófilos elevados (un tipo de glóbulos blancos).

Frecuencia no conocida:

Erupción generalizada roja escamosa, con bultos debajo de la piel y ampollas localizados principalmente en los pliegues cutáneos, el tronco y las extremidades superiores, que se acompaña de fiebre al inicio del tratamiento (pustulosis exantemática generalizada aguda). Deje de tomar Ibuprofeno Aldo-Unión si presenta estos síntomas y solicite atención médica de inmediato. Ver también la sección 2.

 

Sistema inmunológico:

Poco frecuentes: edema pasajero en áreas de la piel, mucosas o a veces en vísceras (angioedema),

inflamación de la mucosa nasal, broncoespasmo (espasmo de los bronquios que impiden el paso del aire hacia los pulmones).

Raros: reacciones alérgicas graves (shock anafiláctico). En caso de reacción de hipersensibilidad generalizada grave puede aparecer hinchazón de cara, lengua y laringe, broncoespasmo, asma, taquicardia, hipotensión y shock.

Muy raros: dolor en las articulaciones y fiebre (lupus eritematoso).

 

Sistema nervioso central:

Frecuentes: fatiga o somnolencia, dolor de cabeza y mareos o sensación de inestabilidad.

Raros: parestesia (sensación de adormecimiento, hormigueo, acorchamiento, etc más frecuente en manos, pies, brazos o piernas). Muy raros: meningitis aséptica (inflamación de las meninges que son las membranas que protegen el cerebro y la medula espinal, no causada por bacterias). En la mayor parte de los casos en los que se ha comunicado meningitis aséptica con ibuprofeno, el paciente sufría alguna forma de enfermedad autoinmunitaria (como lupus eritematoso sistémico u otras enfermedades del colágeno) lo que suponía un factor de riesgo. Los síntomas de meningitis aséptica observados fueron rigidez en cuello, dolor de cabeza, náuseas, vómitos, fiebre o desorientación.

 

Psiquiátricos:

Poco frecuentes: insomnio, ansiedad, inquietud. Raros: desorientación o confusión, nerviosismo, irritabilidad, depresión, reacción psicótica.

 

Auditivos:

Frecuentes: vértigo. Poco frecuentes: zumbidos o pitidos en los oídos. Raros: dificultad auditiva.

 

 

Oculares:

Poco frecuentes: alteraciones de la visión. Raros: visión anormal o borrosa.

 

Sangre:

Raros: disminución de plaquetas, disminución de los glóbulos blancos (puede manifestarse por la aparición de infecciones frecuentes con fiebre, escalofríos o dolor de garganta), disminución de los glóbulos rojos (puede manifestarse por dificultad respiratoria y palidez de la piel), disminución de granulocitos (un tipo de glóbulos blancos que puede predisponer a que se contraigan infecciones), pancitopenia (deficiencia de glóbulos rojos, blancos y plaquetas en la sangre), agranulocitosis (disminución muy grande de granulocitos), anemia aplásica (insuficiencia de la médula ósea para producir diferentes tipos de células) o anemia hemolítica (destrucción prematura de los glóbulos rojos).

Los primeros síntomas son: fiebre, dolor de garganta, úlceras superficiales en la boca, síntomas pseudogripales, cansancio extremo, hemorragia nasal y cutánea. Muy raros: prolongación del tiempo de sangrado.

 

Renales:

En base a la experiencia con los AINEs en general, no pueden excluirse casos de nefritis intersticial (trastorno del riñón) síndrome nefrótico (trastorno caracterizado por proteínas en la orina e hinchazón del cuerpo) e insuficiencia renal (pérdida súbita de la capacidad de funcionamiento del riñón).

 

Hepáticos:

Los medicamentos como Ibuprofeno Aldo-Unión pueden asociarse, en raras ocasiones a lesiones hepáticas. Otros efectos adversos raros son: hepatitis (inflamación del hígado), anomalías de la función hepática e ictericia (coloración amarilla de la piel y ojos).

Frecuencia desconocida: insuficiencia hepática (deterioro severo del hígado).

 

Generales:

Agravación de las inflamaciones durante procesos infecciosos.',
    4
);
INSERT INTO forma_farmaceutica (
    descripcio,
    id_medicament
)
VALUES (
    'solid',
    4
);
INSERT INTO laboratori (
    descripcio,
    nom,
    id_medicament
)
VALUES (
    'Calle Baronesa de Maldá, 73 08950 Esplugues de Llobregat BARCELONA – ESPAÑA',
    'Laboratorio Aldo-Unión, S.L.',
    4
);
INSERT INTO patologia (
    descripcio,
    id_medicament
)
VALUES (
    'dolor,fiebre,artritis reumatoide juvenil',
    4
);
INSERT INTO simptomatologia (
    descripcio,
    id_medicament
)
VALUES (
    'Ibuprofeno Aldo-Unión contiene ibuprofeno y pertenece al grupo de medicamentos llamados antiinflamatorios no esteroideos (AINEs).
     Este medicamento está indicado en el tratamiento de:
     Dolor leve o moderado.
     Fiebre.
     Artritis reumatoide juvenil.',
    4
);



-- Albert Zamorano

INSERT INTO usuari (
    nom,
    cognom,
    telefon,
    email,
    dni,
    contrasenya,
    num_colegiat,
    altres
)    
VALUES(
    'Albert',
    'Zamorano',
    654667788,
    'azamorano@doctor.com',
    '47980449J',
    '123',
    204056789,
    'hidroterapia'
);


-- Josep Liebana

INSERT INTO usuari (
    nom,
    cognom,
    telefon,
    email,
    dni,
    contrasenya,
    num_colegiat,
    altres
)    
VALUES(
    'Josep',
    'Liebana',
    616775544,
    'jliebana@doctor.com',
    '57680119A',
    '123',
    440612398,
    'infectologia'
);


-- Marc Alba

INSERT INTO usuari (
    nom,
    cognom,
    telefon,
    email,
    dni,
    contrasenya,
    num_colegiat,
    altres
)    
VALUES(
    'Marc',
    'Alba',
    678116600,
    'malba@doctor.com',
    '29789559D',
    '123',
    051012935,
    'neurologia'
);


-- Jordi Tortosa

INSERT INTO usuari (
    nom,
    cognom,
    telefon,
    email,
    dni,
    contrasenya,
    num_colegiat,
    altres
)    
VALUES(
    'Jordi',
    'Tortosa',
    601997823,
    'jtortosa@doctor.com',
    '47765762T',
    '123',
    510351379,
    'pneumologia'
);


-- Susana Cordero

INSERT INTO usuari (
    nom,
    cognom,
    telefon,
    email,
    dni,
    contrasenya,
    num_colegiat,
    altres
)    
VALUES(
    'Susana',
    'Cordero',
    623789977,
    'scordero@doctor.com',
    '76275626Z',
    '123',
    793275970,
    'nutricion'
);


-- Sergi Obis
INSERT INTO usuari (
    nom,
    cognom,
    telefon,
    email,
    dni,
    contrasenya,
    num_colegiat,
    altres
)    
VALUES(
    'Sergi',
    'Obis',
    654461989,
    'sobis@farmaceutic.com',
    '40732750A',
    '123',
    120043950,
    'Farmàcia Miguel Valiente Bautista'
);


-- David Valdivia
INSERT INTO usuari (
    nom,
    cognom,
    telefon,
    email,
    dni,
    contrasenya,
    num_colegiat,
    altres
)    
VALUES(
    'David',
    'Valdivia',
    773356040,
    'dvaldivia@farmaceutic.com',
    '32262634M',
    '123',
    864599140,
    'Farmàcia Catalunya'
);

-- Cristian Suris
INSERT INTO usuari (
    nom,
    cognom,
    telefon,
    email,
    dni,
    contrasenya,
    num_colegiat,
    altres
)    
VALUES(
    'Cristian',
    'Suris',
    681529240,
    'csuris@farmaceutic.com',
    '19726850A',
    '123',
    641486680,
    'Farmàcia de la Roca'
);

-- Alfonso Montero
INSERT INTO usuari (
    nom,
    cognom,
    telefon,
    email,
    dni,
    contrasenya,
    num_colegiat,
    altres
)    
VALUES(
    'Alfonso',
    'Montero',
    361786620,
    'amontero@farmaceutic.com',
    '79804434T',
    '123',
    174375800,
    'Farmàcia Salazar Mena'
);

-- Rosa Garcia
INSERT INTO usuari (
    nom,
    cognom,
    telefon,
    email,
    dni,
    contrasenya,
    num_colegiat,
    altres
)    
VALUES(
    'Rosa',
    'Garcia',
    465619990,
    'rgarcia@farmaceutic.com',
    '20156710Q',
    '123',
    620760620,
    'Farmàcia Anna Mestres'
);
