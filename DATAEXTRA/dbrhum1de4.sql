-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net   ESTO ESTA EMPEZADO EN DICIEMBRE 19  Y SEGUIDO EN ENERO 4 

--  OJO
--  aca metemos una a una las tablas necesarias en el orden adecuado para q no mande eroor por foreignkey no encontrada....
-- orden posible seria ...
--

--  mrstatus entornos_dds   instituciones  
-- tiposausencia

--    profesiones  funcioneslabs  areasdep   
--
-- servicios  especialidades  trabajadores
--
--    ausencia
--
--  asignalabs   asignalabxdds


-- Despues de esto el 03 enero se cargaron en tabla nueva 


-- registro cambio status laboral 
-- son los cambios de estado que se registran en personal de reemplazo que pasa a transitoriao-...


-- lo vamos a agregar 

-- Volcado de datos para la tabla `mr_status`
--

INSERT INTO `mr_status` (`id`, `nombre`, `codigo`, `descripcion`) VALUES
(1, 'Reemplazante autorizado', 'RMPLZ', 'Descr....'),
(2, 'Planta transitoria', 'PPT', 'Descr....'),
(3, 'Planta permanente', 'PPP', 'Descr....P'),
(4, 'Pasante', 'pss', 'Descr....P'),
(5, 'Concursante', 'Cncrste', 'Descr....P');

-- Volcado de datos para la tabla `dataextra_dds`
--




SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

# al intentar meterle a dbrhum datos de tabla dataextra_dds chilla que no la encuentra 

INSERT INTO `entornos_dds` (`id`, `nombre`, `codigo`) VALUES
(1, 'Lunes', 'LUN'),
(2, 'Martes', 'MAR'),
(3, 'Miercoles', 'MIE'),
(4, 'Jueves', 'JUE'),
(5, 'Viernes', 'VIE'),
(6, 'Sabado', 'SAB'),
(7, 'Domingo', 'DOM');


-- Volcado de datos para la tabla `tipos_ausencias`
--
-- detallealusar : descripcion fue sacado de models nuevo ....
INSERT INTO `tipos_ausencias` (`id`, `nombre`, `codigo`, `descripcion`) VALUES
(1, 'Licencia anual ordinaria', 'LAO', 'Lic anual ordinaria'),
(2, 'Licencia por maternidad', 'LMA', 'Lic x ..MATERNIDAD'),
(3, 'Licencia por Enfermedad', 'LXE', 'Lic x ..'),
(4, 'Licencia preservacion embarazo', 'LPRVEBZO', 'Lic x ..'),
(5, 'Licencia enfermedad Prolongada', 'LENFPRLG', 'Lic x ..'),
(6, 'Traslado a Provincia', 'TRLAPRV', 'Lic x ..'),
(7, 'Licencia sin Goce Sueldo', 'LSGSLDO', 'Lic x ..'),
(8, 'CambioFunciones', 'CBIOFUNC', 'Lic x ..'),
(9, 'Jubilacion', 'JBLCION', 'Lic x ..'),
(10, 'Licencia Gremial', 'LICGRM', 'Lic x ..'),
(11, 'Renuncia', 'RNCIA', 'Lic x ..'),
(12, 'Horas Lactancia materna', 'HLCTCIA', 'Lic x ..');

-- instituciones


INSERT INTO `instituciones` (`id`, `nombre`, `codigo`, `descripcion`, `domicilio`, `telefonos`, `email`, `web`, `comentarios`) VALUES
(1, 'Hospital Roque Saenz Peña', 'HRSP', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(2, 'Hospital Carrasco', 'HICARRASCO', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(3, 'hospital de emergencias Clemente Alvarez', 'HECA', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(4, 'Hospital de Niños Victor J Vilela', 'HNVILELA', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(5, 'Policlinico San Martín', 'PSM', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(6, 'Instituto Liga Antipolio Rosario', 'ILAR', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(7, 'Centro Medicina ambulatoria Rosario', 'CEMAR', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(8, 'Centro salud Juana Azurduy', 'CSMJAZURDUY', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(9, 'Maternidad martin', 'MMRTIN', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(10, 'Centro Salud Casiano Casas', 'CSMCASCAS', 'Descripcion..', 'Casiano cassas', '341 ....', '', '', 'Comentarios...'),
(11, 'Hospital Alberdi', 'HALBERDI', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(12, 'C S Elena Bazet', 'CSEBAZET', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(13, 'CS San MartinA', 'CSMSMARTINA', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(14, 'CSBarrioPlata', 'CSMBRRPLATA', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(15, 'CS Ugarte', 'CSMUGARTE', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(16, 'Centro SM A Moreau', 'CSMAMOREAU', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(17, 'CS Eva Duarte', 'CSMEVADUARTE', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(18, 'Vecinal Roca', 'CSMVECROCA', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...'),
(19, 'VECINAL VICTOR CUE', 'VVICTORCUE', 'Descripcion..', '', '341 ....', '', '', 'Comentarios...');


--
-- Base de datos: `rhssp`
--

--
-- Volcado de datos para la tabla `profesiones`
--

INSERT INTO `profesiones` (`id`, `nombre`, `codigo`) VALUES
(1, 'medico', 'MD'),
(2, 'enfermero', 'ENF'),
(3, 'Licenciada en Obstetricia', 'LOBSTR'),
(4, 'Bioquimico', 'BQMCO'),
(5, 'Farmaceutico', 'FRMCTCO'),
(6, 'Fonoaudiologo', 'FNADLGO'),
(7, 'Kinesiologo', 'KNSLOGO'),
(8, 'Operario', 'OPRARIO'),
(9, 'Administrativo', 'ADMNSTVO'),
(10, 'Psicologo', 'PSCLGO'),
(11, 'Trabajador Social', 'TRBSCAL'),
(12, 'Odontologo', 'ODNTLGO'),
(13, 'Tecnico Radiologo', 'TCRDLGO'),
(14, 'Tecnico Bioquimico', 'TCBQMCO'),
(15, 'VETERINARIO ', 'VTRINRIO');

--

--
-- Volcado de datos para la tabla `funclabs`
--

INSERT INTO `funclabs` (`id`, `nombre`, `codigo`, `descripcion`) VALUES
(1, 'guardia activa especializada', 'GASP', 'Atencion pacs ambulatorios que ingresan x guardia.\r\nAtencion pacs internados en Sala .Cirugias de urgenciay programadas .\r\nInterconsultas .....'),
(3, 'guardia pasiva especialista', 'GPSP', 'Descripcion ...\r\nAl llamado para evacuar consultas x a distancia y posibilidad de concurrir en tiempo breve de acuerdo a \r\ndisposicion del jefe del servicio al que pertenece. '),
(4, 'Consulta Con Acto Unico', 'CAU', 'Descripcion ...'),
(5, 'Consultorio Externo ', 'CEX', 'Descripcion ...'),
(6, 'Sala Internacion', 'INTS', 'Cuidados pacs internados en Salas.Evolucion .Indicacion .Interconsultas.'),
(7, 'Cirugia Programada', 'CGPG', 'Descripcion'),
(8, 'Docencia postgrado', 'DOCPOSTG', 'Descripcion ...'),
(9, 'docencia pregrado', 'DOCPREG', 'Descripcion ...'),
(10, 'Guardia General Activa', 'GGA', 'Descripcion ...'),
(11, 'Jefatura Servicio', 'JFTSRVCIO', 'Descripcion ...'),
(12, 'COORDINACION C EXTERNO', 'COORDCEXT', 'Descripcion ...'),
(13, 'Guardia Externa', 'GGEX', 'Descripcion ...'),
(14, 'Guardia Interna Activa', 'GGINT', 'Descripcion ...'),
(15, 'Ecocardiografia', 'ECOGRAFIA', 'Descripcion ...'),
(16, 'TrsApoyoMatricial', 'TRBSAM', 'Descripcion ...'),
(17, 'Ateneo Asistencial Servicio', 'ATENEO', 'Descripcion ...'),
(18, 'auditoria ', 'ADTRIA', 'Descripcion ...');



--
--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `nombre`, `codigo`, `descripcion`) VALUES
(1, 'oyt hospital vilela', 'OYTHNVJV', 'Descr.....'),
(2, 'OYT heca', 'OYTHECA', 'Descr.....'),
(3, 'guardia Policl SMartin', 'GDIAPSM', 'Descr.....'),
(5, 'OYT H CARRASCO', 'OYTHIC', 'Descr.....');


--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`id`, `nombre`, `codigo`) VALUES
(1, 'Ortopedia y Traumatologia', 'OYT'),
(2, 'Cardiologia', 'CRDLG'),
(3, 'Clinica Medica', 'CLMD'),
(4, 'Ginecologia y Obstetricia', 'GCOBST'),
(5, 'Pediatria', 'PDTRIA'),
(6, 'Neonatologia', 'NNTGIA'),
(7, 'Cirugia general', 'CGRAL'),
(8, 'Nefrologia', 'NFRLGIA'),
(9, 'Oncologia', 'ONCGIA'),
(10, 'Oftalmologia', 'OFTGIA'),
(11, 'Endocrinologia', 'ENDLGIA'),
(12, 'Diagnostico x Imagenes', 'DGXIMG'),
(13, 'Dermatologia', 'DRMTGIA'),
(14, 'Fisiatria', 'FSATRIA'),
(15, 'MGeneral', 'MGNRL'),
(17, 'Hemoterapia', 'HMTRPIA'),
(18, 'Neurocirugia', 'NRCGIA'),
(19, 'Otorrinolaringologia', 'OTRLRGIA'),
(20, 'Psiquiatria', 'PSQTRIA'),
(21, 'Reumatologia', 'RMTLGIA'),
(22, 'Obstetricia', 'OBSTTRA'),
(23, 'Ecografia', 'ECGRAFIA'),
(24, 'Urologia', 'UROLOGIA'),
(25, 'Neurologia', 'NRLGIA');



-- Volcado de datos para la tabla `trabajadores`
-
