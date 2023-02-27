<%-- 
    Document   : blog
    Created on : Mar 3, 2022, 12:58:56 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <%Vector<Products> vector = (Vector<Products>) request.getAttribute("vector"); %>

        <jsp:include page="header.jsp"></jsp:include>
            <!-- Breadcrumbs Start
            ================================================== -->

            <section id="topic-header">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <h1>Movie information</h1>
                            <p>HOT MOVIE !!!</p>
                        </div>
                        <!-- End of /.col-md-4 -->
                        <div class="col-md-8 hidden-xs">
                            <ol class="breadcrumb pull-right">
                                <li><a href="ControllerProducts">Home</a></li>
                                <li><a href="ControllerProducts?do=ALL&page=1">Blog</a></li>
                                <li class="active">Single Post</li>
                            </ol>
                        </div>
                        <!-- End of /.col-md-8 -->
                    </div>
                    <!-- End of /.row -->
                </div>
                <!-- End of /.container -->
            </section>
            <!-- End of /#Topic-header -->






            <section id="blog">
                <div class="container">
                    <div class="row">
                        <div class="col-md-9 clearfix">
                            <ul class="blog-zone">
                            <%for (Products pro : vector) {%>
                            <li>
                                <div class="blog-icon">
                                    <i class="fa  fa-pencil"></i>
                                </div>
                                <div class="blog-box">
                                    <img src="<%=pro.getImagine()%>" alt="">
                                    <div class="blog-post-body clearfix">
                                        <h2><%=pro.getProductName()%></h2>
                                        <div class="blog-post-tag">
                                            <div class="block">
                                                <i class="fa fa-clock-o"></i>
                                                <p><%=pro.getYear()%></p>
                                            </div>
                                            <div class="block">
                                                <i class="fa fa-user"></i>
                                                <p>£<%=pro.getPrice()%></p>
                                            </div>
                                            <div class="block">
                                                <i class="fa fa-tags"></i>
                                                <p>
                                                    <a>Movie Culture</a>,
                                                    <a>Green Items</a>
                                                </p>
                                            </div>
                                        </div>
                                        <p><%=pro.getDescription()%></p>
                                    </div>
                                </div>
                            </li>
                            <%}%>
                        </ul>
                        <!-- End of /.blog-zone -->

                        <div class="block">
                            <h4>Tag Cloud</h4>
                            <div class="tag-link">
                                <a href="">BALLET</a>
                                <a href="">BLOG</a>
                                <a href="">CHRISTMAS</a>
                                <a href="">ELEGANCE</a>
                                <a href="">ELEGANT</a>
                                <a href="">SHOPPING</a>
                                <a href="">SHOP</a>
                                <a href="">PHOTOGRAPHY</a>
                            </div>
                        </div>
                        <!-- End of /.block -->

                    </div>
                    <!-- End of /.Sidebar -->
                </div>
                <!-- End of /.col-md-3 -->
            </div>
            <!-- End of /.row -->
        </div>
        <!-- End of /.container -->
    </section>
    <!-- End of /.Section -->
    <jsp:include page="footer.jsp"></jsp:include>
</body>

</html>