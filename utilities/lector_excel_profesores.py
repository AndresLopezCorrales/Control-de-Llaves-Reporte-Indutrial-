import pandas as pd

path="./profesores.xlsx"


# SE EXTRAE LA INFORMACION DEL EXCEL
df = pd.read_excel(path, engine="openpyxl", sheet_name="reporteXformato", skiprows=0)

datos = df.values
empleadosdii = []
claves = ["IDPersonal", "Nombre", "ApellidoPaterno", "ApellidoMaterno"]
j = 0
for i in datos:
    posicion_clave = 0
    nombres = datos[j][1].split()
    nombrecitos = nombres[2]+" "+nombres[3] if len(nombres)==4 else nombres[2]
    empleado = {
        "IDPersonal": datos[j][0],
        "ApellidoPaterno": nombres[0],
        "ApellidoMaterno": nombres[1],
        "Nombre": nombrecitos
    }
    j+=1
    empleadosdii.append(empleado)
setdepartamento = "UPDATE personal SET Departamento = 'DII' WHERE "
for i in range(len(empleadosdii)):
    setdepartamento += "IDPersonal="+str(empleadosdii[i]["IDPersonal"])+" OR "
# print(setdepartamento)


# QUERY PARA CREAR LOS REGISTROS DE LOS MAESTROS QUE NO EXISTEN EN LA DB (LA INFO SE OBTUVO DEL EXCEL) Y
# VAMOS A CREAR UN ARCHIVO TXT DONDE ALMACENAREMOS LOS IDS DE TODOS LOS EMPLEADOS
# PARA EVITAR PROBLEMAS A FUTURO
query = "INSERT INTO personal(IDPersonal, Nombre, ApellidoPaterno, ApellidoMaterno, Tipo, Departamento)\nVALUES\n"

with open("lista_id_empleadosdii.txt", "r+") as archivo_id:
    info = archivo_id.read()
    ids = info.split(',')
    # print(len(ids))
    # print(ids)
    ids.pop()
    idempleadosdii= list(map(int, ids))
    # print(idempleadosdii)
    print(len(idempleadosdii))
    for i in range(len(empleadosdii)):
        if empleadosdii[i]["IDPersonal"] not in idempleadosdii:
            if (str(empleadosdii[i]["IDPersonal"]) not in query):
                archivo_id.write(str(int(empleadosdii[i]["IDPersonal"]))+",")
                print("agregado")
                query += "("+str(empleadosdii[i]["IDPersonal"])+",'"+empleadosdii[i]["Nombre"]+"','"+empleadosdii[i]["ApellidoPaterno"]+"',"
                query += "'"+empleadosdii[i]["ApellidoMaterno"]+"','Maestro','DII'),"
archivo_id.close()
query_final = query[:-1]+";"
print(query_final) # comentar / descomentar

