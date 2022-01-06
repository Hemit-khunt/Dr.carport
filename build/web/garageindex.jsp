<%-- 
    Document   : garageindex
    Created on : 11 Mar, 2019, 10:03:15 AM
    Author     : hemitkhut
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body
            {
               padding: 0%;
               margin: 0%;
            }
            ul 
            {
              list-style-type: none;
              margin: 0;
              padding: 0;
              overflow: hidden;
              background-color: #d3d9df;
            }
            li.logout
            {
                 float:right;
            }
            li 
            {
              float: left
              border-right: 1px solid #000;
            }
            li a 
            {
              display: block;
              color: white;
              text-align: center;
              padding: 14px 16px;
              text-decoration: none;
            }
            li:hover 
            {
              background-color: #4CAF50;
            }
            
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/style.css"/>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="index_style.css"/>
        <title>Garage panel</title>
    </head>
    <body>
        ${paramValues['service']}
        <sql:setDataSource driver="com.mysql.jdbc.Driver" user="root" password="" var="ds" url="jdbc:mysql://localhost:3306/dr.carport"/>
                
                <ul>
                    <li><a href="garageindex.jsp?id=request">Client Request</a></li>
                    <li><a href="garageindex.jsp?id=offer">Offer</a></li>
                    <li><a href="garageindex.jsp?id=service">Service</a></li>
                    <li><a href="garageindex.jsp?id=myservice">My Services</a></li>
                    <li><a class="logout" href="garagelogin.jsp?id=logout">logout</a></li>
                </ul>
        <c:if test="${param.id==''}">
            <center><h3>Recently provided order</h3></center>
        </c:if>
        <c:if test="${param.id=='request'}">
                <sql:query dataSource="${ds}" var="ors" sql="select * from booking a,client b,offer c where type='offer' and a.type_id in 
                           ( select offer_id from offer where garage_id= ${sessionScope.c_id}) and a.client_id=b.id and a.type_id = c.offer_id order by Status"/>
                <div class="container">
                    <div class="row col-xl-12 col-lg-9 col-md-6 col-sm-4">
                        <center><h1>Offer order Details</h1></center>
                        <table class="tablebooking" style="width: 100%;">
                            <tr>
                                <th class="tablebooking">Order No</th>
                                <th class="tablebooking">Customer Name</th>
                                <th class="tablebooking">Contact No</th>
                                <th class="tablebooking">Offer</th>
                                <th class="tablebooking">Description</th>
                                <th class="tablebooking">Price</th>
                                <th class="tablebooking">Completion Status</th>
                            </tr>
                            <c:forEach items="${ors.rows}" var="ors">
                                <tr>
                                    <td class="tablebooking"><center>${ors.booking_id}</center></td>
                                    <td class="tablebooking"><center>${ors.name}</center></td>
                                    <td class="tablebooking"><center>${ors.contact}</center></td>
                                    <td class="tablebooking"><center>${ors.offer}</center></td>
                                    <td class="tablebooking"><center>${ors.details}</center></td>
                                    <td class="tablebooking"><center>${ors.cost}</center></td>
                                    <td class="tablebooking"><center>${ors.Status} &nbsp;
                                        <c:if test="${ors.Status == 'Claim'}">
                                            <a href="updatedorder.jsp?id=${ors.booking_id}">complete</a>
                                        </c:if></center>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    <sql:query dataSource="${ds}" var="srs" sql="select * from booking a,client b,services c where type='service' and a.type_id in 
                           ( select service_id from services where garage_id= ${sessionScope.c_id}) and a.client_id=b.id and a.type_id = c.service_id order by Status"/>
                        <center><h1>Service order Details</h1></center>
                        <table class="tablebooking" style="width: 100%;">
                            <tr>
                                <th class="tablebooking">Order No</th>
                                <th class="tablebooking">Customer Name</th>
                                <th class="tablebooking">Contact No</th>
                                <th class="tablebooking">Service</th>
                                <th class="tablebooking">Description</th>
                                <th class="tablebooking">Price</th>
                                <th class="tablebooking">Completion Status</th>
                            </tr>
                            <c:forEach items="${srs.rows}" var="srs">
                                <tr>
                                    <td class="tablebooking"><center>${srs.booking_id}</center></td>
                                    <td class="tablebooking"><center>${srs.name}</center></td>
                                    <td class="tablebooking"><center>${srs.contact}</center></td>
                                    <td class="tablebooking"><center>${srs.service}</center></td>
                                    <td class="tablebooking"><center>${srs.details}</center></td>
                                    <td class="tablebooking"><center>${srs.cost}</center></td>
                                    <td class="tablebooking"><center>${srs.Status} &nbsp;
                                        <c:if test="${srs.Status == 'Claim'}">
                                            <a href="updatedorder.jsp?id=${srs.booking_id}">complete</a>
                                        </c:if></center>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>

                </div>
        </c:if>
        <c:if test="${param.id == 'offer'}">
            <sql:query dataSource="${ds}" var="rs" sql="SELECT * FROM offer WHERE garage_id = ${sessionScope.c_id}"/>
            <div class="container">
                <div class="row col-xl-12 col-lg-9 col-md-6 col-sm-4">
                    <table class="tablebooking" style="width: 100%;">
                        <tr>
                            <th class="tablebooking">Index</th>
                            <th class="tablebooking">Offer Name</th>
                            <th class="tablebooking">Offer Details</th>
                            <th class="tablebooking">Image</th>
                            <th class="tablebooking">Price</th>
                        </tr>
                        <c:forEach items="${rs.rows}" var="rs">
                            <tr>
                                <td class="tablebooking"><center>${rs.offer_id}</center></td>
                                <td class="tablebooking"><center>${rs.offer}</center></td>
                                <td class="tablebooking"><center>${rs.details}</center></td>
                                <td class="tablebooking"><center><img class="offerimage" src="${rs.image}"  alt="fdsv"></center></td>
                                <td class="tablebooking"><center>${rs.cost}</center></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </c:if>
        <c:if test="${param.id == 'service'}">
            <div class="container">
                <div class="row col-xl-12 col-lg-9 col-md-6 col-sm-4">
                    <sql:query dataSource="${ds}" var="rs" sql="SELECT * FROM services WHERE garage_id = ${sessionScope.c_id}"/>
                    <table class="tablebooking" style="width: 100%;">
                        <tr>
                            <th class="tablebooking">Index</th>
                            <th class="tablebooking">Service Name</th>
                            <th class="tablebooking">Service Details</th>
                            <th class="tablebooking">Image</th>
                            <th class="tablebooking">Price</th>
                        </tr>
                        <c:forEach items="${rs.rows}" var="rs">
                            <tr>
                                <td class="tablebooking"><center>${rs.service_id}</center></td>
                                <td class="tablebooking"><center>${rs.service}</center></td>
                                <td class="tablebooking"><center>${rs.details}</center></td>
                                <td class="tablebooking"><center><img class="offerimage" src="${rs.image}"  alt="fdsv"></center></td>
                                <td class="tablebooking"><center>${rs.cost}</center></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </c:if>
        <c:if test="${param.id=='myservice'}">
            <div class="container">
                <div class="row col-xl-12 col-lg-9 col-md-6 col-sm-4">
                    <sql:query dataSource="${ds}" var="rs" sql="SELECT * FROM services"/>
                    <center><h3>Service providing by us</h3></center>
                    <br>
                    <form action="order.jsp" style="width: 100%">
                        <table class="tablebooking" style="width: 100%;">
                            <tr>
                                <th class="tablebooking">Providing</th>
                                <th class="tablebooking">Service Name</th>
                                <th class="tablebooking">Service Details</th>
                                <th class="tablebooking">Price</th>
                            </tr>
                            <c:set var="c" value=",${sessionScope.c_id},"/>
                            <c:set var="old_csv" value=""/>
                            <c:forEach items="${rs.rows}" var="rs">   
                                <tr>
                                    <td class="tablebooking">
                                        <center>
                                            <c:choose>
                                                <c:when test="${fn:indexOf(rs.garage_id,c)!=-1 || fn:startsWith(rs.garage_id,sessionScope.c_id) || fn:endsWith(rs.garage_id,sessionScope.c_id)}">
                                                    <input type="checkbox" name="service" value=${rs.service_id} checked />
                                                    <c:set var="old_csv" value="${old_csv},${rs.service_id}"/>
                                                    <input type="hidden" name="old_garages" value=${rs.garage_id} />
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="checkbox" name="service" value=${rs.service_id} />
                                                    <input type="hidden" name="old_garages" value=${rs.garage_id} />
                                                </c:otherwise>
                                            </c:choose>
                                        </center>
                                    </td>
                                    <td class="tablebooking"><center>${rs.service}</center></td>
                                    <td class="tablebooking"><center>${rs.details}</center></td>
                                    <td class="tablebooking"><center>${rs.cost}</center></td>
                                </tr>    
                            </c:forEach>
                        </table>
                        <input type="hidden" name="id" value="myservice"/>
                        <input type="hidden" name="oldservice" value=${old_csv} />
                        <center><button type="submit" class="btn">Add as a service</button></center>
                    </form>
                    </div>
                </div>
            </div>
        </c:if>
    </body>
</html>
