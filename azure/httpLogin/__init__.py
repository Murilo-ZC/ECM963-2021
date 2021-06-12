import logging
import pyodbc
import json
import azure.functions as func



def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    # name = req.params.get('name')
    # if not name:
    #     try:
    #         req_body = req.get_json()
    #     except ValueError:
    #         pass
    #     else:
    #         name = req_body.get('name')
    #     return func.HttpResponse(f"Hello, {name}. This HTTP triggered function executed successfully.")
    # else:
    #     return func.HttpResponse(
    #          "This HTTP triggered function executed successfully. Pass a name in the query string or in the request body for a personalized response.",
    #          status_code=200
    #     )
    logging.info('Python HTTP trigger function processed a request.')
    server = 'tcp:ecm963.database.windows.net'
    database = 'usuarios'
    username = 'aparecido'
    password = '@parecidO!'   
    driver= '{ODBC Driver 13 for SQL Server}'

    try:
        logging.info("ENTROU NO TRY DO CORPO")
        req_body = req.get_json()
        logging.info(f"PEGOU O CORPO: {req_body}")
        USER_user = req_body["user"]
        USER_password = req_body["pass"]
    except ValueError or KeyError:
        return func.HttpResponse(f"YOU SHALL NOT PASS!!.", status_code=401)
    usuario = {}
    try:
        logging.info("TENTOU CONECTAR")
        #conn_string = 'DRIVER='+driver+';SERVER='+server+';PORT=1433;DATABASE='+database+';UID='+username+';PWD='+ password
        conn_string = 'Driver={ODBC Driver 13 for SQL Server};Server=tcp:ecm963.database.windows.net,1433;Database=usuarios;Uid=aparecido;Pwd=@parecidO!;'

        logging.info(f"CONNECTION STRING: {conn_string}")
        conn =  pyodbc.connect(conn_string) 
        logging.info("CONECTOU TENTANDO PEGAR CURSOR")
        cursor =  conn.cursor()
        logging.info("PEGOU CURSOR")
        #POR ENQUANTO NÃO ESTÁ NADA SEGURO!!!
        cursor.execute(f"SELECT * FROM dbo.usuarios WHERE username='{USER_user}' and pass='{USER_password}';" )
        logging.info("FORMOU A QUERY")
        row = cursor.fetchone()     
        logging.info("EXECUTOU A QUERY")      
        while row:
            usuario["userid"] =  str(row[0])
            usuario["username"]= str(row[1])
            usuario["pass"]= str(row[2])
            usuario["profilename"]= str(row[3])
            return func.HttpResponse(json.dumps(usuario), status_code=200)
    except Exception:
        logging.info('Error!!!' + Exception)
    usuario["erro"] = "usuario/senha invalidos"
    return func.HttpResponse(json.dumps(usuario), status_code=403)