<%-- 
    Document   : home
    Created on : Feb 27, 2022, 9:23:36 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.ProductCart"%>
<%@page import="entity.Products"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Project PRJ301</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

        <!-- Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:400,700' rel='stylesheet' type='text/css'>

        <!-- Css -->
        <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" />
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/owl.theme.css">
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
        <% Vector<Products> vector = (Vector<Products>) request.getAttribute("vector");
            Vector<Products> v2 = (Vector<Products>) request.getAttribute("v2");
            Vector<Products> v3 = (Vector<Products>) request.getAttribute("v3");
        %>

        <!-- TOP HEADER Start
        ================================================== -->
        <jsp:include page="header.jsp"></jsp:include>

        <section id="slider-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div id="slider" class="b">
                            <%for (Products v : v3) {%>
                            <img src="<%=v.getImagine()%>" alt="" />
                            <%}%>
                        </div>
                    </div>
                    <!-- End of /.col-md-12 -->
                </div>
                <!-- End of /.row -->
            </div>
            <!-- End of /.container -->
        </section>
        <!-- End of Section -->



        <!-- FEATURES Start
        ================================================== -->

        <div class="product-section mt-150 mb-150">
            <div class="container">
                <div class="hieu">
                    <h1> <span>Our </span>Products</h1>
                    <p>Sometimes it’s easier to be mad at the people you trust because you know that they’ll always love you no matter what you say.</p>
                    <p style="float: right; padding-bottom: 50px; font-family: 'Yanone Kaffeesatz', sans-serif; font-size: 30px; color: rgb(119, 119, 118); ">-Jack Sparrow-</p>
                </div>
            </div>
        </div>
        <!-- End of section -->



        <!-- CATAGORIE Start
        ================================================== -->

        <section id="catagorie ">
            <div class="container ">
                <div class="row ">
                    <div class="col-md-12 ">
                        <div class="block ">
                            <div class="block-heading ">
                                <h2></h2>
                            </div>
                            <div class="row ">
                                <% for (Products v : v2) {%>
                                <div class="col-sm-6 col-md-4 ">
                                    <div class="thumbnail ">
                                        <a class="catagotie-head " href="ControllerProducts?do=blog&id=<%=v.getProductID()%>">
                                            <img src="<%=v.getImagine()%>" alt="... ">
                                            <h3><%=v.getProductName()%></h3>
                                        </a>
                                        <div class="caption ">
                                            <p><%=v.getDescription().substring(0, 105)%>...</p>
                                            <p>
                                                <a href="ControllerProducts?do=blog&id=<%=v.getProductID()%>" class="btn btn-default btn-transparent " role="button ">
                                                    <span>Check Items</span>
                                                </a>
                                            </p>
                                        </div>
                                        <!-- End of /.caption -->
                                    </div>
                                    <!-- End of /.thumbnail -->
                                </div>
                                <%}%>
                            </div>
                            <!-- End of /.row -->
                        </div>
                        <!-- End of /.block -->
                    </div>
                    <!-- End of /.col-md-12 -->
                </div>
                <!-- End of /.row -->
            </div>
            <!-- End of /.container -->
        </section>
        <!-- End of Section -->




        <!-- PRODUCTS Start
        ================================================== -->

        <section id="products ">
            <div class="container ">
                <div class="row ">
                    <div class="col-md-12 ">
                        <div class="products-heading ">
                            <h2>Best Seller</h2>
                        </div>
                    </div>
                </div>
                <div class="row ">
                    <% for (Products pro : vector) {%>
                    <div class="col-md-3 ">
                        <div class="products ">
                            <a href="ControllerProducts?do=blog&id=<%=pro.getProductID()%>">
                                <img src="<%=pro.getImagine()%>" alt="">
                            </a>
                            <a href="ControllerProducts?do=blog&id=<%=pro.getProductID()%>">
                                <h4><%=pro.getProductName()%></h4>
                            </a>
                            <p class="price ">£<%=pro.getPrice()%></p>
                            <c:if test="${sessionScope.account!=null}" >
                            <a class="view-link shutter " href="ControllerCart?do=showCartindex&id=<%=pro.getProductID()%>">
                                <i class="fa fa-plus-circle "></i>Add To Cart</a>
                            </c:if>
                            <c:if test="${sessionScope.admin==null && sessionScope.account==null }" >
                            <a class="view-link shutter " href="mylogin.jsp">
                                <i class="fa fa-plus-circle "></i>Add To Cart</a> </c:if>
                                 <c:if test="${sessionScope.admin!=null }" >
                                     <a class="view-link shutter " href="ControllerAdmin?do=update&id=<%=pro.getProductID()%>">
                                <i class="fa fa-plus-circle "></i>Edit</a> </c:if>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
        </section>

        <!-- CALL TO ACTION Start
        ================================================== -->

        <section id="call-to-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block">
                            <div class="block-heading1">
                                <h2>Our Partners</h2>
                            </div>
                        </div>
                        <!-- End of /.block -->
                        <div id="owl-example" class="owl-carousel">
                            <img src="images/20century.jpg" alt=" ">
                            <img src="images/wb.jpg" alt=" ">
                            <div> <img src="images/marvel.jpg" alt=" "></div>
                            <div> <img src="images/paramount.jpg" alt=" "></div>
                            <div> <img src="images/pixar.jpg" alt=" "></div>
                            <div> <img src="images/sony.jpg" alt=" "></div>
                            <div> <img src="images/disney.jpg" alt=" "></div>
                            <div> <img src="images/universal.jpg" alt=" "></div>
                        </div>
                        <!-- End of /.Owl-Slider -->
                    </div>
                    <!-- End of /.col-md-12 -->
                </div>
                <!-- End Of /.Row -->
            </div>
            <!-- End Of /.Container -->
        </section>
        
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>