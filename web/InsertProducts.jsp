<%-- 
    Document   : create
    Created on : Mar 16, 2022, 5:03:53 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.ProductCart"%>
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
            th {
                padding-right: 50px;
                padding-left: 10px;
                font-family: 'Yanone Kaffeesatz', sans-serif;
                font-size: 25px;
            }

            input {
                padding-right: 50px;
                padding-left: 10px;
                width: 1000px;
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
                            <h1>Create Movie</h1>
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
                        <div> <!--class="col-lg-12 col-md-12"-->
                            <div class="cart-table-wrap">
                                <form action="ControllerAdmin" method="get" style="padding-bottom: 100px; padding-top: 50px;">
                                    <input type="hidden" name="do" value="insert">
                                    <table class="table">                                    
                                        <tr>
                                            <th style="padding-top: 16px;">ProductName</th>
                                            <td>
                                                <input required value="" type="text" name="name">
                                            </td>
                                        </tr>
                                        <tr>
                                               <th style="padding-top: 16px;">ProductName</th>
                                            <td>
                                                <select name="cid" id="CategoryID" style="font-size: 20px;font-weight: bold; ">
                                                    <option value="1">Action</option>    
                                                    <option value="2">Romantic</option>
                                                    <option value="3">Comedy</option>
                                                    <option value="4">Horror</option>
                                                    <option value="5">Fantasy</option>
                                                    <option value="6">Adventure</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th style="padding-top: 16px;">Year</th>
                                            <td>
                                                <input value="" type="text" name="year">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th style="padding-top: 16px;">Price</th>
                                            <td>
                                                <input value="" type="text" name="price">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th style="padding-top: 16px;">Image</th>
                                            <td>
                                                <input value="" type="text" name="imagine">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th style="padding-top: 16px;">Description</th>
                                            <td>
                                                <textarea name="description" rows="5" cols="20" style="width: 1000px;">
                                                </textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th style="padding-top: 16px;">Quantity</th>
                                            <td>
                                                <input value="" type="text" name="quantity">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th style="padding-top: 16px;">Discontinued</th>
                                            <td>
                                                <input required value="" type="text" name="discontinued">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
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


