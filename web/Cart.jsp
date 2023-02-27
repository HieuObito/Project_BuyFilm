<%-- 
    Document   : Cart
    Created on : Mar 6, 2022, 9:43:02 PM
    Author     : admin
--%>

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
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Breadcrumbs Start
            ================================================== -->

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
                                <li class="active">Blog</li>
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
                        <div class="col-lg-9 col-md-12">
                            <div class="cart-table-wrap" style="padding-bottom: 10px; padding-top: 10px;" >
                                <form action="ControllerCart" method=post">
                                    <input type="hidden" name="do" value="update" >
                                    <table class="cart-table" border="solid">
                                        <thead class="cart-table-head" style="background-color:gray;">
                                            <tr class="table-head-row" style="padding-bottom: 20px;">
                                                <th class="product-remove" ></th>
                                                <th class="product-image" style="padding-right: 50px; padding-left: 50px; color: white;">Product Image</th>
                                                <th class="product-name" style="padding-right: 50px;padding-left: 35px;color: white;">Name</th>
                                                <th class="product-price" style="padding-right: 30px;padding-left: 25px;color: white;">Price</th>
                                                <th class="product-quantity" style="padding-right: 50px;padding-left: 50px;color: white;">Quantity</th>
                                                <th class="product-total" style="margin-left: 20px;color: white;">Delete</th> 
                                                <th class="product-total" style="margin-left: 20px;color: white;">Delete All</th> 
                                            </tr>
                                        </thead> 
                                    <%
                                        double total = 0;
                                        java.util.Enumeration em = session.getAttributeNames();
                                        while (em.hasMoreElements()) {
                                            String key = em.nextElement().toString();
                                            if (key != "account") {
                                                ProductCart pro = (ProductCart) session.getAttribute(key);
                                                total += pro.getQuantity() * pro.getUnitPrice();
                                    %>
                                    <tbody>
                                        <tr class="table-body-row">
                                            <td class="product-remove"><a href="#"><i class="far fa-window-close"></i></a></td>
                                    <input type="hidden" name="id" value="<%=pro.getProductID()%>">
                                    <th class="product-image" style="padding-right: 60px; "><input type="hidden" name="image" value="<%=pro.getImage()%>"><img src="<%=pro.getImage()%>" alt=""></td>
                                    <th class="product-name" style="padding-right: 60px;padding-left: 20px;"><input type="hidden" name="name" value="<%=pro.getProductName()%>"><%=pro.getProductName()%> </td>
                                    <th class="product-price" style="padding-right: 30px;padding-left: 20px;"><input type="hidden" name="price" value="<%=pro.getUnitPrice()%>"> $<%=pro.getUnitPrice()%>  </td>
                                    <td class="product-quantity"><input min="1" max="30" type="number" name="quantity" value="<%=pro.getQuantity()%>" placeholder="<%=pro.getQuantity()%>"></td>
                                    <th class="product-total" style="margin-left: 20px;"><a href="ControllerCart?do=delete&id=<%=pro.getProductID()%>">Delete</th> 
                                    <th class="product-total" style="margin-left: 20px;"><a href="ControllerCart?do=deleteAll">Delete All</th> 
                                    </tr>
                                    <%}
                                        }%>

                                    </tr>
                                    </tbody>
                                </table>
                                        <%if(total!=0){ %>
                                <button type="submit" >
                                    Update Cart
                                </button>
                                <%}%>
                            </form>
                        </div>
                    </div>

                    <div class="col-lg-3" style="padding-top: 90px;padding-left: 85px;">
                        <div class="total-section">
                            <table class="total-table">
                                <thead class="total-table-head">
                                    <tr class="table-total-row" style="font-size:30px; ">
                                        <th>Total</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="total-data" style="font-size:30px; font-weight: bold;" >
                                        <td><strong>Total: </strong></td>
                                        <td style=" color: orangered; padding-left:15px;"><%=total%></td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="cart-buttons">
                                <a href="ControllerCart?do=checkout" class="boxed-btn black" style="font-weight: bold;padding-left:15px;" >Check Out</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end cart -->
    <jsp:include page="footer.jsp"></jsp:include>
</body>

</html>
