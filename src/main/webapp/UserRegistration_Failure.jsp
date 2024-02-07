<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    </head>
        
    <body>
        <%-- Your JSP code here --%>

        <%@ include file="userRegister.html" %>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.29.2/sweetalert2.all.min.js"></script>    
        <script>
            $(document).ready(function(){
                swal('Message From Server', 'User Registration Failed  !!! Retry', 'error');
            });
        </script>
    </body>
</html>
