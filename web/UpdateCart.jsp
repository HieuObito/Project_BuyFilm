<%-- 
    Document   : Cart
    Created on : Mar 6, 2022, 9:43:02 PM
    Author     : admin
--%>

<%@page import="java.util.Vector"%>
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


    </head>
    <body>
        <!-- TOP HEADER Start
        ================================================== -->
        <jsp:include page="header.jsp" ></jsp:include>>

            <section id="topic-header">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <h1>YOUR CART</h1>
                            <p>Products</p>
                        </div>
                        <!-- End of /.col-md-4 -->
                        <div class="col-md-8 hidden-xs">
                            <ol class="breadcrumb pull-right">
                                <li><a href="#">Home</a></li>
                                <li class="active">Payment</li>
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

            <!-- cart -->
            <div class="cart-section mt-150 mb-150">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-10 col-md-12">
                            <div class="cart-table-wrap" >
                                <form action="ControllerCart" method="get" >
                                    <input type="hidden" name="do" value="payment">
                                    <table class="cart-table" border="solid" style="margin-bottom: 30px;">
                                        <thead class="cart-table-head" style="background-color:gray;">
                                            <tr class="table-head-row" style="padding-bottom: 20px;">
                                                <th class="product-remove" ></th>
                                                <th class="product-image" style="padding-right: 50px; padding-left: 50px; color: white;">Product Image</th>
                                                <th class="product-name" style="padding-right: 50px;padding-left: 35px;color: white;">Name</th>
                                                <th class="product-price" style="padding-right: 30px;padding-left: 25px;color: white;">Price</th>
                                                <th class="product-quantity" style="padding-right: 50px;padding-left: 50px;color: white;">Quantity</th>
                                            </tr>
                                        </thead> 
                                    <%
                                        Vector<ProductCart> pro1 = (Vector<ProductCart>) request.getAttribute("vector");
                                        for (ProductCart pro : pro1) {
                                    %>
                                    <tbody>
                                        <tr class="table-body-row">
                                    <input type="hidden" name="id" value="<%=pro.getProductID()%>">
                                    <td class="product-remove"><a href="#"><i class="far fa-window-close"></i></a></td>
                                    <th class="product-image" style="padding-right: 60px; "><input type="hidden" name="image" value="<%=pro.getImage()%>"><img src="<%=pro.getImage()%>" alt=""></td>
                                    <th class="product-name" style="padding-right: 60px;padding-left: 20px;"><input type="hidden" name="name" value="<%=pro.getProductName()%>"><%=pro.getProductName()%> </td>
                                    <th class="product-price" style="padding-right: 30px;padding-left: 20px;"><input type="hidden" name="price" value="<%=pro.getUnitPrice()%>">$<%=pro.getUnitPrice()%>  </td>
                                    <td class="product-quantity" style="text-align: center; font-weight: bold;"><input type="hidden" name="quantity" value="<%=pro.getQuantity()%>"><%=pro.getQuantity()%></td>
                                    </tr>

                                    <% }%>
                                    </tr>
                                    </tbody>
                                </table>
                        </div>
                    </div>

                    <div class="col-lg-2">
                        <div class="total-section" style="font-size: 40px; padding-top: 100px;">
                            <table class="total-table">
                                <thead class="total-table-head">
                                    <tr class="table-total-row">
                                        <th>Total</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="total-data">
                                        <td><strong>Total: </strong></td>
                                        <td style="color: red; font-weight: bold">${total}</td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="cart-buttons">

                            </div>
                        </div>

                    </div>
                </div>
                <div>
                    <p style="font-size: 30px; color: red; font-weight: bold;">Customer Information</p>                 
                </div>
                <table class="table">
                    <tr>
                        <th style="padding-top: 7px;" >Name: </th>
                        <td>
                            <textarea required name="namec" rows="1" cols="20" style="width: 300px;height: 50px;" ></textarea>
                        </td>

                    </tr>
                    <tr>
                        <th style="padding-top: 16px;">Phone Number*: </th>
                        <td>
                            <input required  type="number" name="phone" rows="1" cols="20" style="width: 300px;height: 50px;" placeholder="Please input your number!">
                        </td>
                    </tr>
                    <tr>
                        <th style="padding-top: 16px;">Email: </th>
                        <td>
                            <input required type="email" name="email" rows="1" cols="20" style="width: 300px;height: 50px;" placeholder="Please input your email!">
                        </td>
                    </tr>
                    <tr>
                        <th style="padding-top: 16px;">Address: </th>
                        <td>
                            <textarea required name="address" rows="1" cols="20" style="width: 300px;height: 50px;"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <button type="submit" >Payment</button>
                        </td>
                    </tr>

                </table>
                </form>
            </div>
        </div>
        <!-- end cart -->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
  
</html>


