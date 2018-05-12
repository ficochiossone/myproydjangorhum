# -*- coding: utf-8 -*-

### aca construimos aplicacion . models.py para guardar data de baswe de datos de heca sistema oytred
from __future__ import unicode_literals


from django.db import models
from django.db import connection
from django.contrib.auth.models import User
from datetime import datetime, date
from django.contrib.contenttypes.models import ContentType

class Servicio(models.Model):
    nombre = models.CharField(max_length=32)
    codigo = models.CharField(max_length=8)
    descripcion = models.TextField()

    class Meta:
	db_table = 'oytred_servicios'


class Especialidad(models.Model):
    nombre = models.CharField(max_length=32)
    codigo = models.CharField(max_length=8)

    class Meta:
	db_table = 'oytred_especialidades'

class Profesional(models.Model):
    matricula = models.CharField(max_length=16,blank=True,null=True)
    apellido = models.CharField(max_length=128)
    nombre = models.CharField(max_length=128)
    tipodoc = models.CharField(max_length=5)
    nrodoc = models.IntegerField()
    nacionalidad = models.ForeignKey('Nacionalidad',null=True)
    hospital = models.ForeignKey('Institucion',null=True,blank=True,verbose_name='Referencia Institucional')
    grupo = models.ForeignKey('Grupo',null=True,blank=True,verbose_name='Grupo Prof')
    csr = models.ForeignKey('Centrosalud',blank=True,null=True)
#    grupotpt = models.ForeignKey('Grupoterapeutico',blank=True,null=True)
    delared = models.BooleanField(default=True,verbose_name='Revista en la Red')
    cargahs = models.IntegerField(null=True,blank=True,verbose_name='Horas Semanales en Inst Ref')
    especialidad = models.ForeignKey('Especialidad',null=True)
    categoria = models.ForeignKey('Categorizacion',null=True,blank=True,verbose_name='Categoria Profesional')   
    domicilio = models.CharField(max_length=128, null=True, blank=True)
    telefono = models.CharField(max_length=16, null=True, blank=True)
    celular = models.CharField(max_length=16, blank=True)
    email = models.EmailField(blank=True)
    cuit = models.CharField(max_length=16,null=True,blank=True)
    activo = models.BooleanField(default=True)
    tipo = models.CharField(max_length=2,blank=True)
    dtid=models.IntegerField(null=True,blank=True,editable=False)
    comentarios = models.TextField(null=True,blank=True,verbose_name='Comentarios')

    class Meta:
	db_table = 'oytred_profesionales'

class Diagnostico(models.Model):
    GRUPOSDG = (('NC','no clasificado'),
                ('TRMT','traumatologico'),
                ('RSPT','respiratorio'),
                ('GSTN','gastrointestinal'),
                ('NFUR','nefrourodjango.contrib.contenttypeslogico'),
                ('SNCO','sistema nervioso'),
                ('CVSC','cardiovascular'))
    cie10 = models.ForeignKey('cie10',null=True,blank=True,verbose_name='ref Cie 10')
    AOclasif = models.ForeignKey('AOclasif',null=True,blank=True,verbose_name='AO clasificacion')   
    grupodg = models.CharField(choices=GRUPOSDG,default='TRMT',max_length=4,null=True,blank=True)
    descripcion = models.CharField(max_length=64)
    codigo = models.CharField(max_length=12)
    comentarios = models.CharField(max_length=128,blank=True,null=True)
    habilitado = models.NullBooleanField(blank=True,null=True,default=False)

    class Meta:
	db_table = 'oytred_diagnosticos'
    
### Internaciones
class Internacion(models.Model):
    
    PROBLEMATICA = ((u'YNDT', u'no determinado'),
                       (u'YUR', u'INTERNACION URGENCIA'),
                       (u'YPG', u'INTERNACION PROGRAMADA'))

    hospital = models.ForeignKey('Institucion')
    hclint = models.IntegerField(blank=True,null=True,verbose_name='Historia Clinica')
    sala =  models.CharField(max_length=64,default='NO DETERMINADA')
    cama = models.CharField(max_length = 4 , null =True)
    servicio = models.ForeignKey('Servicio',verbose_name='Servicio')
    grupo = models.ForeignKey('Grupo',blank=True,null=True,verbose_name='Grupo a Cargo')      
    paciente = models.ForeignKey('Paciente')
    tipo = models.CharField(choices=PROBLEMATICA,max_length=4,null=True,blank=True)
    fecha_internacion = models.DateField(verbose_name='Ingreso')
    fecha_egreso = models.DateField(verbose_name ='Alta',blank=True,null=True)
    intediag = models.CharField(verbose_name='ClaveMotivo',blank=True,null=True,max_length=64,default='NR')
    profesional_intgdia = models.ForeignKey('Profesional',related_name ='IprofG',blank=True,null=True,verbose_name='J Guardia')
    profesional_acargo = models.ForeignKey('Profesional',null=True,related_name='IprofA',verbose_name='Prof a cargo')
    profayudante = models.ForeignKey('Profesional',null=True,blank = True,related_name='Iresi',verbose_name='Profesional Junior(MF)')
    clinico_a_cargo=models.ForeignKey('Profesional',null=True,blank=True,related_name='ClinicoAcargo',verbose_name='Clinico A Cargo')
    profregint = models.ForeignKey('Profesional',null=True,related_name='pint',verbose_name='Internado por')    
    enfermero = models.ForeignKey('Enfermero',null=True,blank=True)
    germen = models.CharField(verbose_name='Germen pr.',max_length=36,null=True,blank=True)
    lab = models.CharField(verbose_name='laboratorio',max_length=36,null=True,blank=True)
    diagnostico_principal = models.ForeignKey('Diagnostico',related_name='YdiagnosticoP',verbose_name='Diagnostico principal',blank=True,null=True)
    diagnostico_secundario = models.ForeignKey('Diagnostico',related_name='YdiagnosticoB',verbose_name='Diagnostico secundario',blank=True,null=True)
    diagnostico_terciario = models.ForeignKey('Diagnostico',related_name='YdiagnosticoT',verbose_name='Diagnostico Terc',blank=True,null=True)
    diagnostico_cuarto = models.ForeignKey('Diagnostico',related_name='YdiagnosticoC',verbose_name='Diagnostico Cuart',blank=True,null=True)
    dieta = models.ForeignKey('Dieta',blank=True,null=True)
    informe = models.TextField(blank=True)
    img1=models.ImageField(upload_to='internaciones/%Y/%m',blank=True,help_text="Archivo de imagen...")
    img2=models.ImageField(upload_to='internaciones/%Y/%m',blank=True,help_text="Archivo de imagen")    
    img3=models.ImageField(upload_to='internaciones/%Y/%m',blank=True,help_text="Archivo de imagen")    
    hora_internacion = models.TimeField(auto_now_add=True)
    texto_epicrisis = models.TextField(blank=True,verbose_name='Texto Epicrisis')

    def devCama(self):
	c = Camas.objects.get(pk=self.cama)
	return c

    class Meta:
	db_table = 'oytred_internaciones'


class Cirugia(models.Model):
    PROBLEMATICA = (('NDTM', 'no determinado'),
                       ('QUR', 'CIRUGIA URGENCIA'),
                       ('QPG', 'CIRUGIA PROGRAMADA'),)
    hospital = models.ForeignKey('Institucion',verbose_name='Institucion',default=1)
    servicio = models.ForeignKey('Servicio',verbose_name='ServicioQ',blank=True,null=True)  
    internacion = models.ForeignKey('Internacion',blank=True,null=True)
    quirofano = models.CharField(max_length=4,verbose_name='QUIROFANO',blank=True,null=True)
    fecha_cirugia = models.DateField()
    hora_ini_cirugia = models.TimeField(blank=True,null=True)
    hora_fin_cirugia = models.TimeField(blank=True,null=True)
    paciente = models.ForeignKey('Paciente',verbose_name='Paciente')
    clavecirugia = models.CharField(max_length=48,verbose_name='ClaveQ',default='cirugia')
    tipo = models.CharField(choices=PROBLEMATICA,max_length=4,null=True,blank=True)
    cirujano = models.ForeignKey('Profesional',related_name='pcirujano',verbose_name='Cirujano')
    payudante = models.ForeignKey('Profesional',related_name='ayudante',verbose_name='Ayudante 1',null=True,blank = True)
    sayudante = models.ForeignKey('Profesional',null=True,blank=True,related_name='sayudante',verbose_name='Ayudante2')
    anestesista = models.ForeignKey('Profesional',related_name='anestesista')
    informe = models.TextField(blank=True)
    diagnostico_principal = models.ForeignKey('Diagnostico',related_name='diagnosticoP',blank=True,null=True)
    diagnostico_B = models.ForeignKey('Diagnostico',related_name='diagnosticoB',blank=True,null=True)
    diagnostico_C = models.ForeignKey('Diagnostico',related_name='diagnosticoC',blank=True,null=True)
    diagnostico_D = models.ForeignKey('Diagnostico',related_name='diagnosticoD',blank=True,null=True)
    practica_principal = models.ForeignKey('PracticaQ',related_name='practicaP',blank=True,null=True)
    practica_B = models.ForeignKey('PracticaQ',related_name='practicaB',blank=True,null=True)
    practica_C = models.ForeignKey('PracticaQ',related_name='practicaC',blank=True,null=True)
    practica_D = models.ForeignKey('PracticaQ',related_name='practicaD',blank=True,null=True)
    implante_a = models.ForeignKey('ItemLic_solicitado',related_name='ItsA',blank=True,null=True,db_column='implante_a',verbose_name="ITLICA")

    class Meta:
	db_table = 'oytred_cirugias'

class Institucion(models.Model):
    nombre = models.CharField(max_length=64,unique=True)
    sigla = models.CharField(max_length=8)
    domicilio = models.CharField(max_length=128)
    codigo_postal = models.ForeignKey('CodigoPostal', blank=True, null=True)
#    categorizacion = models.ForeignKey('Complejidad_institucional',blank=True,null=True)
    email = models.EmailField(blank=True)
    ##web = models.URLField(blank=True, verify_exists=False)
    comentarios = models.TextField(null=True,blank=True,default='N')

    class Meta:
	db_table = 'oytred_instituciones'

#Avisar modificacion
class ServiciosInstitucion(models.Model):
    servicio = models.ForeignKey('Servicio')
    institucion = models.ForeignKey('Institucion')

    class Meta:
	db_table = 'oytred_serviciosxinstituciones'

class CodigoPostal(models.Model):
    codigo = models.CharField(max_length=32)
    localidad = models.CharField(max_length=128, default="PLACEHOLDER")
    provincia = models.CharField(max_length=64, default="PLACEHOLDER")

    class Meta:
	db_table = 'oytred_codigos_postales'


class Paciente(models.Model):

    PROVINCIAS = (("01","CAPITAL FEDERAL"),
                  ("02","BUENOS AIRES"),
                  ("03","CATAMARCA"),
                  ("04","CORDOBA"),
                  ("05","CORRIENTES"),
                  ("06","ENTRE RIOS"),
                  ("07","JUJUY"),
                  ("08","LA RIOJA"),
                  ("09","MENDOZA"),
                  ("10","SALTA"),
                  ("11","SAN JUAN"),
                  ("12","SAN LUIS"),
                  ("13","SANTA FE"),
                  ("14","SANTIAGO DEL ESTERO"),
                  ("15","TUCUMAN"),
                  ("16","CHACO"),
                  ("17","CHUBUT"),
                  ("18","FORMOSA"),
                  ("19","LA PAMPA"),
                  ("20","MISIONES"),
                  ("21","NEUQUEN"),
                  ("22","RIO NEGRO"),
                  ("23","SANTA CRUZ"),
                  ("24","TIERRA DEL FUEGO"))



    PAISES = (("ND", "No definido"),
          ("AFG", "Afganistán"),
          ("ALA", "Åland"),
          ("ALB", "Albania"),
          ("DEU", "Alemania"),
          ("AND", "Andorra"),
          ("AGO", "Angola"),
          ("AIA", "Anguila"),
          ("ATA", "Antártida"),
          ("ATG", "Antigua y Barbuda"),
          ("ANT", "Antillas Neerlandesas"),
          ("SAU", "Arabia Saudita"),
          ("DZA", "Argelia"),
          ("ARG", "Argentina"),
          ("ARM", "Armenia"),
          ("ABW", "Aruba"),
          ("AUS", "Australia"),
          ("AUT", "Austria"),
          ("AZE", "Azerbaiyán"),
          ("BHS", "Bahamas"),
          ("BHR", "Bahréin"),
          ("BGD", "Bangladesh"),
          ("BRB", "Barbados"),
          ("BEL", "Bélgica"),
          ("BLZ", "Belice"),
          ("BEN", "Benín"),
          ("BMU", "Bermudas"),
          ("BLR", "Bielorrusia"),
          ("MMR", "Birmania"),
          ("BOL", "Bolivia"),
          ("BIH", "Bosnia y Herzegovina"),
          ("BWA", "Botsuana"),
          ("BVT", "Noruega Isla Bouvet"),
          ("BRA", "Brasil"),
          ("BRN", "Brunéi"),
          ("BGR", "Bulgaria"),
          ("BFA", "Burkina Faso"),
          ("BDI", "Burundi"),
          ("BTN", "Bután"),
          ("CPV", "Cabo Verde"),
          ("CYM", "Islas Caimán"),
          ("KHM", "Camboya"),
          ("CMR", "Camerún"),
          ("CAN", "Canadá"),
          ("CAF", "República Centroafricana"),
          ("TCD", "Chad"),
          ("CZE", "República Checa"),
          ("CHL", "Chile"),
          ("CHN", "China"),
          ("CYP", "Chipre"),
          ("CCK", "Islas Cocos"),
          ("COL", "Colombia"),
          ("COM", "Comoras"),
          ("COG", "República del Congo"),
          ("COD", "República Democrática del Congo"),
          ("COK", "Islas Cook"),
          ("PRK", "Corea del Norte"),
          ("KOR", "Corea del Sur"),
          ("CIV", "Costa de Marfil"),
          ("CRI", "Costa Rica"),
          ("HRV", "Croacia"),
          ("CUB", "Cuba"),
          ("DNK", "Dinamarca"),
          ("DMA", "Dominica"),
          ("DOM", "República Dominicana"),
          ("ECU", "Ecuador"),
          ("EGY", "Egipto"),
          ("SLV", "El Salvador"),
          ("ARE", "Emiratos Árabes Uniclass Pacdos"),
          ("ERI", "Eritrea"),
          ("SVK", "Eslovaquia"),
          ("SVN", "Eslovenia"),
          ("ESP", "España"),
          ("USA", "Estados Unidos"),
          ("UMI", "Islas ultramarinas de Estados Unidos"),
          ("EST", "Estonia"),
          ("ETH", "Etiopía"),
          ("FRO", "Islas Feroe"),
          ("PHL", "Filipinas"),
          ("FIN", "Finlandia"),
          ("FJI", "Fiyi"),
          ("FRA", "Francia"),
          ("GAB", "Gabón"),
          ("GMB", "Gambia"),
          ("GEO", "Georgia"),
          ("SGS", "Islas Georgias del Sur y Sandwich del Sur"),
          ("GHA", "Ghana"),
          ("GIB", "Gibraltar"),
          ("GRD", "Granada"),
          ("GRC", "Grecia"),
          ("GRL", "Groenlandia"),
          ("GLP", "Guadalupe"),
          ("GUM", "Guam"),
          ("GTM", "Guatemala"),
          ("GUF", "Guayana Francesa"),
          ("GGY", "Guernsey"),
          ("GIN", "Guinea"),
          ("GNQ", "Guinea Ecuatorial"),
          ("GNB", "Guinea-Bissau"),
          ("GUY", "Guyana"),
          ("HTI", "Haití"),
          ("HMD", "Australia Islas Heard y McDonald"),
          ("HND", "Honduras"),
          ("HKG", "Hong Kong"),
          ("HUN", "Hungría"),
          ("IND", "India"),
          ("IDN", "Indonesia"),
          ("IRN", "Irán"),
          ("IRQ", "Iraq"),
          ("IRL", "Irlanda"),
          ("ISL", "Islandia"),
          ("ISR", "Israel"),
          ("ITA", "Italia"),
          ("JAM", "Jamaica"),
          ("JPN", "Japón"),
          ("JEY", "Jersey"),
          ("JOR", "Jordania"),
          ("KAZ", "Kazajistán"),
          ("KEN", "Kenia"),
          ("KGZ", "Kirguistán"),
          ("KIR", "Kiribati"),
          ("KWT", "Kuwait"),
          ("LAO", "Laos"),
          ("LSO", "Lesoto"),
          ("LVA", "Letonia"),
          ("LBN", "Líbano"),
          ("LBR", "Liberia"),
          ("LBY", "Libia"),
          ("LIE", "Liechtenstein"),
          ("LTU", "Lituania"),
          ("LUX", "Luxemburgo"),
          ("MAC", "Macao"),
          ("MKD", "República de Macedonia"),
          ("MDG", "Madagascar"),
          ("MYS", "Malasia Malasia"),
          ("MWI", "Malaui"),
          ("MDV", "Maldivas"),
          ("MLI", "Malí"),
          ("MLT", "Malta"),
          ("FLK", "Islas Malvinas"),
          ("IMN", "Isla de Man"),
          ("MNP", "Islas Marianas del Norte"),
          ("MAR", "Marruecos Marruecos"),
          ("MHL", "Islas Marshall"),
          ("MTQ", "Martinica"),
          ("MUS", "Mauricio"),
          ("MRT", "Mauritania"),
          ("MYT", "Mayotte"),
          ("MEX", "México México"),
          ("FSM", "Micronesia"),
          ("MDA", "Moldavia"),
          ("MCO", "Mónaco"),
          ("MNG", "Mongolia"),
          ("MNE", "Montenegro"),
          ("MSR", "Montserrat"),
          ("MOZ", "Mozambique"),
          ("NAM", "Namibia"),
          ("NRU", "Nauru"),
          ("CXR", "Isla de Navidad"),
          ("NPL", "Nepal Nepal"),
          ("NIC", "Nicaragua"),
          ("NER", "Níger"),
          ("NGA", "Nigeria"),
          ("NIU", "Niue"),
          ("NFK", "Norfolk"),
          ("NOR", "Noruega"),
          ("NCL", "Nueva Caledonia"),
          ("NZL", "Nueva Zeclass PracticaQlanda"),
          ("OMN", "Omán"),
          ("NLD", "Países Bajos"),
          ("PAK", "Pakistán"),
          ("PLW", "Palaos"),
          ("PSE", "Territorios palestinos"),
          ("PAN", "Panamá"),
          ("PNG", "Papúa Nueva Guinea"),
          ("PRY", "Paraguay"),
          ("PER", "Perú"),
          ("PCN", "Islas Pitcairn"),
          ("PYF", "Polinesia Francesa"),
          ("POL", "Polonia"),
          ("PRT", "Portugal"),
          ("PRI", "Puerto Rico"),
          ("QAT", "Qatar"),
          ("GBR", "Reino Unido"),
          ("REU", "Reunión"),
          ("RWA", "Ruanda"),
          ("ROU", "Rumania"),
          ("RUS", "Rusia"),
          ("ESH", "República Árabe Saharaui Democrática"),
          ("SLB", "Islas Salomón"),
          ("WSM", "Samoa"),
          ("ASM", "Samoa Americana"),
          ("BLM", "San Bartolomé"),
          ("KNA", "San Cristóbal y Nieves"),
          ("SMR", "San Marino"),
          ("MAF", "Saint-Martin"),
          ("SPM", "San Pedro y Miquelón"),
          ("VCT", "San Vicente y las Granadinas"),
          ("AFG", "Afganistán"),
          ("ALA", "Åland"),
          ("ALB", "Albania"),
          ("DEU", "Alemania"),
          ("AND", "Andorra"),
          ("AGO", "Angola"),
          ("AIA", "Anguila"),
          ("ATA", "Antártida"),
          ("ATG", "Antigua y Barbuda"),
          ("ANT", "Antillas Neerlandesas"),
          ("SAU", "Arabia Saudita"),
          ("DZA", "Argelia"),
          ("ARG", "Argentina"),
          ("ARM", "Armenia"),
          ("ABW", "Aruba"),
          ("AUS", "Australia"),
          ("AUT", "Austria"),
          ("AZE", "Azerbaiyán"),
          ("SHN", "Santa Helena"),
          ("LCA", "Santa Lucía"),
          ("STP", "Santo Tomé y Príncipe"),
          ("SEN", "Senegal"),
          ("SRB", "Serbia"),
          ("SYC", "Seychelles"),
          ("SLE", "Sierra Leona"),
          ("SGP", "Singapur"),
          ("SYR", "Siria"),
          ("SOM", "Somalia"),
          ("LKA", "Sri Lanka"),
          ("SWZ", "Suazilandia"),
          ("ZAF", "Sudáfrica"),
          ("SDN", "Sudán"),
          ("SWE", "Suecia"),
          ("CHE", "Suiza"),
          ("SUR", "Surinam"),
          ("SJM", "Svalbard y Jan Mayen"),
          ("THA", "Tailandia"),
          ("TWN", "Taiwán"),
          ("TZA", "Tanzania"),
          ("TJK", "Tayikistán"),
          ("IOT", "Territorio Británico del Océano Índico"),
          ("ATF", "Territorios Australes Franceses"),
          ("TLS", "Timor Oriental"),
          ("TGO", "Togo"),
          ("TKL", "Tokelau"),
          ("TON", "Tonga"),
          ("TTO", "Trinidad y Tobago"),
          ("TUN", "Túnez Túnez"),
          ("TCA", "Islas Turcas y Caicos"),
          ("TKM", "Turkmenistán"),
          ("TUR", "Turquía"),
          ("TUV", "Tuvalu"),
          ("UKR", "Ucrania"),
          ("UGA", "Uganda"),
          ("URY", "Uruguay"),
          ("UZB", "Uzbekistán"),
          ("VUT", "Vanuatu"),
          ("VAT", "Ciudad del Vaticano"),
          ("VEN", "Venezuela"),
          ("VNM", "Vietnam"),
          ("VGB", "Islas Vírgenes Británicas"),
          ("VIR", "Islas Vírgenes Estadounidenses"),
          ("WLF", "Wallis y Futuna"),
          ("YEM", "Yemen"),
          ("DJI", "Yibuti"),
          ("ZMB", "Zambia"),
          ("ZWE", "Zimbabue"))


    ESTADOS_CIVILES = (('ND', 'no determinado'),
                       ('SO', 'soltero'),
                       ('CA', 'casado'),
                       ('VI', 'viudo'),
                       ('SL', 'separado legal'),
                       ('SH', 'separado de hecho'),
                       ('DI', 'divorciado'),
                       ('CO', 'conviviente'))

    SEXOS = (('M', 'masculino'),
             ('F', 'femenino'),
             ('I', 'no determinado'))

    TIPOS_DOCUMENTO = (('DU', 'documento unico'),
                       ('ND', 'no determinado'),
                       ('LE', 'libreta de enrolamiento'),
                       ('LC', 'libreta cívica'),
                       ('PA', 'pasaporte'),
                       ('CE', 'cédula federal'),
                       ('CM', 'certificado migratorio'),
                       ('ET', 'en trámite'))

    apellido = models.CharField(max_length=128)
    nombre = models.CharField(max_length=128)
    tipo_documento = models.CharField(max_length=2,choices=TIPOS_DOCUMENTO,default='DU')
    numero_documento = models.IntegerField(verbose_name='N de Doc ',blank=True,null=True,default=0)
    doc_cons = models.BooleanField(default=False,verbose_name='Doc Consolidado')	
    dtpacid = models.CharField(max_length=36,blank=True,null=True,verbose_name='NDTech')
    fecha_nacimiento = models.DateField()
    estado_civil = models.CharField(max_length=2, choices=ESTADOS_CIVILES,blank=True,null=True)
    sexo = models.CharField(max_length=1,choices=SEXOS,default='F')
    nacionalidad = models.CharField(max_length=36,choices=PAISES,default='ARG')
    provincia = models.CharField(max_length=2,choices=PROVINCIAS,default='13')
    localidad = models.ForeignKey('Localidad',blank=True,null=True)
    csr = models.ForeignKey('Centrosalud',blank=True,null=True,verbose_name='Centro de Salud')	
    domicilio = models.CharField(max_length=128, blank=True)
    telefono = models.CharField(max_length=64, blank=True)
    email = models.EmailField(blank=True)
    domicilio_trabajo = models.CharField(blank=True, default='No Registrado',max_length=128)
    comentarios=models.TextField(blank=True,null=True,default='No comentarios')
    fecha_creacion = models.DateTimeField(auto_now_add = True,null=True,blank=True)
    fecha_modificacion = models.DateTimeField(auto_now = True,null=True,blank=True)
    dtlocalidad = models.CharField(max_length=64,verbose_name='DTloc',blank=True,null=True)

    def EdadActual(self):
        #fecha_nula = datetime.strptime('0000-00-00', "%Y-%m-%d")
        if self.fecha_nacimiento:
            today = date.today()
            return today.year - self.fecha_nacimiento.year - ((today.month, today.day) < (self.fecha_nacimiento.month, self.fecha_nacimiento.day))
        else:
            return "N/D"

    class Meta:
	db_table = 'oytred_pacientes'

class Centrosalud(models.Model):
    TIPOCS = (('PRV', 'provincial'),
             ('MNC', 'municipal'),
             ('NCN', 'nacional'),
             ('N/D', 'no determinado'))
    nombre = models.CharField(max_length=128)
    sigla = models.CharField(max_length=8,default='CS...')
    distrito = models.ForeignKey('Distrito',blank=True,null=True)
    refdtt = models.CharField(max_length = 6,blank=True,verbose_name='Sigla efector DT')
    referente = models.CharField(max_length=64,blank=True,null=True)
    tipo = models.CharField(max_length=3,choices=TIPOCS,default = 'MNC')
    telefono = models.CharField(max_length=16,blank=True)
    domicilio = models.CharField(max_length=128,blank=True)
    comentarios = models.TextField(blank=True,null=True)

    class Meta:
	db_table = 'oytred_centros_de_salud'

class Distrito(models.Model):
    nombre = models.CharField(max_length=32,default = 'distrito municipal ....')
    sigla = models.CharField(max_length=8,default = 'DM')
    responsable = models.CharField(max_length=64,default='j j d.....')
    cmd = models.CharField(max_length=64,default='CMD ......')
    comentarios = models.TextField(default='Registro detalles')	

    class Meta:
	db_table = 'oytred_distritos_municipales'

class PracticaQ(models.Model):
    GRUPOSPQ = (('NC','no clasificado'),
                ('RDS','reducciones simples'),
                ('RDF','reducciones y fijacion con clavijas'),
                ('ATA','artroplastias'),
                ('NTVRF','rafias'),
        	('OSDF','osteosintesis diafisarias'),
        	('MIPO','osteosintesis con placas mini invasivas'),
        	('OSPA','osteosintesis paraarticulares'),
        	('XTIM','extraccion implantes'),
        	('NCNM','enclavijados endomedulares'),
                ('TTHS','toiletes heridas'),
                ('TTFE','toiletes fx expuestas'))
    grupopq = models.CharField(choices=GRUPOSPQ,max_length=6,null=True,blank=True)
    descripcion = models.CharField(max_length=64)
    codigo = models.CharField(max_length=8)
    descripcion = models.CharField(max_length=128)

    class Meta:
	db_table = 'oytred_practicas'



class Grupo(models.Model):
    servicio = models.ForeignKey("Servicio")    
    nombre = models.CharField(max_length=32)
    sigla = models.CharField(max_length=9)
    descripcion = models.TextField(blank=True)
    hospital = models.ForeignKey('Institucion',blank=True,verbose_name='Hospital/INstitucion',default=1)

    class Meta:
	db_table = 'oytred_grupos_profesionales'


class Categorizacion(models.Model):
    nombre = models.CharField(max_length=32)
    sigla = models.CharField(max_length=8)
    detalle = models.CharField(max_length=128)

    class Meta:
	db_table = 'oytred_categorias_profesionales'

class cie10(models.Model):
    GRUPOSDG = (('NC','no clasificado'),
                ('TRMT','traumatologico'),
                ('RSPT','respiratorio'),
                ('GSTN','gastrointestinal'),
                ('NFUR','nefrourologico'),
                ('SNCO','sistema nervioso'),
                ('CVSC','cardiovascular'))


    grupodg = models.CharField(choices=GRUPOSDG,max_length=4,null=True,blank=True)
    categoria = models.CharField(max_length=32,null=True,blank=True)
    descripcion = models.CharField(max_length=64)
    codigo = models.CharField(max_length=8)
    comentarios = models.CharField(max_length=128,null=True,blank=True)
    habilitado = models.NullBooleanField(blank=True,null=True,default=False)

    class Meta:
	db_table = 'oytred_cie10'

class AOclasif(models.Model):
    descripcion = models.CharField(max_length=64)
    codigo = models.CharField(max_length=8)
    comentarios = models.CharField(max_length=128)

    class Meta:
	db_table = 'oytred_AO_clasificacion'

class Dieta(models.Model):
    nombre = models.CharField(max_length=128)
    sigla = models.CharField(max_length=6)
    descripcion = models.TextField(blank=True)

    class Meta:
	db_table = 'oytred_dietas'

class Licitacion(models.Model):

    TIPOS_LICITACION = (('RPURG', 'URGENTE REPOSICION'),
                        ('PPURG', 'URGENTE P PACIENTE'),
                   ('LPER', 'LICITACION PERIODICA'),
                   ('N/C', 'NO CLASIFICADO'))

    tipo_de_licitacion = models.CharField(choices=TIPOS_LICITACION, max_length=12,verbose_name='Tipo de Licitacion',default='PERIODICA')
    institucion = models.ForeignKey('Institucion',default=1)	
    servicio = models.ForeignKey('Servicio',blank=True,null=True,db_column='servicio',verbose_name='Servicio')
    nombre = models.CharField(max_length=64,verbose_name='N licitacion',default='ddmmmyyyy')
    por_paciente =models.ForeignKey('Paciente',null=True,blank=True)
    por_internacion= models.ForeignKey('Internacion',null=True,blank=True,db_column='por_internacion',verbose_name='Internacion')
    fecha_carga = models.DateField()
    fecha_solicitud = models.DateField(verbose_name='Fecha Solicitud',db_column='fecha_solicitud',blank=True,null=True)
    fecha_apertura = models.DateField(verbose_name='Fecha Apertura',blank=True,null=True)
    fecha_pre_adjudicacion = models.DateField(verbose_name='Fecha Pre Adjudicacion',blank=True,null=True)
    detalles = models.TextField(verbose_name='Comentarios')
    codred = models.CharField(max_length=20)
    estado = models.IntegerField()
    fecha_fdir = models.DateField()
    fecha_fcont = models.DateField()
    fecha_cierre = models.DateField()
    hora_cierre = models.TimeField(blank=True,null=True)
    fecha_cirugia = models.DateField()
    diagnostico = models.ForeignKey('Diagnostico',null=True,blank=True)
    prof_sol =models.ForeignKey('Profesional',null=True,blank=True)

    class Meta:
	db_table = 'oytred_licitaciones'

class ItemLic_solicitado(models.Model):
    licitacion = models.ForeignKey('Licitacion')
    implante_sol = models.ForeignKey('Implante_generico',verbose_name='Item Solicitado')
    #implante_sol = models.ForeignKey('Tipo_implante',verbose_name='Item Solicitado')
    cantidad = models.IntegerField(verbose_name='cantidad de elementos')
    detalles = models.TextField(default='Con Asistencia Tecnica')	
    adjudicado = models.ForeignKey('ItemLic_ofrecido',null=True,blank=True)
    comentarios = models.TextField(blank=True)
    precio_ref = models.TextField(blank=True)
    grupoestad = models.ForeignKey('Grupo_estad_implante',blank=True,null=True)

    def devOfertas(self):
	o = ItemLic_ofrecido.objects.filter(implante_sol__id=self.id)
	return o

    class Meta:
	db_table = 'oytred_items_licitacion_solicitados'

class ItemLic_ofrecido(models.Model):
    licitacion = models.ForeignKey('Licitacion')
    implante_sol = models.ForeignKey('ItemLic_solicitado',verbose_name='Item Solicitado')
    #implante_comercial = models.ForeignKey('Implante_comercial')
    marca = models.ForeignKey('MarcaImplante')
    proveedor = models.ForeignKey('Provedor')
    cantidad = models.IntegerField(verbose_name='Cantidad ')	
    valor_unitario = models.IntegerField(verbose_name='Valor en pesos por unidad')
    seleccionado = models.IntegerField()
    comentarios = models.TextField(blank=True)
    texto_asignacion = models.TextField(blank=True)

    def devOfertas(self):
        i = ItemLic_ofrecido.objects.filter(licitacion=self.licitacion)        
        #c = Cirugia.objects.filter(paciente__id=self.paciente.id)
        return c

    class Meta:
	db_table = 'oytred_items_licitacion_ofrecidos'

class Implante_comercial(models.Model):
    generico = models.ForeignKey('Implante_generico',verbose_name='Generico')	
    sigla = models.CharField(max_length=16)
    nombre = models.CharField(max_length=64)
    marca = models.CharField(max_length=36)
    modelo = models.CharField(max_length=64,blank=True,null=True)	
    detalles = models.TextField(verbose_name='Caracteristicas del Implante',blank=True)
    provedor = models.ForeignKey('Provedor',null=True)

    class Meta:
	db_table = 'oytred_implantes_comerciales'

class Implante_generico(models.Model):
    tipo = models.ForeignKey('Tipo_implante')
    sigla = models.CharField(max_length=16)
    nombre = models.CharField(max_length=128)
    detalles = models.TextField(verbose_name='Caracteristicas del Implante',blank=True)

    class Meta:
	db_table = 'implantes_genericos'

class Tipo_implante(models.Model):
	nombre = models.CharField(max_length=32)
	sigla = models.CharField(max_length=8)
	detalle = models.TextField(blank=True)
        padre = models.ForeignKey('self',blank=True)
	class Meta:
	    db_table = 'oytred_tipos_implante'

class Grupo_estad_implante(models.Model):
	nombre = models.CharField(max_length=32)
	sigla = models.CharField(max_length=8)
	detalle = models.TextField(blank=True)

	class Meta:
	    db_table = 'oytred_grupo_estadistico_implante'

class Enfermero(models.Model):
    GRUPOSFR = (('NC','no clasificado'),
                ('JFSL','jefe de sala'),
                ('LCNJ','supervisor'),
                ('EFSL','enfermero de sala'),
                ('EFTI','enfermero de criticos'),
                ('EFGD','enfermero de guardia'),
                ('EFQM','enfermero de quemados'))
    grupoff = models.CharField(choices=GRUPOSFR,max_length=4,null=True,blank=True,verbose_name='Grupo Enfermeria')
    matricula = models.CharField(max_length=16)
    apellido = models.CharField(max_length=128)
    nombre = models.CharField(max_length=128)
    domicilio = models.CharField(max_length=128, null=True, blank=True)
    telefono = models.CharField(max_length=16, null=True, blank=True)
    celular = models.CharField(max_length=16, blank=True)
    email = models.EmailField(blank=True)
    activo = models.BooleanField(default=True)

    class Meta:
	db_table = 'oytred_enfermeros'

class Localidad(models.Model):
    nombre = models.CharField(max_length=64)
    codigo = models.IntegerField()

    class Meta:
	db_table = 'oytred_localidades'

class Provedor(models.Model):
    sigla = models.CharField(max_length=16)
    nombre = models.CharField(max_length=128)
    referente = models.CharField(max_length=128)
    detalles = models.TextField()
    domicilio = models.CharField(max_length=128, null=True, blank=True)
    telefono = models.CharField(max_length=16, null=True, blank=True)
    celular = models.CharField(max_length=16, blank=True)
    email = models.EmailField(blank=True)
    cuit = models.CharField(max_length=18,null=True,blank=True)

    class Meta:
	db_table = 'oytred_provedores'

class Modulo(models.Model):
    nombre = models.CharField(max_length=80)
    
    class Meta:
        db_table="oytred_modulos"

class GruposUsuario(models.Model):
    nombre = models.CharField(max_length=80)
    estado = models.IntegerField()
    pinicio = models.CharField(max_length=128)

    class Meta:
        db_table = "oytred_gruposUsuario"

class Permiso(models.Model):
    nombre = models.CharField(max_length=80)

    class Meta:
        db_table = "oytred_permisos"

class Formulario(models.Model):
    nombre = models.CharField(max_length=80)
    href= models.CharField(max_length=128)
    modulo = models.ForeignKey("Modulo")

    class Meta:
        db_table = "oytred_formularios"

class Perfil(models.Model):
    formulario = models.ForeignKey("Formulario")
    permiso = models.ForeignKey("Permiso")
    grupo = models.ForeignKey("Grupo")

    class Meta:
        db_table = "oytred_perfiles"

class Evolucion(models.Model):
    fecha = models.DateTimeField()
    profesional = models.ForeignKey("Profesional")
    texto = models.TextField()
    content_type = models.ForeignKey(ContentType)
#    object_id = models.PositiveIntegerField()
#    content_object = generic.GenericForeignKey('content_type', 'object_id')
    
    class Meta:
        db_table = "evoluciones"


class Consulta(models.Model):
    fecha = models.DateTimeField()
    paciente = models.ForeignKey("oytred.Paciente")
    profesional = models.ForeignKey("oytred.Profesional")
#    texto = models.TextField()
    obscl = models.ForeignKey("entornos.Obrasocial",null=True,blank=True,verbose_name="Obra Social")
    comentarios = models.TextField(default ="Hallazgos",verbose_name="Comentarios y Hallazgos")
#    servicio = models.ForeignKey("Servicio")
    internacion = models.ForeignKey("Internacion")
    #content_type = models.ForeignKey(ContentType)
    #object_id = models.PositiveIntegerField()
    #content_object = generic.GenericForeignKey('content_type', 'object_id')
    
    class Meta:
        db_table = "aconsultorio_consultas"

class EvolucionCardio(models.Model):
    evolucion = models.ForeignKey("Evolucion")
    txtDSEF = models.TextField()
    txtCET = models.TextField()
    txtECG = models.TextField()
    txtESF = models.TextField()
    txtCI = models.TextField()
    
    class Meta:
        db_table = "oytred_evolCardio"


class GruposxUsuario(models.Model):
    usuario = models.ForeignKey(User)
    grupo = models.ForeignKey(GruposUsuario)
    class Meta:
        db_table = "oytred_gruposxusuarios"

class Nacionalidad(models.Model):
    nombre = models.CharField(max_length=80)
    
    class Meta:
	db_table = "oytred_nacionalidades"

class AdicionalesUsuario(models.Model):
    usuario = models.ForeignKey(User)
    nacionalidad = models.ForeignKey(Nacionalidad)
    tipodoc = models.CharField(max_length=5)
    nrodoc = models.PositiveIntegerField()
    gprincipal = models.ForeignKey(GruposUsuario)
    
    class Meta:
	db_table = "oytred_adicionales_usuarios"

class LugarTrabajoProfesional(models.Model):
    profesional = models.ForeignKey('Profesional')
    institucion = models.ForeignKey('Institucion')
    servicio = models.ForeignKey('Servicio')
 
    class Meta:
	db_table = 'lugarestrabajoprof'

class LugarTrabajoUsuario(models.Model):
    usuario = models.ForeignKey(User)
    institucion = models.ForeignKey('Institucion')
 
    class Meta:
	db_table = 'oytred_lugarestrabajousu'

#class HCEPersona(models.Model):
#    fecha = models.DateTimeField()
##    paciente = models.ForeignKey('Paciente')
#    content_type = models.ForeignKey(ContentType)
#    object_id = models.PositiveIntegerField()
#    content_object = generic.GenericForeignKey('content_type', 'object_id')
#
#    class Meta:
#        db_table = "oytred_hcepersona"
#
class Sala(models.Model):
    institucion = models.ForeignKey('Institucion')
    nombre = models.CharField(max_length=80)
    orden = models.IntegerField()

    class Meta:
	db_table = "oytred_salas"

class Camas(models.Model):
    sala = models.ForeignKey('Sala')
    nombre = models.CharField(max_length=80)
 
    class Meta:
	db_table = "oytred_camas"

class Lista_de_espera(models.Model):
    ###timestamp = models.DateTimeField(auto_now_add=True)
    nombre = models.CharField(max_length=64)
    fecha_creacion = models.DateField(verbose_name ='Fecha Creacion')

    comentarios = models.TextField(verbose_name='Comentarios',default='Registro')

    ###profesional_a_cargo = models.ForeignKey('controlmedico.Profesional',verbose_name='Profesional a cargo')
    ###residente_a_cargo = models.ForeignKey('controlmedico.Medico_en_formacion',blank=True,null=True,verbose_name='Residente encargado')
    pacargo = models.ForeignKey('Profesional',related_name='lep',verbose_name='A Cargo')
    payudante = models.ForeignKey('Profesional',related_name='lepay',verbose_name='Residente',null=True,blank = True)

    class Meta:
	db_table = "oytred_listas_de_espera"

class MultimediaInternacion(models.Model):
    archivo = models.CharField(max_length=255)
    internacion = models.ForeignKey('Internacion')
    usuario = models.ForeignKey(User)
    fecha = models.DateField()
    texto = models.TextField()
  
    class Meta:
	db_table = "oytred_multimediaxint"

class Caso_pendiente(models.Model):
    resuelto = models.BooleanField(verbose_name='RESUELTO',default=False)   
    qcgresol = models.ForeignKey('Cirugia',blank=True,null=True,verbose_name='Cirugia Resolvente')
    paciente = models.ForeignKey('Paciente')
    internacion = models.ForeignKey('Internacion',blank=True,null=True)
    fecha_trauma = models.DateField(verbose_name ='Fecha Trauma',blank=True,null=True)
    listado_espera = models.ForeignKey('Lista_de_espera',blank=True,null=True)
    fecha_registro = models.DateField(verbose_name='Fecha Registro')
    ###hora_registro =models.TimeField(verbose_name='Hora',blank=True,null=True)
    fecha_pre_quirurgico = models.DateField(verbose_name ='Fecha PRE Q',blank=True,null=True)

    timestamp = models.DateTimeField(auto_now_add=True)
    fecha_resolucion = models.DateField(verbose_name ='Fecha Resolucion',blank=True,null=True)
    informe = models.TextField(verbose_name='Registro',default='Comentarios del Caso')

    pacargo = models.ForeignKey('Profesional',related_name='cppp',verbose_name='ProfResp')
    payudante = models.ForeignKey('Profesional',related_name='cppa',verbose_name='Residente',null=True,blank = True)
     		
    intediag = models.CharField(verbose_name='Clave busqueda',max_length=64)
    diagnos_a = models.ForeignKey('Diagnostico',related_name='gdiagnosticoP',db_column='diagnos_a',verbose_name='Diagnostico principal',blank=True,null=True)
    #diagnostico_secundario = models.ForeignKey('Diagnostico',related_name='gdiagnosticoB',db_column='diagnos_b',verbose_name='Diagnostico secundario',blank=True,null=True)
    #diagnostico_terciario = models.ForeignKey('controlmedico.Diagnostico',related_name='gdiagnosticoT',db_column='diagnos_c',verbose_name='Diagnostico Terc',blank=True,null=True)

    img1=models.ImageField(upload_to='cpds/%Y/%m', blank=True,help_text="Busque archivo de imagen...")
    img2=models.ImageField(upload_to='cpds/%Y/%m', blank=True,help_text="Busque archivo de imagen...")

    def devCirugias(self):
	c = Cirugia.objects.filter(paciente__id=self.paciente.id)
	return c

    def devInternaciones(self):
	i = Internacion.objects.filter(paciente__id=self.paciente.id)
	return i	

    class Meta:
        db_table = 'oytred_casos_pendientes'

class AgrupadorEstudios(models.Model):
    nombre=models.CharField(max_length=80)
    tipo=models.IntegerField()
    class Meta:
        db_table = 'oytred_agrupadoresestudios'

class ItemsEstudios(models.Model):
    cod=models.CharField(max_length=10)
    nombre=models.CharField(max_length=80)
    tipo=models.IntegerField()
    estado=models.IntegerField()
    agrupador = models.IntegerField()
    auditado = models.IntegerField()
    categoria = models.CharField(max_length=10)
    class Meta:
        db_table = 'oytred_itemsestudios'

class MarcaImplante(models.Model):
    sigla = models.CharField(max_length=16)
    nombre = models.CharField(max_length=128)
    detalles = models.TextField(verbose_name='',blank=True)

    class Meta:
	db_table = 'oytred_marcas_implantes'

class ItemStockUtilizado(models.Model):
    item_solicitado = models.ForeignKey('ItemLic_solicitado')
    cirugia = models.ForeignKey('Cirugia')
    cantidad = models.IntegerField()
    largo= models.IntegerField()
    licitacion = models.ForeignKey('Licitacion')
    diametro = models.IntegerField()
    
    class Meta:
	db_table = "oytred_items_stock_utilizados"

class StockTraumato(models.Model):
    item_solicitado = models.ForeignKey('ItemLic_solicitado')
    item_ofrecido = models.ForeignKey('ItemLic_ofrecido')
    licitacion = models.ForeignKey('Licitacion')
    cantidad = models.IntegerField()
    material = models.ForeignKey('Implante_generico')
    
    
    class Meta:
	db_table = "oytred_stocktraumato"



class Hallazgoguardia(models.Model):
    sistema = models.CharField(max_length=2)
    hallazgo = models.CharField(max_length=60)
    color = models.CharField(max_length=10)
    prioridad = models.IntegerField()
    estado = models.IntegerField()
    
    
    class Meta:
	db_table = "oytred_hallazgosguardia"

    
    

