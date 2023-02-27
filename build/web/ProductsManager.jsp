<%-- 
    Document   : Cart
    Created on : Mar 6, 2022, 9:43:02 PM
    Author     : admin
--%>

<%@page import="java.util.Vector"%>
<%@page import="entity.Products"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.ProductCart"%>
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
                            <h1 style="color: orangered">Products Manager</h1>
                            <!--                        <p>Products</p>-->
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
                <div style="padding-left: 150px; padding-bottom: 100px;">
                    <div style="padding: 50px 50px 50px 0px;">
                        <a href="InsertProducts.jsp">
                            <button style="font-size: 20px; font-weight: bold">Create new product</button>
                        </a>
                    </div>

                    <table border="1px" >
                        <thead class="cart-table-head" style="background-color:gray;">
                            <tr class="table-head-row">

                                <th class="product-id" style="padding-right: 20px; padding-left: 20px; color: white;">Product ID</th>
                                <th class="supplier-id" style="padding-right: 20px; padding-left: 20px; color: white;">Supplier ID</th>
                                <th class="category-id" style="padding-right: 20px; padding-left: 20px; color: white;">Category ID</th>
                                <th class="product-name" style="padding-right: 60px; padding-left: 60px; color: white;">Product Name</th>
                                <th class="product-year" style="padding-right: 20px; padding-left: 20px; color: white;">Year</th>
                                <th class="product-price" style="padding-right: 20px;padding-left: 20px;color: white;">Price</th>
                                <th class="product-image" style="padding-left: 50px; color: white;">Product Image</th>
                                <th class="product-description" style="padding-right: 50px;padding-left: 50px;color: white;">Description</th>
                                <th class="edit" style="padding-left: 20px; padding-right: 20px; color: white;">Edit</th>
                                <th class="delete" style="padding-left: 20px; padding-right: 20px ;color: white;">Delete</th>
                            </tr>
                        </thead> 
                        <tbody>
                        <% Vector<Products> vector = (Vector<Products>) request.getAttribute("vector");
                            for (Products pro : vector) {

                        %>
                        <tr class="table-body-row">               
                            <th class="product-id" style=" padding-left: 20px;" name=""><%=pro.getProductID()%> </th>
                            <th class="supplier-id" style="padding-left: 20px;" name=""><%=pro.getSupplierID()%> </th>
                            <th class="category-id" style="padding-left: 20px;" name=""><%=pro.getCategoryID()%></th>
                            <th class="product-name" style="padding-left: 20px;" name=""><%=pro.getProductName()%></th>
                            <th class="product-year" style="padding-left: 20px;" name=""><%=pro.getYear()%></th>
                            <th class="pproduct-price" style="padding-left: 20px;" name=""><%=pro.getPrice()%></th>
                            <th class="product-image"><img src="<%=pro.getImagine()%>" alt="" name=""></th>
                            <th class="product-description" style="padding-left: 20px;" name=""><%=pro.getDescription().substring(0, 15)%>... </th>
                            <th class="edit" style="padding-left: 20px; padding-right: 20px;"><a href="ControllerAdmin?do=update&id=<%=pro.getProductID()%>"/>Edit</th>
                            <th class="delete" style="padding-left: 20px; padding-right: 20px;"><a href="ControllerAdmin?do=deleteP&id=<%=pro.getProductID()%>"/>Delete</th> 
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- FOOTER Start
        ================================================== -->
        <jsp:include page="footer.jsp"></jsp:include>

</html>

