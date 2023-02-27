<%-- 
    Document   : updateadmin
    Created on : Mar 16, 2022, 2:35:19 AM
    Author     : admin
--%>

<%@page import="java.sql.ResultSet"%>
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
        </style>

    </head>

    <body>


        <!-- TOP HEADER Start
        ================================================== -->
        <jsp:include page="header.jsp"></jsp:include>

            <section id="topic-header">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <h1>Update Movie</h1>
                            <p></p>
                        </div>
                        <!-- End of /.col-md-4 -->
                        <div class="col-md-8 hidden-xs">
                            <ol class="breadcrumb pull-right">
                                <li><a href="#">Home</a></li>
                                <li class="active">Update</li>
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
                            <%ResultSet rs = (ResultSet) request.getAttribute("rs");
                                if (rs.next()) {
                            %>
                            <form action="ControllerAdmin" method="get" style="padding-bottom: 100px; padding-top: 50px;">
                                <input type="hidden" name="do" value="updateO">
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
                                    <tr>
                                        <td></td>
                                        <td style="padding-left: 400px;">
                                            <button type="submit" onclick="showMess()">Update</button>
                                        </td>
                                    </tr>
                                </table>

                            </form>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end cart -->
        <script>
            function showMess() {
                window.alert("Update successfully!!");
            }
        </script>
        <!-- FOOTER Start
        ================================================== -->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>

</html>


