<%-- 
    Document   : service
    Created on : 6 Jan, 2019, 11:47:17 AM
    Author     : Darshan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/style.css"/>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        
   <link rel="stylesheet" href="font awesome/css/all.css"/>
   <link rel="stylesheet" href="font awesome/css/brands.css"/>
   <link rel="stylesheet" href="font awesome/css/fontawesome.css"/>
   <link rel="stylesheet" href="font awesome/css/fontawesome.min.css"/>
   <link rel="stylesheet" href="font awesome/css/regular.css"/>
   <link rel="stylesheet" href="font awesome/css/solid.css"/>
   <link rel="stylesheet" href="font awesome/css/svg-with-js.css"/>
   <link rel="stylesheet" href="font awesome/css/v4-shims.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Offer & Serivce</title>
    </head>
    <body>
        <c:if test="${sessionScope.email}">
            <c:redirect url="login.jsp">
                <c:param name="id" value="${param.id}"/>
                <c:param name="type" value="${param.type}"/>
            </c:redirect>
        </c:if>
        <sql:setDataSource driver="com.mysql.jdbc.Driver" user="root" password="" var="ds" url="jdbc:mysql://localhost:3306/dr.carport"/>      
        <div class="head">
            <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand" href="#">LOGO</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            </nav>
        </div>
        <c:if test='${param.vehical != null && param.location !=null && param.mobile != null}'>
            <sql:update dataSource="${ds}" var="rs" sql="INSERT INTO `booking` (`type`, `client_id`, `location`, `vehicle`, `mo_number`, `type_id`)
                       VALUES ( '${param.type}', '${sessionScope.c_id}', '${param.location}', '${param.vehical}', '${param.mobile}', '${param.id}') "/>
                    <c:redirect url="booking.jsp">
                        <c:param name="booking_id" value="${param.id}"/>
                        <c:param name="type" value="${param.type}"/>
                    </c:redirect>
        </c:if>
        <c:if test="${param.type == 'service'}">
            <sql:query var="rs" dataSource="${ds}" sql="select * from services where service_id='${param.id}'"/>
            ${rs.rowCount}
        </c:if>
        <c:if test="${param.type == 'offer'}">
            <sql:query var="rs" dataSource="${ds}" sql="select * from offer where offer_id='${param.id}'"/>
        </c:if>
        
    <div class="book">
    <div class = "container-fluid">
        <div class = "row" >
            <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
                <div class="card">
                    <img class="card-img-top img-fluid serv-image" src="Images/${rs.rows[0].image}"  alt="Card image cap">
                        <div class="card-body">
                            <div class = "row" >
                            <div class = "col-xs-12 col-sm-12 col-md-6 col-lg-8">
                                <b><h3 class="card-title">${rs.rows[0].details}</h3></b>
                            </div>
                            <div class = "col-xs-12 col-sm-12 col-md-6 col-lg-4">
                                <h5 class="card-title price">RS.${rs.rows[0].cost}</h5>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
            
            
                
                    <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                        <div class="information">
                <form>
                    <input type="hidden" name="id" value="${param.id}"/>
                    <input type="hidden" name="type" value="${param.type}"/>
                    <center> <h6><b>Book your service</b></h6></center>
                    <br>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                           <center><label for="inputEmail4">Choose Vehicle</label></center>
                           <input type="text" class="form-control" placeholder="Swift Desire" name="vehical">
                        </div>
                        
                        <div class="form-group col-md-12">
                           <center><label for="inputEmail4">Enter your location</label></center>
                           <input type="text" class="form-control" placeholder="Kalawad Road" name="location">
                        </div>
                        
                        <div class="form-group col-md-12">
                           <center><label for="inputEmail4">Mobile Number</label></center>
                           <input type="text" class="form-control" placeholder="Enter mobile number" required name="mobile">
                        </div>  
                        <div class="form-group col-md-12">
                        <center><button type="submit" class="btn btn-book">Book Now</button></center>
                        </div>
                    </div>
                </form>
                </div>
            </div>
        </div>
    </div>
    </div>
        
    <div class = "container">
        <center> <h2>What's Included</h2></center>
        <div class = "row" >
            <div class = "offset-lg-1 col-xs-12 col-sm-12 col-md-6 col-lg-4">
                <img class="img-fluid image" src="Images/offers-description.svg" >
                
            </div>
            <div class = "col-xs-12 col-sm-12 col-md-6 col-lg-6">
                <ul class="imglist">
                    <h6> <li> <img class="tyre" src="Images/check-mark.png"/>  Choose the required service </li></h6>
                    <h6> <li> <img class="tyre" src="Images/check-mark.png"/>  Enter your locality & contact details </li> </h6>
                    <h6> <li> <img class="tyre" src="Images/check-mark.png"/>  Door trim scrubbing and polishing </li></h6>
                    <h6> <li> <img class="tyre" src="Images/check-mark.png"/>  Carpet cleaning </li></h6>
                    <h6> <li> <img class="tyre" src="Images/check-mark.png"/>  Vacuuming </li></h6>
                    <h6> <li> <img class="tyre" src="Images/check-mark.png"/>  AC vent cleaning </li></h6>
                </ul>
            </div>
            
        </div>
    </div>
    </body>
</html>
