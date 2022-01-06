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
        <title>Register</title>
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="font awesome/css/all.css" />
        <link rel="stylesheet" href="font awesome/css/brands.css" />
        <link rel="stylesheet" href="font awesome/css/fontawesome.css" />
        <link rel="stylesheet" href="font awesome/css/fontawesome.min.css" />
        <link rel="stylesheet" href="font awesome/css/regular.css" />
        <link rel="stylesheet" href="font awesome/css/solid.css" />
        <link rel="stylesheet" href="font awesome/css/svg-with-js.css" />
        <!--<link rel="stylesheet" href="font awesome/css/v4-shims.css" />-->
    </head>
    
    <body>
        <c:if test='${param.email != null && param.password !=null && param.name != null && param.mobile != null}'>
             <sql:setDataSource driver="com.mysql.jdbc.Driver" user="root" password="" var="ds" url="jdbc:mysql://localhost:3306/dr.carport"/>
            <sql:query dataSource="${ds}" var="rs" sql="insert into "/>
            
            <c:if test="${rs.rowCount != 0}">
                <c:if test='${rs.rows[0].password == param.password}'>
                    <c:set var="email" value="${param.email}" scope="session"/>
                    <c:set var="id" value="${rs.rows[0].id}" scope="session"/>
                    <c:redirect url="service.jsp">
                        <c:param name="id" value="${param.id}"/>
                        <c:param name="type" value="${param.type}"/>
                    </c:redirect>
                </c:if>
            </c:if>
        </c:if>
        <div class="bgimg" style="background:url('Images/wallpaper.jpg')">
            <form method="POST" class="box">
                <center><h1>Register</h1></center>
                    <table class="space">
                  
                        <tr>
                            <td>
                                <label for="name"><b>Name</b></label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="hidden" name="id" value="${param.id}"/>
                                <input type="hidden" name="type" value="${param.type}"/>
                                <input class="size" type="text" placeholder="Enter your name" name="name" required> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="Email"><h3><b>Email</b></h3></label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                
                                <input class="size" type="email" placeholder="Enter Email" name="email" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="mobile"><h3><b>Mobile</b></h3></label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input class="size" type="mobile" placeholder="Enter your mobile number" name="mobile"> 
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
                                <label for="password"><h3><b>Re-enter Password</b></h3></label>
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
                                <center> Already done? <a href="login.jsp">login</a></center>
            </form>
	</div>
    </body>   
</html>
