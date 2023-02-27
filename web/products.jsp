<%-- 
    Document   : products
    Created on : Mar 3, 2022, 12:56:03 AM
    Author     : admin
--%>

<%@page import="entity.Page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Vector"%>
<%@page import="entity.Products"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <%Vector<Products> vector = (Vector<Products>) request.getAttribute("vector");
            Vector<Page> v2 = (Vector<Page>) request.getAttribute("vec");
        %>
        <jsp:include page="header.jsp"></jsp:include>

            <section id="topic-header">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <h1>Shop</h1>
                            <p>A Bunch Of Products</p>
                        </div>
                        <!-- End of /.col-md-4 -->
                        <div class="col-md-8 hidden-xs">
                            <ol class="breadcrumb pull-right">
                                <li><a href="index.jsp">Home</a></li>
                                <li class="active">Shop</li>
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
                                <h2>ALL PRODUCTS</h2>
                            </div>
                            <!-- End of /.Products-heading -->
                            <div class="product-grid">
                                <ul>
                                <%for (Page v : v2) {%>
                                <li>
                                    <div class="products">
                                        <a href="ControllerProducts?do=blog&id=<%=v.getProductID()%>">
                                            <img src="<%=v.getImagine()%>" alt="">
                                        </a>
                                        <a href="ControllerProducts?do=blog&id=<%=v.getProductID()%>">
                                            <h4><%=v.getProductName()%></h4>
                                        </a>
                                        <p class="price"><%=v.getPrice()%></p>
                                        <div>
                                            <c:if test="${sessionScope.account!=null}" >
                                                <a class="view-link shutter " href="ControllerCart?do=showCart&id=<%=v.getProductID()%>">
                                                    <i class="fa fa-plus-circle "></i>Add To Cart</a>
                                                </c:if>
                                                <c:if test="${sessionScope.admin==null && sessionScope.account==null }" >
                                                <a class="view-link shutter " href="mylogin.jsp">
                                                    <i class="fa fa-plus-circle"></i>Add To Cart</a>
                                                </c:if>
                                                <c:if test="${sessionScope.admin!=null }" >
                                                <a class="view-link shutter " href="ControllerAdmin?do=update&id=<%=v.getProductID()%>">
                                                    <i class="fa fa-plus-circle "></i>Edit</a> </c:if>
                                            </div>
                                        </div>
                                        <!-- End of /.products -->
                                    </li>
                                <%}%>
                            </ul>
                        </div>


                       <div class="pagination-bottom">
                            <ul class="pagination">
                                <c:forEach begin="1" end="${n}" var="c" >
                                    <li><a href="ControllerProducts?do=ALL&page=${c}">${c}</a></li>
                                    </c:forEach>
                            </ul>
                            <!-- End of /.pagination -->
                        </div>
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
                                <h4>Sort by:</h4>
                                <form action="ControllerProducts" method="get">
                                    <input type="hidden" name="do" value="SortBetween"  >
                                    <input type="hidden" name="page" value="1">
                                    <table>
                                        <tr>
                                            <td>From</td><td><input type="number" name="price1" min="0" max="500" value=""/></td>
                                        </tr>
                                        <tr>
                                            <td>To</td><td><input type="number" name="price2" min="0" max="500" value=""/></td>
                                        </tr>
                                        <tr>
                                            <td></td><td><input type="submit" value="Find"/></td>
                                        </tr>
                                    </table>
                                </form>
                                <div class="list-group">
                                    <a href="ControllerProducts?do=sortName&page=1" class="list-group-item"> Name </a>
                                    <a href="ControllerProducts?do=sortPrice&page=1" class="list-group-item"> Price </a>
                                    <a href="ControllerProducts?do=sortYear&page=1" class="list-group-item"> Year </a>
                                </div>
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