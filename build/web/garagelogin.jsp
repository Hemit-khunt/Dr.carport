<%-- 
    Document   : login
    Created on : 26 Dec, 2018, 8:33:47 PM
    Author     : HEMIT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>garage login</title>
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="font awesome/css/all.css" />
        <link rel="stylesheet" href="font awesome/css/brands.css" />
        <link rel="stylesheet" href="font awesome/css/fontawesome.css" />
        <link rel="stylesheet" href="font awesome/css/fontawesome.min.css" />
        <link rel="stylesheet" href="font awesome/css/regular.css" />
        <link rel="stylesheet" href="font awesome/css/solid.css" />
        <link rel="stylesheet" href="font awesome/css/svg-with-js.css" />
   
    </head>
    <body>
         <c:if test='${param.email != null && param.password !=null}'>
             <sql:setDataSource driver="com.mysql.jdbc.Driver" user="root" password="" var="ds" url="jdbc:mysql://localhost:3306/dr.carport"/>
            <sql:query dataSource="${ds}" var="rs" sql="select * from garages where email='${param.email}' and password='${param.password}'"/>
            
            <c:if test="${rs.rowCount != 0}">
                <c:if test='${rs.rows[0].password == param.password}'>
                    <c:set var="email" value="${param.email}" scope="session"/>
                    <c:set var="c_id" value="${rs.rows[0].garage_id}" scope="session"/>
                    <c:redirect url="garageindex.jsp?email=${param.email}"></c:redirect>
                </c:if>
            </c:if>
        </c:if>
        <div class="container">
            <div class="row">
                <div class="bgimg" style="background:url('Images/garage.jpg')">
                    <form method="POST" class="box">
                            <h1>Garage Login</h1>
                            <br>
                            <table>
                                <tr>
                                    <td >
                                        <label for="Email"><h3><b>Email</b></h3></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input class="size" type="email" placeholder="Enter Email" name="email" required>
                                        <br>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="password"><h3><b>Password</b></h3></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input class="size" type="password" placeholder="Enter your password" name="password"> 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <button type="submit" class="btn">Login</button>
                                    </td>
                                </tr>
                            </table>
                    </form>
                </div>
            </div>
        </div>
    </body>   
</html>
