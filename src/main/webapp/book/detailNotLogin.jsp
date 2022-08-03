<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 29/07/2022
  Time: 9:41 SA
  To change this template use File | Settings | File Templates.
--%>


<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--  <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>

<%--<h1 >Detail Book</h1>--%>
<%--<table border="1" width="200px">--%>
<%--  <tr>--%>
<%--    <th>Id</th>--%>
<%--    <td>${b.getId()}</td>--%>
<%--  </tr>--%>
<%--  <tr>--%>
<%--    <th>Name</th>--%>
<%--    <td>${b.getNameBook()}</td>--%>
<%--  </tr>--%>
<%--  <tr>--%>
<%--    <th>Describe</th>--%>
<%--    <td>${b.getDescribeBook()}</td>--%>
<%--  </tr>--%>
<%--  <tr>--%>
<%--    <th>Image</th>--%>
<%--    <td style="text-align: center"><img src="${b.getImage()}" width="100px" height="100px"  >  </td>--%>
<%--  </tr>--%>
<%--  <tr>--%>
<%--    <th>Status</th>--%>
<%--    <td>${b.getStatusBook()}</td>--%>
<%--  </tr>--%>
<%--  <tr>--%>
<%--    <th>Category</th>--%>
<%--    <td>${b.getCategory().getNameCategory()}</td>--%>
<%--  </tr>--%>
<%--  <tr>--%>
<%--    <th>PublishingCompany</th>--%>
<%--    <td>${b.getPublishingCompany().getNamePublishing()}</td>--%>
<%--  </tr>--%>
<%--  <tr>--%>
<%--    <th>Location</th>--%>
<%--    <td>${b.getLocation().getNameLocation()}</td>--%>
<%--  </tr>--%>
<%--</table>--%>

<%--<button style="margin-top: 10px"><a href="/loginServlet">Back</a></button>--%>
<%--</body>--%>
<%--</html>--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<!--begin of menu-->
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="/loginServlet?action=" style="font-size: xx-large">Library</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault"
                aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                <%--                        <li class="nav-item">--%>
                <%--                            <a class="nav-link" href="#">Manager Account</a>--%>
                <%--                        </li>--%>
                <li class="nav-item">
                    <a class="nav-link" href="#">Hello Everybody</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/loginServlet?action=login">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/loginServlet?action=sign">Sign Up</a>
                </li>
            </ul>
            <form action="/bookServlet?action=searchBookByName" method="post" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input name="search" type="text" class="form-control" aria-label="Small"
                           aria-describedby="inputGroup-sizing-sm" placeholder="Search by namebook...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                    <p style="color: white">${messager}</p>
                </div>
            </form>
        </div>
    </div>
</nav>
<section class="jumbotron text-center"
         style="background-image: url('https://st.quantrimang.com/photos/image/2020/10/06/Hinh-nen-Genshin-Impact-4.jpg');">
    <div class="container">
        <h1 class="jumbotron-heading">MÊ ĐỌC SÁCH</h1>
        <p class="lead text-muted mb-0">Thư viện sách TTHT miễn phí!</p>
    </div>
</section>
<!--end of menu-->
<div class="container">
    <div class="row">
        <div class="col">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/loginServlet">Home</a></li>
                    <%--          <button style="margin-top: 10px"><a href="/loginServlet">Back</a></button>--%>

                    <li class="breadcrumb-item"><a href="#">Category</a></li>
                    <li class="breadcrumb-item active" aria-current="#">Sub-category</li>
                </ol>
            </nav>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-sm-3">
            <div class="card bg-light mb-3">
                <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories
                </div>
            </div>
            <div class="card bg-light mb-3">
                <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Location
                </div>
            </div>
            <div class="card bg-light mb-3">
                <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Publishing
                    Company
                </div>
            </div>

            <div class="card bg-light mb-3">
                <div class="card-header bg-success text-white text-uppercase">Statistical</div>
            </div>
        </div>

        <div class="col-sm-9">
            <div class="row">

                <div class="col-12 col-md-6 col-lg-4">
                    <div class="card">
                        <img class="card-img-top" src="${b.image}" alt="Card image cap">
                        <div class="card-body">
                            <h4 class="card-title show_txt"><a href="#" title="View Product">${b.getNameBook()}</a>
                            </h4>
                        </div>
                    </div>
                </div>

                <table border="1" width="300px">
                    <tr><td colspan="2"><h3>Thông tin sản phẩm</h3></td>

                    </tr>
                    <tr>
                        <th>Name</th>
                        <td>${b.getNameBook()}</td>
                    </tr>
                    <tr>
                        <th>Describe</th>
                        <td>${b.getDescribeBook()}</td>
                    </tr>
<%--                    <tr>--%>
<%--                        <th>Image</th>--%>
<%--                        <td style="text-align: center"><img src="${b.getImage()}" width="100px" height="100px"></td>--%>
<%--                    </tr>--%>
                    <tr>
                        <th>Status</th>
                        <td>${b.getStatusBook()}</td>
                    </tr>
                    <tr>
                        <th>Category</th>
                        <td>${b.getCategory().getNameCategory()}</td>
                    </tr>
                    <tr>
                        <th>Publishing</th>
                        <td>${b.getPublishingCompany().getNamePublishing()}</td>
                    </tr>
                    <tr>
                        <th>Location</th>
                        <td>${b.getLocation().getNameLocation()}</td>
                    </tr>
                </table>

            </div>

        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="/user/footer.jsp"></jsp:include>

</body>
</html>
