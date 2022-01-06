<%-- 
    Document   : updatedorder
    Created on : 11 Mar, 2019, 8:28:20 AM
    Author     : hemitkhut
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <sql:setDataSource driver="com.mysql.jdbc.Driver" user="root" password="" var="ds" url="jdbc:mysql://localhost:3306/dr.carport"/>      
        <sql:update dataSource="${ds}" var="rs" sql="UPDATE `booking` SET `Status`= 'Provided' WHERE booking_id = ${param.id}"/>
        <c:redirect url="garageindex.jsp?id=request"/>
    </body>
</html>
