# -*- coding: utf-8 -*-

###   aca construimos aplicacion zcons. models.py 
###  para aplicacion consultorio mvidal y baccijavier. 

from __future__ import unicode_literals


from django.db import models
from django.db import connection
from django.contrib.auth.models import User
from datetime import datetime, date
from django.contrib.contenttypes.models import ContentType

#horahoy=datetime.date.now()
#diadehoy=datetime.date.today()
def diayhora():
    dyh=datetime.now()
    dyh=dyh.strftime('%a %d de %B de %Y - %H:%M')    
    return str(dyh)
 

class Especialidad(models.Model):
    nombre = models.CharField(max_length=32)
    codigo = models.CharField(max_length=8)

    class Meta:
        db_table = 'zcons_especialidades'


class Obrasocial(models.Model):
    nombre = models.CharField(max_length=32)
    codigo = models.CharField(max_length=8)

    class Meta:
        db_table = 'zcons_obscs'

class Profesional(models.Model):
    matricula = models.CharField(max_length=16,blank=True,null=True,verbose_name = 'Matricula Profesional')
    apellido = models.CharField(max_length=28,verbose_name = 'Apellido')
    nombre = models.CharField(max_length=28,verbose_name = 'Nombre')
    tipodoc = models.CharField(max_length=5,default='DNI',verbose_name = 'Tipo Documento')
    nrodoc = models.IntegerField(default='0',verbose_name='Numero DNI')
    matricula = models.CharField(max_length=16,default='ABC123',verbose_name='Matricula')
#    nacionalidad = models.ForeignKey('Nacionalidad',null=True)
#    hospital = models.ForeignKey('Institucion',null=True,blank=True,verbose_name='Referencia Institucional')
#    grupo = models.ForeignKey('Grupo',null=True,blank=True,verbose_name='Grupo Prof')
    #csr = models.ForeignKey('Centrosalud',blank=True,null=True)
#    grupotpt = models.ForeignKey('Grupoterapeutico',blank=True,null=True)
#    delared = models.BooleanField(default=True,verbose_name='Revista en la Red')
#    cargahs = models.IntegerField(null=True,blank=True,verbose_name='Horas Semanales en Inst Ref')
    especialidad = models.ManyToManyField('Especialidad',blank=True,verbose_name='Especialidad')
    etiqueta= models.CharField(max_length=128,null=True,blank=True,default='Etiq..',verbose_name='Etiqueta')
    domicilio = models.CharField(max_length=128, null=True, blank=True,verbose_name = 'Domicilio')
    telefono = models.CharField(max_length=52, null=True, blank=True,verbose_name = 'Telefonos')
    #celular = models.CharField(max_length=16, blank=True)
    email = models.EmailField(default='algo_yotracosa@gmail.com',verbose_name = 'Dir de E Mail')
    #cuit = models.CharField(max_length=16,null=True,blank=True)
    activo = models.BooleanField(default=True)
    #tipo = models.CharField(max_length=2,blank=True)
#    dtid=models.IntegerField(null=True,blank=True,editable=False)
    comentarios = models.TextField(null=True,blank=True,verbose_name='Comentarios')

    class Meta:
        db_table = 'zcons_profesionales'

class GruposVrb(models.Model):
    nombre = models.CharField(max_length=56,default='GrupoV....',verbose_name = 'Nombre Grupo')
    codigo = models.CharField(max_length=10,default= 'GVLAB',verbose_name = 'Codigo Grupo')

    class Meta:
        db_table = 'zcons_gruposvrb'
  
class Variable(models.Model):
    grupo_variable=models.ForeignKey('GruposVrb',default=0,verbose_name='Grupo VB')      
    nombre = models.CharField(max_length=54,default='..vg..Presion Arterial..gLICEMIa..',verbose_name='Nombre del Parametro')
    codigo = models.CharField(max_length=28,default='Codigo123........',verbose_name = 'Codigo')
    comentarios = models.CharField(max_length=256,default='Valores Normales hasta .....',verbose_name='Comentarios')
    class Meta:
        db_table = 'zcons_variables'
 
class Reg_variable(models.Model):
    fecha_reg = models.DateTimeField(default=datetime.now(),verbose_name='Resultado P Ex')   
    paciente = models.ForeignKey('Paciente',verbose_name = 'Paciente')
    nomvrb = models.ForeignKey('Variable',verbose_name ='Variable ')
    valorvrb = models.CharField(max_length=64,default='ABC123...',verbose_name='Valor')
    comentarios = models.CharField (max_length=128,default='Coment....',verbose_name = 'Comentario' ) 

class Diagnostico(models.Model):
    GRUPOSDG = (('NC','no clasificado'),
                ('TRMT','traumatologico'),
                ('RSPT','respiratorio'),
                ('GSTN','gastrointestinal'),
                ('NFUR','nefrourodjango.contrib.contenttypeslogico'),
                ('SNCO','sistema nervioso'),
                ('CVSC','cardiovascular'))
    cie10 = models.ForeignKey('cie10',null=True,blank=True,verbose_name='ref Cie 10')
    #AOclasif = models.ForeignKey('AOclasif',null=True,blank=True,verbose_name='AO clasificacion')   
    grupodg = models.CharField(choices=GRUPOSDG,default='NC',max_length=4,null=True,blank=True)
    descripcion = models.CharField(max_length=64)
    codigo = models.CharField(max_length=12)
    comentarios = models.CharField(max_length=128,blank=True,null=True)
    habilitado = models.NullBooleanField(blank=True,null=True,default=False)

    class Meta:
        db_table = 'zcons_diagnosticos'
    
### Internaciones
class Internacion(models.Model):
    
    PROBLEMATICA = ((u'YNDT', u'no determinado'),
                       (u'YUR', u'INTERNACION URGENCIA'),
                       (u'YPG', u'INTERNACION PROGRAMADA'))

    hospital = models.ForeignKey('Institucion')
    hclint = models.CharField(max_length=16,default='HC123456789ABC..',verbose_name='Historia Clinica')
    sala =  models.CharField(max_length=64,default='NO DETERMINADA',verbose_name='Sala')
    cama = models.CharField(max_length = 12 ,blank=True, null =True,verbose_name = 'Cama')
    #servicio = models.ForeignKey('Servicio',verbose_name='Servicio')
    #grupo = models.ForeignKey('Grupo',blank=True,null=True,verbose_name='Grupo a Cargo')      
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
    #enfermero = models.ForeignKey('Enfermero',null=True,blank=True)
    germen = models.CharField(verbose_name='Germen pr.',max_length=36,null=True,blank=True)
    lab = models.TextField(verbose_name='laboratorio',default="Laboratorios")
    diagnostico_principal = models.ForeignKey('Diagnostico',related_name='YdiagnosticoP',verbose_name='Diagnostico principal',blank=True,null=True)
    diagnostico_secundario = models.ForeignKey('Diagnostico',related_name='YdiagnosticoB',verbose_name='Diagnostico secundario',blank=True,null=True)
    diagnostico_terciario = models.ForeignKey('Diagnostico',related_name='YdiagnosticoT',verbose_name='Diagnostico Terc',blank=True,null=True)
    diagnostico_cuarto = models.ForeignKey('Diagnostico',related_name='YdiagnosticoC',verbose_name='Diagnostico Cuart',blank=True,null=True)
    #dieta = models.ForeignKey('Dieta',blank=True,null=True)
    informe = models.TextField(blank=True,verbose_name='Informe Historia Clinica')
    img1=models.ImageField(upload_to='internaciones/%Y/%m',blank=True,help_text="Archivo de imagen...")
    img2=models.ImageField(upload_to='internaciones/%Y/%m',blank=True,help_text="Archivo de imagen")    
    img3=models.ImageField(upload_to='internaciones/%Y/%m',blank=True,help_text="Archivo de imagen")    
    hora_internacion = models.TimeField(auto_now_add=True)
    texto_epicrisis = models.TextField(default='Condicion y Propuesta al alta ....',verbose_name='Texto Epicrisis')

    def devCama(self):
        c = Camas.objects.get(pk=self.cama)
        return c

    class Meta:
        db_table = 'zcons_internaciones'

class Consulta(models.Model):
    TIPOVEZ = (('NDTM', 'no determinado'),
                       ('PRV', 'Primera Vez'),
                       ('ULT', 'Ulterior'),)

    institucion = models.ForeignKey('Institucion',verbose_name='Institucion')
    obra_social = models.ForeignKey('ObraSocial',verbose_name='Obra Social',blank=True,null=True)  
    num_afiliado = models.CharField(max_length=12,null=True,blank=True,verbose_name='N de Afiliado')
    cod_cons = models.CharField(max_length=16,default = 'CODIGO',verbose_name = 'CODIGO de Consulta')
    coseguro = models.CharField(max_length=128,default = 'Coseguro $',verbose_name = 'Coseguro')
    #internacion = models.ForeignKey('Internacion',blank=True,null=True,verbose_name='Cons en Internacion')
    #quirofano = models.CharField(max_length=4,verbose_name='QUIROFANO',blank=True,null=True)
    fecha_consulta = models.DateField(verbose_name='Fecha de Consulta')
    fecha_recitacion = models.DateField(blank=True,null=True,verbose_name='Fecha Recitacion')
    evaluacion = models.TextField(default=diayhora,verbose_name='Evaluacion')
    indicaciones = models.TextField(default = 'Indicaciones. ...Medicacion....Laboratorio.....')
    hora_consulta = models.TimeField(blank=True,null=True)
    #hora_fin_cirugia = models.TimeField(blank=True,null=True)
    paciente = models.ForeignKey('Paciente',verbose_name='Paciente')
    #clavecirugia = models.CharField(max_length=48,verbose_name='ClaveQ',default='cirugia')
    tipo = models.CharField(choices=TIPOVEZ,default='PRV',max_length=4,null=True,blank=True)
    prof = models.ForeignKey('Profesional',related_name='prof_consultor',verbose_name='Consultor')
    #payudante = models.ForeignKey('Profesional',related_name='ayudante',verbose_name='Ayudante 1',null=True,blank = True)
    interconsultante = models.ForeignKey('Profesional',null=True,blank=True,related_name='prof_consultante',verbose_name='PEDIDA X')
    #anestesista = models.ForeignKey('Profesional',related_name='anestesista')
    informe = models.TextField(default='Comentarios...',verbose_name='Texto Consulta')
    diagnostico_principal = models.ForeignKey('Diagnostico',related_name='diagnosticoP',verbose_name = 'Diagnostico')
    diagnostico_B = models.ForeignKey('Diagnostico',related_name='diagconsB',blank=True,null=True,verbose_name = 'Dg B')
    diagnostico_C = models.ForeignKey('Diagnostico',related_name='diagconsC',blank=True,null=True,verbose_name = 'Dg C')
    diagnostico_D = models.ForeignKey('Diagnostico',related_name='diagconsD',blank=True,null=True,verbose_name = 'Dg D')
    practica_principal = models.ForeignKey('PracticaQ',related_name='practicaP',blank=True,null=True)
    practica_B = models.ForeignKey('PracticaQ',related_name='practicaB',blank=True,null=True)
    practica_C = models.ForeignKey('PracticaQ',related_name='practicaC',blank=True,null=True)
    practica_D = models.ForeignKey('PracticaQ',related_name='practicaD',blank=True,null=True)
    #implante_a = models.ForeignKey('ItemLic_solicitado',related_name='ItsA',blank=True,null=True,db_column='implante_a',verbose_name="ITLICA")

    class Meta:
        db_table = 'zcons_consultas'


class Solic_labs(models.Model):
    profesional=models.ForeignKey('Profesional',verbose_name='Prof Solicitante')
    paciente=models.ForeignKey('Paciente',verbose_name='Paciente')
    obrasocial=models.ForeignKey('Obrasocial',null=True,blank=True,verbose_name='Obra Social')
    examenes = models.ManyToManyField('Variable',verbose_name='Examenes')
    class Meta:
        db_table = 'zcons_solic_labs'       


class Cirugia(models.Model):
    PROBLEMATICA = (('NDTM', 'no determinado'),
                       ('QUR', 'CIRUGIA URGENCIA'),
                       ('QPG', 'CIRUGIA PROGRAMADA'),)
    hospital = models.ForeignKey('Institucion',verbose_name='Institucion',default=1)
    #servicio = models.ForeignKey('Servicio',verbose_name='ServicioQ',blank=True,null=True)  
    internacion = models.ForeignKey('Internacion',blank=True,null=True)
    #quirofano = models.CharField(max_length=4,verbose_name='QUIROFANO',blank=True,null=True)
    fecha_consulta = models.DateField()
    hora_consulta = models.TimeField(blank=True,null=True)
    #hora_fin_cirugia = models.TimeField(blank=True,null=True)
    paciente = models.ForeignKey('Paciente',verbose_name='Paciente')
    #clavecirugia = models.CharField(max_length=48,verbose_name='ClaveQ',default='cirugia')
    tipo = models.CharField(choices=PROBLEMATICA,max_length=4,null=True,blank=True)
    consultado = models.ForeignKey('Profesional',related_name='pcirujano',verbose_name='Cirujano')
    payudante = models.ForeignKey('Profesional',related_name='ayudante',verbose_name='Ayudante 1',null=True,blank = True)
    sayudante = models.ForeignKey('Profesional',null=True,blank=True,related_name='sayudante',verbose_name='Ayudante2')
    anestesista = models.ForeignKey('Profesional',related_name='anestesista')
    informe = models.TextField(blank=True)
    diagnostico_principal = models.ForeignKey('Diagnostico',related_name='diagcgP',blank=True,null=True)
    diagnostico_B = models.ForeignKey('Diagnostico',related_name='diagcgB',blank=True,null=True)
    diagnostico_C = models.ForeignKey('Diagnostico',related_name='diagcgC',blank=True,null=True)
    diagnostico_D = models.ForeignKey('Diagnostico',related_name='diagcgD',blank=True,null=True)
    practica_principal = models.ForeignKey('PracticaQ',related_name='prqP',blank=True,null=True)
    practica_B = models.ForeignKey('PracticaQ',related_name='prqB',blank=True,null=True)
    practica_C = models.ForeignKey('PracticaQ',related_name='prqC',blank=True,null=True)
    practica_D = models.ForeignKey('PracticaQ',related_name='prqD',blank=True,null=True)

    class Meta:
        db_table = 'zcons_cirugias'

class Institucion(models.Model):
    nombre = models.CharField(max_length=64,unique=True)
    sigla = models.CharField(max_length=8)
    domicilio = models.CharField(max_length=128)
    #codigo_postal = models.ForeignKey('CodigoPostal', blank=True, null=True)
    #categorizacion = models.ForeignKey('Complejidad_institucional',blank=True,null=True)
    email = models.EmailField(blank=True)
    ##web = models.URLField(blank=True, verify_exists=False)
    comentarios = models.TextField(null=True,blank=True,default='N')

    class Meta:
        db_table = 'zcons_instituciones'

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
                       ('CO', 'conviviente'),
                       ('PI','pirata' ))

    SEXOS = (('M', 'masculino'),
             ('F', 'femenino'),
             ('T','Transexual'),
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
    numero_documento = models.IntegerField(verbose_name='N de Doc ',default=0)
    doc_cons = models.BooleanField(default=False,verbose_name='Doc Consolidado')	
    #dtpacid = models.CharField(max_length=36,blank=True,null=True,verbose_name='NDTech')
    fecha_nacimiento = models.DateField(blank=True,null=True,verbose_name='Fecha de Nacimiento')
    estado_civil = models.CharField(max_length=2, choices=ESTADOS_CIVILES,blank=True,null=True)
    sexo = models.CharField(max_length=1,choices=SEXOS,default='I')
    nacionalidad = models.CharField(max_length=36,choices=PAISES,default='ARG')
    provincia = models.CharField(max_length=2,choices=PROVINCIAS,default='13')
    localidad = models.ForeignKey('Localidad',blank=True,null=True)
    csr = models.ForeignKey('Centrosalud',blank=True,null=True,verbose_name='Centro de Salud')	
    domicilio = models.CharField(max_length=128, blank=True)
    telefono = models.CharField(max_length=96,default = '341 .....')
    email = models.EmailField(blank=True)
    domicilio_trabajo = models.CharField(blank=True, default='No Registrado',max_length=128)
    comentarios=models.TextField(blank=True,null=True,default='No comentarios')
    fecha_creacion = models.DateTimeField(auto_now_add = True,null=True,blank=True)
    fecha_modificacion = models.DateTimeField(auto_now = True,null=True,blank=True)
    #dtlocalidad = models.CharField(max_length=64,verbose_name='DTloc',blank=True,null=True)

    def EdadActual(self):
        #fecha_nula = datetime.strptime('0000-00-00', "%Y-%m-%d")
        if self.fecha_nacimiento:
            today = date.today()
            return today.year - self.fecha_nacimiento.year - ((today.month, today.day) < (self.fecha_nacimiento.month, self.fecha_nacimiento.day))
        else:
            return "N/D"

    class Meta:
        db_table = 'zcons_pacientes'

class Centrosalud(models.Model):
    TIPOCS = (('PRV', 'provincial'),
             ('MNC', 'municipal'),
             ('NCN', 'nacional'),
             ('N/D', 'no determinado'))
    nombre = models.CharField(max_length=128)
    sigla = models.CharField(max_length=8,default='CS...')
    #distrito = models.ForeignKey('Distrito',blank=True,null=True)
    refdtt = models.CharField(max_length = 6,blank=True,verbose_name='Sigla efector DT')
    referente = models.CharField(max_length=64,blank=True,null=True)
    tipo = models.CharField(max_length=3,choices=TIPOCS,default = 'MNC')
    telefono = models.CharField(max_length=16,blank=True)
    domicilio = models.CharField(max_length=128,blank=True)
    comentarios = models.TextField(blank=True,null=True)

    class Meta:
        db_table = 'zcons_centros_de_salud'


class PracticaQ(models.Model):
    GRUPOSPQ = (('NC','no clasificado'),
                ('CM','Clinicas'),
                ('CVS','Quirurgicas'),
                ('DG','Diagnosticas'),)
    nombre = models.CharField(max_length=36)
    grupopq = models.CharField(choices=GRUPOSPQ,max_length=6,default='NC')
    descripcion = models.CharField(max_length=128)
    codigo = models.CharField(max_length=8)
    #descripcion = models.CharField(max_length=128)
    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s" % (cod)


    class Meta:
        db_table = 'zcons_practicas'



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
    codigo = models.CharField(default='ABC1234',max_length=10)
    comentarios = models.CharField(max_length=128,null=True,blank=True)
    habilitado = models.NullBooleanField(default=False,verbose_name = 'Habilitado')
    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s" % (cod)


    class Meta:
        db_table = 'zcons_cie10'


class Localidad(models.Model):
    nombre = models.CharField(max_length=64)
    codigo = models.IntegerField()
    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s" % (cod)


    class Meta:
        db_table = 'zcons_localidades'



class Evolucion(models.Model):
    fecha = models.DateTimeField(verbose_name='Fecha Evolucion')
    profesional = models.ForeignKey("Profesional",verbose_name = 'Profesional')
    texto = models.TextField(default = 'Evolucion al .....',verbose_name='Evolucion')
    institucion = models.ForeignKey("Institucion",verbose_name='Institucion')
    especialidad = models.ForeignKey("Especialidad",blank=True,null=True,verbose_name= 'Especialidad')
    internacion = models.ForeignKey("Internacion",verbose_name = 'Internacion')
    #content_type = models.ForeignKey(ContentType)
    #object_id = models.PositiveIntegerField()
    #content_object = generic.GenericForeignKey('content_type', 'object_id')
    
    class Meta:
        db_table = "zcons_evoluciones"

class Sala(models.Model):
    institucion = models.ForeignKey('Institucion')
    nombre = models.CharField(max_length=80)
    orden = models.IntegerField()

    class Meta:
        db_table = "zcons_salas"

class Camas(models.Model):
    sala = models.ForeignKey('Sala')
    nombre = models.CharField(max_length=80)
    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s" % (cod)


    class Meta:
        db_table = "zcons_camas"

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
        db_table = "zcons_listas_de_espera"

##class MultimediaInternacion(models.Model):
##    archivo = models.CharField(max_length=255)
 ##   internacion = models.ForeignKey('Internacion')
 ##   usuario = models.ForeignKey(User)
  ##  fecha = models.DateField()
   ## texto = models.TextField()
 ## 
  ##  class Meta:
##	db_table = "oytred_multimediaxint"

class Caso_pendiente(models.Model):
    resuelto = models.BooleanField(verbose_name='RESUELTO',default=False)   
    qcgresol = models.ForeignKey('Cirugia',blank=True,null=True,verbose_name='Cirugia Resolvente')
    paciente = models.ForeignKey('Paciente')
    internacion = models.ForeignKey('Internacion',blank=True,null=True)
    fecha_trauma = models.DateField(verbose_name ='Fecha Trauma',blank=True,null=True)
    listado_espera = models.ForeignKey('Lista_de_espera',verbose_name = 'Lista de Espera')
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
    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s" % (cod)


    class Meta:
        db_table = 'zcons_casos_pendientes'
### ampollas supositorios comprimidos capsulas 
class Presentacion():
    nombre=models.CharField(max_length=32,verbose_name = 'Nombre Presntcn')
    codigo=models.CharField(max_length=16)

    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s" % (cod)

    class Meta:
        verbose_name_plural = 'Presentaciones FRM'
        verbose_name = 'Presentacion'
        db_table = 'zcons_presentaciones'
        ordering = ['nombre']


## amicacina  escopolamina  solucion fisiologica   
class Droga(models.Model):
    nombre = models.CharField(max_length=32)
    codigo = models.CharField(max_length=16)
 
    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s" % (cod)

    class Meta:
        verbose_name_plural = 'Drogas'
        verbose_name = 'Droga'
        db_table = 'zcons_drogas'
        ordering = ['nombre']




class Medicacion(models.Model):
    nombre = models.CharField(max_length=36)
    descripcion = models.CharField(max_length=124)
    drogas = models.ManyToManyField('Droga',blank=True,verbose_name='Componente')
    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s" % (cod)

    class Meta:
        verbose_name_plural = 'Medicaciones'
        verbose_name = 'Medicacion'
        db_table = 'zcons_medicacionesbs'
        ordering = ['nombre']



class Prescripcion():
    paciente = models.ForeignKey('Paciente',verbose_name='Paciente')
    profesional = models.ForeignKey('Profesional',verbose_name = 'Profesional')
    droga = models.ForeignKey('Droga',verbose_name='Droga')
    medicacion = models.ForeignKey('Medicacion',verbose_name = 'Medicamento')
    forma = models.ForeignKey('Presentacion',verbose_name = 'Presentacion')
    dosis = models.CharField(max_length=124,default = '1 ampolla...1 comprimido ...250 mg')
    ndosis = models.IntegerField(default=1,verbose_name='Numero total')
    periodo = models.IntegerField(default=8,verbose_name = 'Periodo en Horas')
    fecha_ini = models.DateField(default=datetime.now,verbose_name = 'Inicio medicacion')
    fecha_ini = models.DateField(default=datetime.today,verbose_name = 'Fin medicacion')
    detalle = models.CharField(max_length=512,default='D',verbose_name = 'Detalle prescripcion.....')
    #lapso = models.ForeignKey()
    def __unicode__(self):
        nom=smart_unicode(self.nombre)
        cod=smart_unicode(self.codigo)
        cod=cod.upper()
        nom=nom.upper()
        return "%s" % (cod)

    class Meta:
        verbose_name_plural = 'Prescripciones'
        verbose_name = 'Prescripcion'
        db_table = 'zcons_prescripciones'
        ordering = ['nombre']


