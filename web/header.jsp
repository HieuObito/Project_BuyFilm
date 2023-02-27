<%-- 
    Document   : header
    Created on : Mar 14, 2022, 9:43:31 PM
    Author     : admin
--%>

<%@page import="entity.ProductCart"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>

<style>

            #main{
                background-color: #000;
            }
            #header {
                height: 80px;
                background-color: #333;
                text-align: center; 
                top: 0;
                left: 0;
                right: 0;
                font-size: 14px;
                padding-left: 150px;
                 padding-top: 15px;
            }
            #nav-header {
                display: inline-block;
            }
            #nav-header > li {
                display: inline-block;
            }
            #nav-header li:hover a {
                color: gold;
                background-color: #000;
            }
            #nav-header li a {
                text-decoration: none;
                line-height: 50px;
                padding: 0 20px;
                display: block;
            }
            #nav-header > li > a {
                color: #fff;
                text-transform: uppercase;
            }
        </style>

<section id="top">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <p class="contact-action">Hoàng Trọng Hiếu - HE151404  <strong>+84 9046xxxx</strong></p>
                <c:if test="${sessionScope.account!=null || sessionScope.admin!=null}">
                    <p style="text-align: center; margin-left: 250px" >  Welcome ${sessionScope.account.getCustomerName()} ${sessionScope.admin.getName()}</p>
                </c:if>
                <c:if test="${sessionScope.admin!=null}">
                    <div id="main">
                        <div id="header">
                            <ul id="nav-header">
                                <li><a href="ControllerAdmin?do=users">Users Manager</a></li>
                                <li><a href="ControllerAdmin?do=Orders">Bills Manager</a></li>
                                <li><a href="ControllerAdmin?do=all">Products Manager</a></li>
                            </ul>
                        </div>
                    </div>
                </c:if>
            </div>
            <div class="col-md-3 clearfix">
                <ul class="login-cart">
                    <c:if test="${sessionScope.account==null && sessionScope.admin==null}">
                        <li>
                            <a href="mylogin.jsp">
                                Login
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.account!=null || sessionScope.admin!=null}">
                        <li>
                            <a href="ControllerAccount?do=logout">
                                Logout
                            </a>
                        </li>
                    </c:if>
                    <li>
                        <%  Integer count = 0;
                            ProductCart pros = null;
                            java.util.Enumeration em = session.getAttributeNames();
                            while (em.hasMoreElements()) {
                                String key = em.nextElement().toString();
                                if (key != "account") {
                                    count++;
                                }
                            }
                        %>
                        <div class="cart dropdown">
                                <a href="Cart.jsp">
                                   </i>Cart(<%=count%>)</a>
                              
                        <c:if test="${sessionScope.admin!=null}" >
                                <a href="ControllerAdmin?do=all">
                                    <i class="fa fa-shopping-cart"></i>Manager</a>
                                </c:if>
                            <c:if test="${sessionScope.account!=null}" >
                                <a href="ControllerCart?do=yourbill&id=${sessionScope.account.getCustomerID()} ">
                                    <i class="fa fa-shopping-cart"></i>History</a>
                                </c:if>
                            <c:if test="${sessionScope.account==null || sessionScope.account!=null }" >
                                <a href="Register.jsp">
                                    <i class="fa fa-shopping-cart"></i>Register</a>
                                </c:if>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="col-md-2">
                <div class="search-box">
                    <div class="input-group">
                        <form action="ControllerProducts" method="post">
                            <table> 
                                <tr>
                                <input type="hidden" name="do" value="Search">
                                <td><input placeholder="Search Here" type="text" name="name" class="form-control"></td>
                                <td><button class="class" type="submit" value="search"></td>
                                </tr>
                                </div>
                            </table>
                        </form>
                    </div>
                    <!-- /.input-group -->
                </div>
                <!-- /.search-box -->
            </div>
        </div>
        <!-- End Of /.row -->
    </div>
    <!-- End Of /.Container -->


    <!-- MODAL Start
    ================================================== -->

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Introduce Yourself</h4>
                </div>
                <div class="modal-body clearfix">

                    <form action="#" method="post" id="create-account_form" class="std">
                        <fieldset>
                            <h3>Create your account</h3>
                            <div class="form_content clearfix">
                                <h4>Enter your e-mail address to create an account.</h4>
                                <p class="text">
                                    <label for="email_create">E-mail address</label>
                                    <span>
                                        <input placeholder="E-mail address"  type="text" id="email_create" name="email_create" value="" class="account_input">
                                    </span>
                                </p>
                                <p class="submit">
                                    <button class="btn btn-primary">Create Your Account</button>
                                </p>
                            </div>
                        </fieldset>
                    </form>
                    <form action="ControllerAccount" method="get" id="login_form" class="std">
                        <fieldset>
                            <h3>Already registered?</h3>
                            <div class="form_content clearfix">
                                <p class="text">
                                    <label for="email">E-mail address</label>
                                    <span><input placeholder="User" type="text" id="email" name="user" value="" class="account_input"></span>
                                </p>
                                <p class="text">
                                    <label for="passwd">Password</label>
                                    <span><input placeholder="Password" type="password" id="passwd" name="pass" value="" class="account_input"></span>
                                </p>
                                <p class="lost_password">
                                    <a href="#popab-password-reset" class="popab-password-link">Forgot your password?</a>
                                </p>
                                <p class="submit">
                                    <button class="btn btn-success">Log in</button>
                                </p>
                            </div>
                        </fieldset>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End of /Section -->



<!-- LOGO Start
================================================== -->

<header>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <a href="#">
                    <img src="images/logo.jpg" alt="logo">
                </a>
            </div>
            <!-- End of /.col-md-12 -->
        </div>
        <!-- End of /.row -->
    </div>
    <!-- End of /.container -->
</header>
<!-- End of /Header -->




<!-- MENU Start
================================================== -->

<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <!-- End of /.navbar-header -->

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav nav-main">
                <li><a href="ControllerProducts">HOME</a></li>
                <li><a href="ControllerProducts?do=ALL&page=1">SHOP</a></li>
                <li class="dropdown">
                    <a href="#">
                        MOVIE GENRE
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="ControllerProducts?do=Category&cate=1">Action</a></li>
                        <li><a href="ControllerProducts?do=Category&cate=2">Romantic</a></li>
                        <li><a href="ControllerProducts?do=Category&cate=3">Comedy</a></li>
                        <li><a href="ControllerProducts?do=Category&cate=4">Horror</a></li>
                        <li><a href="ControllerProducts?do=Category&cate=5">Science Fiction</a></li>
                        <li><a href="ControllerProducts?do=Category&cate=6">Adventure</a></li>
                    </ul>
                </li>
                <!-- End of /.dropdown -->
            </ul>
            <!-- End of /.nav-main -->
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
