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
            <h2>Formulario de Servicio</h2>
            <form action="ControladorServicio">
                <div class="form-group">
                    <label for="costoServicio">Costo de Servicio:</label>
                    <input type="text" class="form-control" id="costoServicio" name="txtCostoServicio" required>
                </div>
                <div class="form-group">
                    <label for="fechaServicio">Fecha de Servicio:</label>
                    <input type="text" class="form-control datepicker" id="fechaServicio" name="txtFechaServicio" required>
                </div>
                <div class="form-group">
                    <label for="fechaVencimientoServicio">Fecha de Vencimiento del Servicio:</label>
                    <input type="text" class="form-control datepicker" id="fechaVencimientoServicio" name="txtFechaVencimientoServicio" required>
                </div>
                <div class="form-group">
                    <label for="idTipoServicio">ID de Tipo de Servicio:</label>
                    <input type="text" class="form-control" id="idTipoServicio" name="txtIdTipoServicio" required>
                </div>
                <div class="form-group">
                    <label for="idLibro">ID de Libro:</label>
                    <input type="text" class="form-control" id="idLibro" name="txtIdLibro" required>
                </div>
                <div class="form-group">
                    <label for="idUsuario">ID de Usuario:</label>
                    <input type="text" class="form-control" id="idUsuario" name="txtIdUsuario" required>
                </div>
                <button type="submit" name="accion" value="add" class="btn btn-primary btn-block">Enviar</button>
            </form>
        </div>

        <!-- Agregar el enlace al archivo bootstrap.min.js -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        
    </body>
</html>