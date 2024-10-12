import pandas as pd

path1="./isi.xlsx"
path2="./ime.xlsx"
path3="./iss.xlsx"

# <-- FALTAN CREAR LOS HORARIOS Y LA INFORMACIÓN DE LOS MAESTROS DE INDUSTRIAL -->

# SE EXTRAE LA INFORMACION DEL EXCEL
df = pd.read_excel(path2, engine="openpyxl", sheet_name="gruposXprogramaCoordinador", skiprows=3)

datos = df.values  


# SE EXTRAE LA INFORMACION IMPORTANTE DE TODAS LAS FILAS DE REGISTRO DE CADA EXCEL
# SE CONSIGUEN EL HORARIO(LUN-SAB), NO.EMPLEADO, NOMBRE-EMPLEADO Y SALON
lista_diccionarios =[]
claves = ["Lunes","Martes","Miercoles","Jueves","Viernes","Sabado","Numero","Nombre","Salon"]
for fila in datos:
    posicion_clave = 0
    diccionario={}
    for j in range(11,20):
        diccionario[claves[posicion_clave]] = fila[j]
        posicion_clave+=1
    lista_diccionarios.append(diccionario)


# DE TODA LA LISTA ANTERIOR, SE EXTRAEN LOS REGISTROS QUE TENGAN CLASE SOLAMENTE EN LOS EDIFICIOS DEL DEPARTAMENTO
edificios = ["5G","5J","5K","5M","5O","5R","8B","8D"]
lista_horarios = []
for i in range(len(lista_diccionarios)):
    dos_caracteres = lista_diccionarios[i]["Salon"][:2] if type(lista_diccionarios[i]["Salon"])==str  else "NA"
    if any(dos_caracteres in edificio for edificio in edificios):
        lista_horarios.append(lista_diccionarios[i])


# DE TODOS LOS REGISTROS, SE CAMBIA EL VALOR DE LA CLAVE "sALON", YA QUE CONTIENE LETRAS
# PASAMOS DE 5K-A101 -> 5K-101, 5J-CO203 -> 5J-203
for i in range(len(lista_horarios)):
    dos_primeros = lista_horarios[i]["Salon"][:2]
    tres_ultimos = lista_horarios[i]["Salon"][-3:]
    salon = dos_primeros+"-"+tres_ultimos
    lista_horarios[i]["Salon"] = salon


# CREAMOS UN DICCIONARIO CON TODOS LOS SALONES DE TODOS LOS EDIFICIOS
# SE OBTIENE DE LA TABLA SALON DE LA DB
salones = {
    1: [ 1, "5K-101"],
    2: [ 2, "5K-102"],
    3: [ 3, "5K-201"],
    4: [ 4, "5K-202"],
    5: [ 5, "5K-203"],
    6: [ 6, "5K-204"],
    7: [ 7, "5K-205"],
    8: [ 8, "5K-301"],
    9: [ 9, "5K-302"],
    10: [10, "5K-303"],
    11: [11, "5K-304"],
    12: [12, "5K-305"],
    13: [13, "5M-201"],
    14: [14, "5M-202"],
    15: [15, "5M-203"],
    16: [16, "5M-205"],
    17: [17, "5M-206"],
    18: [18, "5G-101"],
    19: [19, "5G-102"],
    20: [20, "5G-201"],
    21: [21, "5G-202"],
    22: [22, "5G-203"],
    23: [23, "5G-204"],
    24: [24, "5G-205"],
    25: [25, "5G-206"],
    26: [26, "5O-301"],
    27: [27, "5O-302"],
    28: [28, "5O-303"],
    29: [29, "5O-304"],
    30: [30,"5-O"],
    31: [31, "5O-101"],
    32: [32, "5R-101"],
    33: [33, "5R-102"],
    34: [34, "5R-103"],
    35: [35, "5R-104"],
    36: [36, "5J-201"],
    37: [37, "5J-202"],
    38: [38, "5J-203"],
    39: [39, "5J-204"],
    40: [40, "5J-301"],
    41: [41, "5J-302"],
    42: [42, "5J-303"],
    43: [43, "5J-304"],
    44: [44, "5J-305"],
    45: [45, "8B-120"],
    46: [46, "5G-301"],
    47: [47, "5G-302"],
    48: [48, "5G-303"],
    49: [49, "5G-304"],
    50: [50, "5G-305"],
    51: [51,"5J-Auditorio Gustavo Figueroa"],
    52: [52,"8B-Metrologia"],
    53: [53,"8D-Inyeccion de Plastico"],
    54: [54,"8D-Mecatronica Basica"],
    55: [55,"8D-Mecatronica Avanzada"],
    56: [56,"8D-Mecatronica Mtros"],
    57: [57,"8D-Ing Electrica"],
    58: [58,"8D-Manufactura"],
    59: [59,"8D-Robotica"],
    60: [60,"8D-Area de instrumentacion"],
    61: [61,"8D-Lab Soldadura"],
    62: [62,"5G-CSTI"],
    63: [63,"5J-Sala Lozano Taylor"],
    64: [64,"5R-Enrutadores"]
}

# print(salones[1]) -> [1, '5K-101']
# print(salones[64]) -> [64, '5R-Enrutadores']
# print(salones[64][1]) -> 5R-Enrutadores


# SE EXTRAEN LAS FILAS/REGISTROS DONDE LA CLAVE "SALON" COINCIDA CON ALGUN ELEMENTO DEL DICCIONARIO SALONES
# YA QUE SI COINCIDEN, SIGNIFICA QUE SI CONTAMOS CON LAS LLAVES DEL SALON, PORQUE NO TENEMOS ACCESO/LLAVES
# DE TODOS LOS SALONES DE LOS EDIFICIOS
lista_definitivaxD = []
for i in range(len(lista_horarios)):
    registro_horario = {}
    for j in range(1, 65):
        if lista_horarios[i]["Salon"]==salones[j][1]:
            lista_horarios[i]["Salon"]=salones[j][0]
            lista_definitivaxD.append(lista_horarios[i])
# print(lista_definitivaxD)


# PASO IMPORTANTE -> ASEGURARSE QUE EL EMPLEADO EXISTA EN LA DB (TABLA EMPLEADO)
# SI NO EXISTE CREARLO CON LO SIGUIENTE
query_empleadosdii = "INSERT INTO personal(IDPersonal, Nombre, ApellidoPaterno, ApellidoMaterno, Tipo, Departamento)\nVALUES\n"

with open("lista_id_empleadosdii.txt", "r+") as archivo_id:
    info = archivo_id.read()
    ids = info.split(',')
    # print(len(ids))
    # print(ids)
    ids.pop()
    idempleadosdii = list(map(int, ids))
    # print(idempleadosdii)
    print(len(idempleadosdii))
    for i in range(len(lista_definitivaxD)):
        nombres = lista_definitivaxD[i]["Nombre"].split()
        nombrecitos = nombres[2]+" "+nombres[3] if len(nombres)==4 else nombres[2]
        empleado = {
            "IDPersonal": int(lista_definitivaxD[i]["Numero"]),
            "ApellidoPaterno": nombres[0],
            "ApellidoMaterno": nombres[1],
            "Nombre": nombrecitos
        }
        if (empleado["IDPersonal"] not in idempleadosdii):
            if (str(empleado["IDPersonal"]) not in query_empleadosdii):
                archivo_id.write(str(empleado["IDPersonal"])+",")
                print("agregado")
                query_empleadosdii += "("+str(empleado["IDPersonal"])+",'"+empleado["Nombre"]+"','"+empleado["ApellidoPaterno"]+"',"
                query_empleadosdii += "'"+empleado["ApellidoMaterno"]+"','Maestro','DII'),"
archivo_id.close()
query_final_ids = query_empleadosdii[:-1]+";"

# print("MAESTROS QUE NO EXISTEN EN LA TABLA PERSONAL:")
print(query_final_ids) # DESCOMENTAR / COMENTAR



# CREAMOS LA QUERY PARA INSERTAR REGISTROS DENTRO DE LA TABLA HORARIO
# query = "INSERT INTO horario (IDPersonal, IDSalon, Lunes, Martes, Miercoles, Jueves, Viernes, Sabado) \nVALUES\n"

# with open("horarios.txt", "r+") as horarios_archivos:
#     info = horarios_archivos.read()
#     read_listahorarios = info.split()
#     read_listahorarios.pop
#     lista_horarios_doc = []
#     for i in range(len(read_listahorarios)):
#         read_elementoshorario = read_listahorarios[i].split(',')
#         horario_existente= {}
#         for i in range(len(read_elementoshorario)):
#             horario_existente= {
#             "IDPersonal": int(read_elementoshorario[0]),
#             "IDSalon": int(read_elementoshorario[1]),
#             "Lunes": str(read_elementoshorario[2]),
#             "Martes": str(read_elementoshorario[3]),
#             "Miercoles": str(read_elementoshorario[4]),
#             "Jueves": str(read_elementoshorario[5]),
#             "Viernes": str(read_elementoshorario[6]),
#             "Sabado": str(read_elementoshorario[7])
#             }
#         lista_horarios_doc.append(horario_existente)
#     # print(lista_horarios_doc)
#     print(len(lista_horarios_doc))
#     # print(lista_horarios_doc[0]["IDSalon"])
#     for i in range(len(lista_definitivaxD)):
#         horario= {
#             "IDPersonal": int(lista_definitivaxD[i]["Numero"]),
#             "IDSalon": int(lista_definitivaxD[i]["Salon"]),
#             "Lunes": str(lista_definitivaxD[i]["Lunes"]),
#             "Martes": str(lista_definitivaxD[i]["Martes"]),
#             "Miercoles": str(lista_definitivaxD[i]["Miercoles"]),
#             "Jueves": str(lista_definitivaxD[i]["Jueves"]),
#             "Viernes": str(lista_definitivaxD[i]["Viernes"]),
#             "Sabado": str(lista_definitivaxD[i]["Sabado"])
#         }
#         if (horario not in lista_horarios_doc):
#             # print("ola mundo"+ str(i))
#             horarios_archivos.write(str(horario["IDPersonal"])+","+str(horario["IDSalon"])+","+str(horario["Lunes"])+","+str(horario["Martes"])+","+str(horario["Miercoles"])+","+str(horario["Jueves"])+","+str(horario["Viernes"])+","+str(horario["Sabado"])+"\n")
#             query += "("+str(horario["IDPersonal"])+","+str(horario["IDSalon"])+",'"
#             query += str(horario["Lunes"])+"','"+str(horario["Martes"])+"','"
#             query += str(horario["Miercoles"])+"','"+str(horario["Jueves"])+"','"
#             query += str(horario["Viernes"])+"','"+str(horario["Sabado"])+"'),"
            
# horarios_archivos.close()
# query_final_horarios = query[:-1]+";"
# print(query_final_horarios) # comentar / descomentar

