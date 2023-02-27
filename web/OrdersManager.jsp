<%-- 
    Document   : Cart
    Created on : Mar 6, 2022, 9:43:02 PM
    Author     : admin
--%>

<%@page import="java.util.Vector"%>
<%@page import="entity.Orders"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Food Code Proudly Presents By Themexpert</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

        <!-- Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:400,700' rel='stylesheet' type='text/css'>

        <!-- Css -->
        <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" />
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">

        <!-- jS -->
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery.nivo.slider.js" type="text/javascript"></script>
        <script src="js/owl.carousel.min.js" type="text/javascript"></script>
        <script src="js/jquery.nicescroll.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/main.js" type="text/javascript"></script>
        <style>
            .hd button{
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
            }
        </style>    
    </head>

    <body>


        <!-- TOP HEADER Start
        ================================================== -->

        <jsp:include page="header.jsp"></jsp:include>

            <!-- Breadcrumbs Start
                ================================================== -->

            <section id="topic-header">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <h1 style="color: orangered">Orders Manager</h1>
                        </div>
                        <!-- End of /.col-md-4 -->
                        <div class="col-md-6 hidden-xs">
                            <ol class="breadcrumb pull-right">
                                <li><a href="#">Home</a></li>
                                <li class="active" style="color: orange">Products Manager</li>
                            </ol>
                        </div>
                        <!-- End of /.col-md-8 -->
                    </div>
                    <!-- End of /.row -->
                </div>
                <!-- End of /.container -->
            </section>
            <!-- End of /#Topic-header -->

            <!--================================================== -->
            <div class="hd">
                <div style="padding-left: 100px; padding-bottom: 100px;">
                    <div style="padding: 50px 50px 50px 0px;">
                        <a href="InsertOrders.jsp">
                            <button style="font-size: 20px; font-weight: bold">Create new product</button>
                        </a>
                    </div>

                    <table border="1px" >
                        <thead class="cart-table-head" style="background-color:gray;">
                            <tr class="table-head-row">
                                <th class="product-id" style="padding-right: 20px; padding-left: 20px; color: white;">Order ID</th>
                                <th class="supplier-id" style="padding-right: 20px; padding-left: 20px; color: white;">Customer ID</th>
                                <th class="category-id" style="padding-right: 20px; padding-left: 20px; color: white;">Customer Name</th>
                                <th class="product-name" style="padding-right: 60px; padding-left: 60px; color: white;">Phone Number</th>
                                <th class="product-year" style="padding-right: 20px; padding-left: 20px; color: white;">Gmail</th>
                                <th class="product-price" style="padding-right: 20px;padding-left: 20px;color: white;">Address</th>
                                <th class="product-image" style="padding-left: 50px; color: white;">Total </th>
                                <th class="product-image" style="padding-left: 50px; color: white;">Date </th>
                                <th class="product-description" style="padding-right: 50px;padding-left: 50px;color: white;">Status</th>
                                <th class="edit" style="padding-left: 20px; padding-right: 20px; color: white;">Edit</th>
                                <th class="delete" style="padding-left: 20px; padding-right: 20px ;color: white;">Delete</th>
                                <th class="delete" style="padding-left: 20px; padding-right: 20px ;color: white;">Details</th>
                            </tr>
                        </thead> 
                        <tbody>
                        <% Vector<Orders> vector = (Vector<Orders>) request.getAttribute("vector");
                            for (Orders pro : vector) {
                        %>
                        <tr class="table-body-row">               
                            <th class="product-id" style=" padding-left: 20px;" name=""><%=pro.getOrderID()%> </th>
                            <th class="supplier-id" style="padding-left: 20px;" name=""><%=pro.getCustomerID()%> </th>
                            <th class="category-id" style="padding-left: 20px;" name=""><%=pro.getCustomerName()%></th>
                            <th class="product-name" style="padding-left: 20px;" name=""><%=pro.getPhone()%></th>
                            <th class="product-year" style="padding-left: 20px;" name=""><%=pro.getGmail()%></th>
                            <th class="pproduct-price" style="padding-left: 20px;" name=""><%=pro.getAddress()%></th>
                            <th class="pproduct-price" style="padding-left: 20px;" name=""><%=pro.getTotal()%></th>
                            <th class="pproduct-price" style="padding-left: 20px;" name=""><%=pro.getDate()%></th>
                            <th class="roduct-price" style="padding-left: 20px;" name="">
                               <select name="status">
                                <option value="1" <%=pro.getStatus() == 1 ? "selected" : ""%>>New</option>
                                <option value="2" <%=pro.getStatus() == 2 ? "selected" : ""%>>Process</option>
                                <option value="3" <%=pro.getStatus() == 3 ? "selected" : ""%>>Done</option>
                            </select>
                            </th>
                            <th class="edit" style="padding-left: 20px; padding-right: 20px;"><a href="ControllerAdmin?do=Bid&id=<%=pro.getOrderID()%>"/>Edit</th>
                            <th class="delete" style="padding-left: 20px; padding-right: 20px;"><a href="ControllerAdmin?do=deleteO&id=<%=pro.getOrderID()%>"/>Delete</th> 
                            <th class="delete" style="padding-left: 20px; padding-right: 20px;"><a href="ControllerAdmin?do=details&id=<%=pro.getOrderID()%>"/>Details</th> 
                        </tr>
                        <%}%>
                    </tbody>
                    <form action="ControllerAdmin" method="get">
                        <input type="hidden" name="do" value="sortByDate">
                    <input type="date" name="date1"> from 
                    <input type="date" name="date2"> to
                    <input type="submit" name="submit">
                    
                    </form>
                </table>
            </div>
        </div>

        <!-- FOOTER Start
        ================================================== -->
        <jsp:include page="footer.jsp"></jsp:include>

</html>

