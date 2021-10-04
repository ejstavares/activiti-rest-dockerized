
<!DOCTYPE html>
<html lang="en">
    <head>
      <%
            String url = String.valueOf(request.getRequestURL());
           // System.out.println("dados " +pat);
		   url = url +"activiti-rest/service/runtime/tasks/";
            response.sendRedirect(url);
     %>
    </head>

    <body>
        
    </body>

</html>
