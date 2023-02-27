
<%@page import="java.sql.ResultSet"%>
<%@page import="entity.OrderDetails"%>
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
                <%ResultSet rs = (ResultSet) request.getAttribute("rs");
                    if (rs.next()) {
                %>
                <table class="table">                                    
                    <tr>
                        <th style="padding-top: 16px;">Order ID</th>
                        <td>
                            <input value="<%=rs.getInt(1)%>" type="text" name="id" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th style="padding-top: 16px;">Customer ID</th>
                        <td>
                            <input value="<%=rs.getInt(2)%>" type="text" name="cid" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th style="padding-top: 16px;">Customer Name</th>
                        <td>
                            <input value="<%=rs.getString(3)%>" type="text" name="cname" >
                        </td>
                    </tr>
                    <tr>
                        <th style="padding-top: 16px;">Phone Number</th>
                        <td>
                            <input value="<%=rs.getInt(4)%>" type="text" name="phone">
                        </td>
                    </tr>
                    <tr>
                        <th style="padding-top: 16px;">Gmail</th>
                        <td>
                            <input value="<%=rs.getString(5)%>" type="text" name="gmail">
                        </td>
                    </tr>
                    <tr>
                        <th style="padding-top: 16px;">Address</th>
                        <td>
                            <input value="<%=rs.getString(6)%>" type="text" name="add">
                        </td>
                    </tr>
                    <tr>
                        <th style="padding-top: 16px;">Total</th>
                        <td>
                            <input value="<%=rs.getFloat(7)%>" type="text" name="total">
                        </td>
                    </tr>
                    <tr>
                        <th style="padding-top: 16px;">Status</th>
                        <td style="padding-top: 12px;"> 
                            <select name="status" style="font-size: 18px;">
                                <option value="1" <%=rs.getInt(8) == 1 ? "selected" : ""%>>New</option>
                                <option value="2" <%=rs.getInt(8) == 2 ? "selected" : ""%>>Process</option>
                                <option value="3" <%=rs.getInt(8) == 3 ? "selected" : ""%>>Done</option>
                            </select>
                        </td>
                    </tr>
                </table>

                </form>
                <%}%>
                <table border="1px" style="margin-left: 80px;" >
                    <thead class="cart-table-head" style="background-color:gray;">
                        <tr class="table-head-row">

                            <th class="product-id" style="padding-right: 20px; padding-left: 20px; color: white;">Order ID</th>
                            <th class="supplier-id" style="padding-right: 20px; padding-left: 20px; color: white;">Product ID</th>
                            <th class="category-id" style="padding-right: 20px; padding-left: 20px; color: white;">UnitPrice </th>
                            <th class="product-name" style="padding-right: 60px; padding-left: 60px; color: white;">Quantity</th>
                            <th class="product-year" style="padding-right: 20px; padding-left: 20px; color: white;">Total</th>
                        </tr>
                    </thead> 
                    <tbody>
                        <% Vector<OrderDetails> vector = (Vector<OrderDetails>) request.getAttribute("vector");
                            for (OrderDetails pro : vector) {
                        %>
                        <tr class="table-body-row">               
                            <th class="product-id" style=" padding-left: 20px;" name=""><%=pro.getOrderID()%> </th>
                            <th class="supplier-id" style="padding-left: 20px;" name=""><%=pro.getProductID()%> </th>
                            <th class="category-id" style="padding-left: 20px;" name=""><%=pro.getUnitPrice()%></th>
                            <th class="product-name" style="padding-left: 20px;" name=""><%=pro.getQuantity()%></th>
                            <th class="product-year" style="padding-left: 20px;" name=""><%=pro.getTotal()%></th>
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