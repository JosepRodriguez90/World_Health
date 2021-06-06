-- s'ha de tindre o crear una BBDD amb el nom de 'kummonapps'

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- Creacio de taules

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
  `composicio` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Composicio del medicament',
  `nom` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nom del medicament',
  `codi_barres` int(100) NOT NULL COMMENT 'Codi de barres del medicament',
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

CREATE TABLE IF NOT EXISTS `arbol` (
  `nodo` int(11) NOT NULL,
  `texto` varchar (500),
  `pregunta` BOOLEAN,
  PRIMARY KEY (`nodo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `proves` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;




-- Inserts Medicaments

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
  'ABILIFY solucion oral 150ml',
  2147483000,
  'Vía oral: se deben tomar los comprimidos bucodispersables o
	la solución oral como una alternativa a los comprimidos en
	pacientes que tengan dificultad para tragar. El comprimido
	bucodispersable se debe introducir en la boca, sobre la lengua,
	donde rápidamente se dispersará con la saliva. Se puede tomar con o sin líquido.
	Se puede es disolver en agua y beber la suspensión resultante.'
);
INSERT INTO efectes_secundaris (
  descripcio,
  id_medicament
)
VALUES (
  'Diabetes mellitus',
  1
);
INSERT INTO efectes_secundaris (
  descripcio,
  id_medicament
)
VALUES (
  'Problemas para dormir',
  1
);
INSERT INTO efectes_secundaris (
  descripcio,
  id_medicament
)
VALUES (
  'Ansiedad',
  1
);
INSERT INTO efectes_secundaris (
  descripcio,
  id_medicament
)
VALUES (
  'Temblor',
  1
);
INSERT INTO efectes_secundaris (
  descripcio,
  id_medicament
)
VALUES (
  'Cansancio',
  1
);
INSERT INTO efectes_secundaris (
  descripcio,
  id_medicament
)
VALUES (
  'Mareo',
  1
);
INSERT INTO forma_farmaceutica (
  descripcio,
  id_medicament
)
VALUES (
  'Pastillas orales',
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
  'Esquizofrenia',
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
  'ABILIFY solucion oral 480ml',
  2147483001,
  'Vía oral: se deben tomar los comprimidos bucodispersables o
	la solución oral como una alternativa a los comprimidos en
	pacientes que tengan dificultad para tragar. El comprimido
	bucodispersable se debe introducir en la boca, sobre la lengua,
	donde rápidamente se dispersará con la saliva. Se puede tomar con o sin líquido.
	Se puede es disolver en agua y beber la suspensión resultante.'
);
INSERT INTO efectes_secundaris (
  descripcio,
  id_medicament
)
VALUES (
    'Diabetes mellitus',
    2
);
INSERT INTO efectes_secundaris (
    descripcio,
    id_medicament
)
VALUES (
    'Problemas para dormir',
    2
);
INSERT INTO efectes_secundaris (
    descripcio,
    id_medicament
)
VALUES (
    'Ansiedad',
    2
);
INSERT INTO efectes_secundaris (
    descripcio,
    id_medicament
)
VALUES (
    'Temblor',
    2
);
INSERT INTO efectes_secundaris (
    descripcio,
    id_medicament
)
VALUES (
    'Cansancio',
    2
);
INSERT INTO efectes_secundaris (
    descripcio,
    id_medicament
)
VALUES (
    'Mareo',
    2
);
INSERT INTO forma_farmaceutica (
    descripcio,
    id_medicament
)
VALUES (
    'Pastillas orales',
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
    'Esquizofrenia',
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
  'ODOMZO Caps. dura 200 mg',
  2147483002,
  'Vía oral. Las cápsulas deben tragarse enteras. No se deben masticar ni triturar.
  No se deben abrir las cápsulas debido al riesgo de teratogenicidad. Tomar como mínimo
  dos horas después de una comida y al menos una hora antes de la siguiente comida.'
);
INSERT INTO efectes_secundaris (
    descripcio,
    id_medicament
)
VALUES (
    'Dificultad para respirar',
    3
);
INSERT INTO efectes_secundaris (
    descripcio,
    id_medicament
)
VALUES (
    'Dificultad para tragar',
    3
);
INSERT INTO efectes_secundaris (
    descripcio,
    id_medicament
)
VALUES (
    'Hinchazón de la cara',
    3
);
INSERT INTO efectes_secundaris (
    descripcio,
    id_medicament
)
VALUES (
    'Hinchazón de labios',
    3
);
INSERT INTO efectes_secundaris (
    descripcio,
    id_medicament
)
VALUES (
    'Hinchazón de la garganta',
    3
);
INSERT INTO efectes_secundaris (
    descripcio,
    id_medicament
)
VALUES (
    'Picor grave de la piel',
    3
);
INSERT INTO efectes_secundaris (
    descripcio,
    id_medicament
)
VALUES (
    'Protuberancias',
    3
);
INSERT INTO forma_farmaceutica (
    descripcio,
    id_medicament
)
VALUES (
    'Pastillas orales',
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
    'Cáncer',
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
  'IBUPROFENO ALDO-UNION Susp. oral 200ml',
  2147483003,
  'Siga exactamente las instrucciones de administración de este medicamento indicadas por su médico o farmacéutico. En caso de duda, consulte  de nuevo a su médico o farmacéutico.
   Se debe utilizar la dosis eficaz más baja durante el menor tiempo necesario para aliviar los síntomas. Si tiene una infección, consulte sin demora a un médico si los síntomas (como fiebre y dolor) persisten o empeoran (ver sección 2).
   Recuerde tomar su medicamento.'
);
INSERT INTO efectes_secundaris (
    descripcio,
    id_medicament
)
VALUES (
    'Asma',
    4
);
INSERT INTO efectes_secundaris (
    descripcio,
    id_medicament
)
VALUES (
    'Úlceras pépticas',
    4
);
INSERT INTO efectes_secundaris (
    descripcio,
    id_medicament
)
VALUES (
    'Hemorragias',
    4
);
INSERT INTO efectes_secundaris (
    descripcio,
    id_medicament
)
VALUES (
    'Infarto de miocardio',
    4
);
INSERT INTO efectes_secundaris (
    descripcio,
    id_medicament
)
VALUES (
    'Ictus',
    4
);
INSERT INTO forma_farmaceutica (
    descripcio,
    id_medicament
)
VALUES (
    'Pastillas orales',
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
    'Dolor',
    4
);
INSERT INTO patologia (
    descripcio,
    id_medicament
)
VALUES (
    'Fiebre',
    4
);
INSERT INTO patologia (
    descripcio,
    id_medicament
)
VALUES (
    'Artritis reumatoide juvenil',
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


INSERT INTO medicaments (
  composicio,
  nom,
  codi_barres,
  comentaris
)
VALUES (
  'Composición de Ventolin 100 microgramos/inhalación suspensión para inhalación en envase a presión
    El principio activo es 100 microgramos de salbutamol (como salbutamol sulfato) por aplicación.
    Los demás componentes son norflurano (HFA134a).',
  'VENTOLIN Susp. para inhal. 100 mcg/dosis inhalador de 200 dosis',
  2147483004,
  'Siga exactamente las instrucciones de administración de este medicamento indicadas por su médico. En caso de duda, consulte de nuevo a su médico o farmacéutico.
    Recuerde usar su medicamento. Su médico le indicará la duración de su tratamiento con Ventolin. No suspenda el tratamiento antes.
    Ventolin 100 microgramos/inhalación suspensión para inhalación en envase a presión produce una fina niebla que debe ser inhalada en los pulmones. Asegúrese que sabe utilizar el inhalador correctamente. Si tiene cualquier problema pregunte a su médico o farmacéutico.'
);
INSERT INTO efectes_secundaris (
    descripcio,
    id_medicament
)
VALUES (
    'Mareo ',
    5
);
INSERT INTO efectes_secundaris (
    descripcio,
    id_medicament
)
VALUES (
    'Hinchazón de párpados',
    5
);
INSERT INTO efectes_secundaris (
    descripcio,
    id_medicament
)
VALUES (
    'Hinchazón de labios',
    5
);
INSERT INTO forma_farmaceutica (
    descripcio,
    id_medicament
)
VALUES (
    'Inhalador',
    5
);
INSERT INTO laboratori (
    descripcio,
    nom,
    id_medicament
)
VALUES (
    'Avda. de Extremadura, 3 09400 – Aranda de Duero (Burgos)',
    'Glaxo Wellcome, S.A.',
    5
);
INSERT INTO patologia (
    descripcio,
    id_medicament
)
VALUES (
    'Asma',
    5
);
INSERT INTO simptomatologia (
    descripcio,
    id_medicament
)
VALUES (
    'Medicación de rescate en el asma leve, moderada o grave. Prevención de broncoespasmo (dificultad para respirar o sibilancias) inducido por ejercicio físico o antes de exponerse a un estímulo alergénico conocido e inevitable.',
    5
);


-- Insert Usuaris

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
    'Zamorano Manzano',
    654667788,
    'azamorano@doctor.com',
    '47980449J',
    '123',
    204056789,
    'Hidroterapia'
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
    'Liebana Nuñez',
    616775544,
    'jliebana@doctor.com',
    '57680119A',
    '123',
    440612398,
    'Infectologia'
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
    'Alba Perez',
    678116600,
    'malba@doctor.com',
    '29789559D',
    '123',
    551012935,
    'Neurologia'
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
    'Tortosa Gutierrez',
    601997823,
    'jtortosa@doctor.com',
    '47765762T',
    '123',
    510351379,
    'Pneumologia'
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
    'Cordero De la Cruz',
    623789977,
    'scordero@doctor.com',
    '76275626Z',
    '123',
    793275970,
    'Nutricion'
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
    'Obis Varela',
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
    'Valdivia Carreras',
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
    'Suris Monsonis',
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
    'Montero Asimov',
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
    'Garcia Hiroshi',
    465619990,
    'rgarcia@farmaceutic.com',
    '20156710Q',
    '123',
    620760620,
    'Farmàcia Anna Mestres'
);

-- Admin
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
    'admin',
    'admin',
    666619990,
    'admin@admin.com',
    '99956710Z',
    'admin',
    620760620,
    'Kummon Apps'
);
