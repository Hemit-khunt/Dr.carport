<%-- 
    Document   : order
    Created on : 9 Mar, 2019, 10:52:58 AM
    Author     : hemitkhut
--%>

<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>garage</title>
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
        <sql:setDataSource driver="com.mysql.jdbc.Driver" user="root" password="" var="ds" url="jdbc:mysql://localhost:3306/dr.carport"/>
        
        <%
        String[] s=request.getParameterValues("service");
        String[] g=request.getParameterValues("old_garage");
        for(String t:s)
        {
            String new_csv=t+",";
       
            for(String e:g)
            {
                String driverName = "com.mysql.jdbc.Driver";
                String url = "jdbc:mysql://localhost:3306/dr.carport";
                String user = "root";
                String psw = "";
                Connection con = con = DriverManager.getConnection(url,user,psw);
                PreparedStatement ps = null;
                Class.forName(driverName);
                String sql="Update services set garage_id =? where service_id = t ";
                ps.setString(1,request.getParameter("old_garage")+","+session.getAttribute("c_id"));
                ps.executeUpdate();
            }
        }
        %>
       
        <div class="container">
            <div class="row col-xl-12 col-lg-9 col-md-6 col-sm-4">
            </div>
        </div>
    </body>
</html>
