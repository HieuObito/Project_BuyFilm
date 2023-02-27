<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="entity.Categories"%>
<%@page import="java.util.Vector"%>
<%@page import="entity.Products"%>
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
        <% Vector<Products> vector = (Vector<Products>) request.getAttribute("vector");
            Vector<Categories> v1 = (Vector<Categories>) request.getAttribute("v1");
            ResultSet rs = (ResultSet) request.getAttribute("rs");
        %>

        <jsp:include page="header.jsp"></jsp:include>

            <section id="topic-header">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                        <%if (rs.next()) {%>
                        <h1><%=rs.getString(2)%> MOVIES</h1>
                        <p>The latest <%=rs.getString(2)%> Movie genre in 2022, continuously updated with new movies of the <%=rs.getString(2)%> Movie genre, the movies are selected and of high quality.</p>
                        <%}%>
                    </div>
                    <!-- End of /.col-md-4 -->
                    <div class="col-md-8 hidden-xs">
                        <ol class="breadcrumb pull-right">
                            <li><a href="index.html">Home</a></li>
                            <li class="active">Movie Genre</li>
                        </ol>
                    </div>
                    <!-- End of /.col-md-8 -->
                </div>
                <!-- End of /.row -->
            </div>
            <!-- End of /.container -->
        </section>
        <!-- End of /#Topic-header -->
        <!-- PRODUCTS Start
        ================================================== -->

        <section id="shop">
            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                        <div class="products-heading">
                            <h2>PRODUCTS</h2>
                        </div>
                        <!-- End of /.Products-heading -->
                        <div class="product-grid">
                            <ul> 
                                <%for (Products cate : vector) {%>
                                <li>
                                    <div class="products">
                                        <a href="ControllerProducts?do=blog&id=<%=cate.getProductID()%>">
                                            <img src="<%=cate.getImagine()%>" alt="">
                                        </a>
                                        <a href="#">
                                            <h4><%=cate.getProductName()%></h4>
                                        </a>
                                        <p class="price">£<%=cate.getPrice()%></p>
                                        <div>
                                           <c:if test="${sessionScope.account!=null}" >
                                                <a class="view-link shutter " href="ControllerCart?do=showCartcate&id=<%=cate.getProductID()%>">
                                                    <i class="fa fa-plus-circle "></i>Add To Cart</a>
                                                </c:if>
                                                <c:if test="${sessionScope.admin==null && sessionScope.account==null }" >
                                                <a class="view-link shutter " href="mylogin.jsp">
                                                    <i class="fa fa-plus-circle"></i>Add To Cart</a>
                                                </c:if>
                                                <c:if test="${sessionScope.admin!=null }" >
                                                <a class="view-link shutter " href="ControllerAdmin?do=update&id=<%=cate.getProductID()%>">
                                                    <i class="fa fa-plus-circle "></i>Edit</a> </c:if>
                                        </div>
                                    </div>
                                    <!-- End of /.products -->
                                </li>
                                <%}%>
                            </ul>
                        </div>
                        <!-- End of /.products-grid -->

                    </div>
                    <!-- End of /.col-md-9 -->
                    <div class="col-md-3">
                        <div class="blog-sidebar">
                            <div class="block">
                                <h4>Catagories</h4>
                                <div class="list-group">
                                    <a href="ControllerProducts?do=Category&cate=1" class="list-group-item">
                                        <i class="fa  fa-dot-circle-o"></i> Action Movie
                                    </a>
                                    <a href="ControllerProducts?do=Category&cate=2" class="list-group-item">
                                        <i class="fa  fa-dot-circle-o"></i> Romantic movie
                                    </a>
                                    <a href="ControllerProducts?do=Category&cate=3" class="list-group-item">
                                        <i class="fa  fa-dot-circle-o"></i> Comedy Movie
                                    </a>
                                    <a href="ControllerProducts?do=Category&cate=4" class="list-group-item">
                                        <i class="fa  fa-dot-circle-o"></i> Horror Movie
                                    </a>
                                    <a href="ControllerProducts?do=Category&cate=5" class="list-group-item">
                                        <i class="fa  fa-dot-circle-o"></i> Science Fiction Movie
                                    </a>
                                    <a href="ControllerProducts?do=Category&cate=6" class="list-group-item">
                                        <i class="fa  fa-dot-circle-o"></i> Adventure Movie
                                    </a>
                                </div>
                            </div>
                            <div class="block">
                                <img src="images/food-ad.png" alt="">
                            </div>
                           
                        </div>
                        <!-- End of /.col-md-3 -->

                    </div>
                    <!-- End of /.row -->
                </div>
                <!-- End of /.container -->
        </section>
        <!-- End of Section -->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>

</html>

