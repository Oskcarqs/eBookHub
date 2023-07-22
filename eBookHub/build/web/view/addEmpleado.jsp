<%-- 
    Document   : addEmpleado
    Created on : 19/07/2023, 08:19:04 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Agregar Empleado</title>
        <!-- Agregar el enlace al archivo bootstrap.min.css -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f7f7f7;
                font-family: Arial, sans-serif;
            }

            .container {
                max-width: 500px;
                margin: 50px auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h2 {
                margin-bottom: 30px;
                text-align: center;
            }

            .form-group label {
                font-weight: bold;
            }

            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }

            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #0056b3;
            }

            .btn-primary:focus {
                box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.5);
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Agregar Empleado</h2>
            <form action="ControladorEmpleado?accion=addEmpleado">
                <div class="form-group">
                    <label for="nomnbre">Nombre Empleado</label>
                    <input type="text" class="form-control"  id="nombre" name="txtNombreEmpleado" required><br>
                </div>
                <div class="form-group">                
                    <label for="apellido">Apellido Empleado</label>
                    <input type="text" class="form-control"  id="apellido" name="txtApellidoEmpleado" required><br>
                </div>
                <div class="form-group">                
                    <label for="puesto">Puesto Empleado</label>
                    <input type="text"  class="form-control"  id="puesto"  name="txtPuestoEmpleado"><br>
                </div>
                <div class="form-group">
                    <label for="sucursal">ID Sucursal Empleado</label>
                    <input type="text" class="form-control"  id="sucursal" name="txtIdSucursal"><br>
                </div>

                <input type="submit" name="accion" value="Agregar Empleado" class="btn btn-primary btn-block"><br>
            </form>
        </div>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>        
    </body>
</html>
