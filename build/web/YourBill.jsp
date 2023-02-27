
<%@page import="entity.YourBill"%>
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
                            <h1 style="color: orangered">Your Order</h1>
                        </div>
                        <!-- End of /.col-md-4 -->
                    </div>
                    <!-- End of /.row -->
                </div>
                <!-- End of /.container -->
            </section>
            <!-- End of /#Topic-header -->

            <!--================================================== -->
            <div class="hd">
                <div style="padding-left: 400px; padding-bottom:100px;">
                    <table border="1px" >
                        <thead class="cart-table-head" style="background-color:gray;">
                            <tr class="table-head-row">
                                <th class="product-id" style="padding-right: 20px; padding-left: 20px; color: white;">Product</th>
                                <th class="supplier-id" style="padding-right: 20px; padding-left: 20px; color: white;">Quantity</th>
                                <th class="category-id" style="padding-right: 20px; padding-left: 20px; color: white;">Unit Price</th>
                                <th class="product-name" style="padding-right: 60px; padding-left: 60px; color: white;">Total</th>
                                <th class="product-year" style="padding-right: 20px; padding-left: 20px; color: white;">Status</th>
                            </tr>
                        </thead> 
                        <tbody>
                        <% Vector<YourBill> vector = (Vector<YourBill>) request.getAttribute("vector");
                            for (YourBill pro : vector) {
                        %>
                        <tr class="table-body-row">               
                            <th class="supplier-id" style="padding-left: 20px;" name=""><img src="<%=pro.getImagine()%>" alt="" style="max-width: 200px"></td>
                            <th class="supplier-id" style="padding-left: 20px;" name=""><%=pro.getQuantity() %> </th>
                            <th class="category-id" style="padding-left: 20px;" name=""><%=pro.getPrice() %></th>
                            <th class="product-name" style="padding-left: 20px;" name=""><%=pro.getTotal() %></th>
                            <th class="product-year" style="padding-left: 20px;" name=""><%=pro.getStatus() %></th>
                        </tr>
                        <%}%>
                    </tbody>
                    <p><a href="ControllerAdmin?do=sortByDate">sort </a></p>;
                </table>
            </div>
        </div>

        <!-- FOOTER Start
        ================================================== -->
        <jsp:include page="footer.jsp"></jsp:include>

</html>

