<%-- 
    Document   : index
    Created on : 20 Dec, 2018, 9:27:23 AM
    Author     : Darshan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>

    <html>
    <head>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/style.css"/>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"> </script>
        <link rel="stylesheet" href="index_style.css"/>
       
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dr.Carport</title> 
    </head>
    <body>
        <jsp:directive.include file="header.jsp"/>
        <img class="" src="Images/wallpaper.jpg"  alt="fdsv">
        <div>
            <center> <h1>DR. CARPORT </h1> </center>
        </div>
         
    <div class = "container">
        <br>
        <center><h2>Popular Services</h2></center>
        <br>
                <sql:query var="services" dataSource="${ds}">
                    select * from services
                </sql:query>
                <c:set var="c" value="${services.rowCount}"/>
                <c:set var="offset" value=""/>
               
                <c:set var="i" value="1"/>
                    <c:forEach items="${services.rows}" var="service">
                        <c:choose>
                    <c:when test="${(c%4>1) && i==1}">
                        <c:set var="offset" value="offset-lg-2"/>
                        
                    </c:when>
                             <c:otherwise>
                                 <c:set var="offset" value=""/>
                             </c:otherwise>
                </c:choose>
                    <c:if test="${i%4==1}">
                         <div class = "row" > 
                    </c:if>
                       
                        <div class = "col-xs-12 col-sm-6 col-md-2 col-lg-2 ${offset}">
                            <a href='service.jsp?id=${service.service_id}&type=service'>
                            <div class="service">
                                <img class="img-fluid image_service" src="Images/${service.logo}">
                            </div>
                            </a>
                            <center>  <p>${service.service}</p> </center>
                        </div>
                            <c:if test="${i%4==0}">
                            </div>
                            </c:if> 
                         <c:set var="i" value="${i+1}"/>
                    </c:forEach>
                <c:if test="${i%4!=0}">
                </c:if>
                   
    </div>  
        </div>
    <div class="offer_section">
    <div class = "container">
        <br>
        <center> <h2>Offers for you</h2></center>
        <br>
        <div class = "row service" >
            <c:set var="query" value="select * from offer"/>
            <c:if test="${not empty param.city}">
                <c:set var="query" value="select * from offer where garage_id in (select garage_id from garages where city_id in(select city_id from cities where city like '%${param.city}%'))"/>
            </c:if>
            <sql:query dataSource="${ds}" var="offer">${query}</sql:query>
            <c:forEach items="${offer.rows}" var="offers">
                <div class = "col-xs-12 col-sm-6 col-md-4 col-lg-4">
                    <a href='service.jsp?id=${offers.offer_id}&type=offer'>
                    <div class="servicecard card">
                        <img class="card-img-top" src="Images/${offers.image}" alt="Card image cap">
                        <div class="card-body">
                            <div class = "row" >
                                <div class = "col-xs-12 col-sm-12 col-md-6 col-lg-8">
                                    <h5 class="card-title">${offers.offer}</h5>
                                    <p class="card-text"><small class="text-muted">${offers.details}</small></p>
                                </div>
                                <div class = "col-xs-12 col-sm-12 col-md-6 col-lg-4">
                                    <h5 class="card-title price">RS. ${offers.cost}</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                                <br>
                    </a>
                </div>  
            </c:forEach>     
        </div>    
    </div>
    </div>
        
    <div class = "container">
        <br>
        <center> <h2>Quick 3-step booking</h2></center>
        <div class = "row" >
            <div class = "col-xs-12 col-sm-12 col-md-6 col-lg-9">
                <ul class="imglist">
                    <li> </li>
                    <h5> <li> <img class="tyre" src="Images/icon-tires.png"/>  Choose the required service </li></h5>
                    <h5> <li> <img class="tyre" src="Images/icon-tires.png"/>  Enter your locality & contact details </li> </h5>
                    <h5> <li> <img class="tyre" src="Images/icon-tires.png"/>  Leave the rest to our service experts</li> </h5>
                </ul>
            </div>
            <div class = "col-xs-12 col-sm-12 col-md-6 col-lg-3">
                <img class="img-fluid image" src="Images/3-step.png" > 
            </div>
        </div>
    </div>
    <div class="info">
    <div class = "container"> 
        <br>
        <center> <h2>Trusted Mechanics</h2></center>
        <div class = "row" >
            <div class = "col-xs-12 col-sm-12 col-md-6 col-lg-3">
                <img class="img-fluid image" src="Images/garage-cartoon.png">    
            </div>
            <div class = "col-xs-12 col-sm-12 col-md-6 col-lg-9">
                <ul>
                    <li> </li>
                    <h5> <li><img class="tyre" src="Images/icon-tires.png"/>  Expert mechanics for your every need </li> </h5>
                    <h5><li><img class="tyre" src="Images/icon-tires.png"/>  Best-in-class workmanship </li> </h5>
                    <h5><li><img class="tyre" src="Images/icon-tires.png"/>  Top of the line equipment for the best service </li> </h6>
                </ul>
            </div>
        </div>
    </div>
    </div>
        
    <div class = "container">
        <br>
        <center> <h2>Track your service in real time</h2></center>
        <div class = "row" >
            <div class = "col-xs-12 col-sm-12 col-md-6 col-lg-9">
                <ul>
                    <li> </li>
                    <h5> <li> <img class="tyre" src="Images/icon-tires.png"/>  Live SMS updates to keep a track on vehicle status</li> </h5>
                    <h5> <li><img class="tyre" src="Images/icon-tires.png"/>  Photo updates right from vehicle check-in to delivery</li> </h5>
                    <h5> <li><img class="tyre" src="Images/icon-tires.png"/>  100% transparency in service</li> </h5>
                </ul>
            </div>
            <div class = "col-xs-12 col-sm-12 col-md-6 col-lg-3">
                <img class="img-fluid image" src="Images/track-service.png">
                
            </div>
        </div>
    </div>
        
    <div class="offer_section">
    <div class = "container">
        <br>
        <center> <h2>Testimonials</h2></center>
        <br>
        <div class = "row" >
            <div class="card-group">
                <div class = "col-xs-12 col-sm-6 col-md-6 col-lg-4">
                    <div class="card">
                        <div class="card-body">
                            <p class="card-text">"A real life saver. 
                                Awesome customer service - not just from the Dr.carport team 
                                but also from the on ground service partners. Highly recommended."
                            </p>
                        </div>
                            
                            <div class="testimonial">
                                <img class=" testimonial-image" src="Images/testimonial1.jpg">
                            </div>
                            
                    </div>
                </div>
                
                <div class = "col-xs-12 col-sm-6 col-md-6 col-lg-4">
                    <div class="card">
                        <div class="card-body">
                            <p class="card-text">"Seamless experience - right from booking through the app to servicing! Finally found a trustworthy provider 
                                for all my bike servicing needs. Stellar job done with my bike."
                                </p>
                        </div>
                        <div class="testimonial">
                            <img class=" testimonial-image" src="Images/testimonial2.png">
                        </div>   
                    </div>
                </div>
                <div class = "col-xs-12 col-sm-6 col-md-6 col-lg-4">
                    <div class="card">
                        <div class="card-body">
                            <p class="card-text">"Extremely delighted with the way in which tinkering & repainting work has been carried out on my car. 
                                    Patient answer to all my queries completely so it was overall gud experience."
                            </p>
                        </div>   
                        <div class="testimonial">
                            <div class="row">
                                <div class="col-lg-2">
                                    <img class=" testimonial-image" src="Images/testimonial4.jpg">
                                </div>
                                <center> 
                                    <div class="col-lg-10" style="border-left: black thin solid; margin: 5px;">
                                    </div> 
                                </center>
                            </div>
                        </div>   
                    </div>
                    <br>
                </div>
            </div>
        </div>
    </div>
    </div>
    
</body>

