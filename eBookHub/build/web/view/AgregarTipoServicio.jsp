<%-- 
    Document   : AgregarServicio
    Created on : 20/07/2023, 06:02:22 PM
    Author     : Kaled Rodriguez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Formulario de Servicio</title>
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
            <h2>Formulario de Tipo Servicio</h2>
            <form action="ControladorTipoServicio">
                <div class="form-group">
                    <label for="tipoServicio">Tipo de servicio:</label>
                    <input type="text" class="form-control" id="tipoServicio" name="txtTipoServicio" required>
                </div>
                <button type="submit" name="accion" value="add" class="btn btn-primary btn-block">Enviar</button>
            </form>
        </div>

        <!-- Agregar el enlace al archivo bootstrap.min.js -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>
