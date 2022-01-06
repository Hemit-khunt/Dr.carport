<%-- 
    Document   : header
    Created on : 20 Dec, 2018, 10:44:06 AM
    Author     : Darshan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
    <head>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/style.css"/>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"> </script>
        
   <link rel="stylesheet" href="font awesome/css/all.css"/>
   <link rel="stylesheet" href="font awesome/css/brands.css"/>
   <link rel="stylesheet" href="font awesome/css/fontawesome.css"/>
   <link rel="stylesheet" href="font awesome/css/fontawesome.min.css"/>
   <link rel="stylesheet" href="font awesome/css/regular.css"/>
   <link rel="stylesheet" href="font awesome/css/solid.css"/>
   <link rel="stylesheet" href="font awesome/css/svg-with-js.css"/>
   <link rel="stylesheet" href="font awesome/css/v4-shims.css"/>
        
       
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dr.Carport</title> 
    </head>
    <body>
         <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/dr.carport" user="root" password=""/>
        <div class="modal" id="md" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content" >
                    <div class="modal-header">
                        <h5 class="modal-title">Please let us know your locality to find service centers near you </h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    <div class="modal-body">
                        <center> <form>
                            <input type="text" placeholder="Rajkot" style="border: none; border-bottom: 2px darkgrey solid;    ">
                        </form>
                        
                        </center>
                    </div>
                    <center>        <div class="modal-footer">
                        <ul> 
                            <sql:query dataSource="${ds}" var="ct">
                                select * from cities
                            </sql:query>
                            <c:forEach items="${ct.rows}" var="ctrec">
                                <li><a href="index.jsp?city=${ctrec.city}"><img src="Images/${ctrec.landmark}"><p>${ctrec.city}</p></a></li>
                            </c:forEach>
                           <%-- <li><img src="Images/landmark_ahmedabad.png"><p>Ahmedabad</p></li>
                            <li><img src="Images/landmark_rajkot.png"><p>Rajkot</p></li>
                            <li><img src="Images/landmark_surat.png"><p>Surat</p></li>--%>
                        </ul>
                        </div>  </center>
                </div>
            </div>
        </div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">LOGO</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
             </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
         <ul class="navbar-nav mr-auto">
     
         </ul>
            <form class="form-inline my-2 my-lg-0">
      
                <button class="btn my-2 my-sm-0" data-toggle="modal" data-target="#md" type="button"><i class="fa fa-map-marker">
                       
                        <c:choose>
                            <c:when test="${not empty param.city}">
                                ${param.city}
                            </c:when>
                            <c:otherwise>
                                Location
                            </c:otherwise>
                        </c:choose>
                        
                    </i></button>
             </form>
     </div>
    </nav>
    </body>
</html>

