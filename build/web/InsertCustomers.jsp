<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.ProductCart"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Hoang Trong Hieu</title>
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
            th {
                padding-right: 30px;
                padding-left: 10px;
                font-family: 'Yanone Kaffeesatz', sans-serif;
                font-size: 25px;
            }

            input {
                padding-right: 30px;
                padding-left: 10px;
                width: 500px;
                height: 50px;
            }
            .table button {
                background-color: red;
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
                        <div class="col-md-4">
                            <h1 style="color: orangered;">Create Movie</h1>
                            <p></p>
                        </div>
                        <!-- End of /.col-md-4 -->
                        <div class="col-md-8 hidden-xs">
                            <ol class="breadcrumb pull-right">
                                <li><a href="#">Home</a></li>
                                <li class="active">Edit</li>
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
                        <div> 
                            <div class="cart-table-wrap">
                                <form action="ControllerAdmin" method="get" style="padding-bottom: 100px; padding-top: 50px;">
                                    <input type="hidden" name="do" value="InsertC">
                                    <table class="table" >                                    
                                        <tr>
                                            <th style="padding-top: 16px;">Customer Name</th>
                                            <td>
                                                <input required value="" type="text" name="cname">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th style="padding-top: 16px;">Country</th>
                                            <td>
                                                <input value="" type="text" name="country">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th style="padding-top: 16px;">Gmail</th>
                                            <td>
                                                <input value="" type="text" name="gmail">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th style="padding-top: 16px;">User</th>
                                            <td>
                                                <input value="" type="text" name="user">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th style="padding-top: 16px;">password</th>
                                            <td>
                                                <input value="" type="password" name="pass">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-left: 450px; padding-top: 20px;">
                                                <button type="submit" >Create</button>
                                            </td>
                                        </tr>
                                    </table>

                                </form>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
            <!-- end cart -->


            <!-- FOOTER Start
            ================================================== -->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>

</html>


