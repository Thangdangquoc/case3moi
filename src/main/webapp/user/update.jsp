<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: User--%>
<%--  Date: 28/07/2022--%>
<%--  Time: 7:47 SA--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<form   method="post">--%>
<%--    <div class="form-outline mb-4">--%>
<%--        <input type="text" id="form0Example0"  value="${u.getId()}" name="id_email"  class="form-control"  readonly/>--%>
<%--        <label class="form-label" for="form2Example2">Id</label>--%>
<%--    </div>--%>
<%--    <div class="form-outline mb-4">--%>
<%--        <input type="email" id="form0Example2"  value="${u.getEmail()}" name="email"  class="form-control"  readonly/>--%>
<%--        <label class="form-label" for="form2Example2">Email</label>--%>
<%--    </div>--%>
<%--        <div class="form-outline mb-4">--%>
<%--            <input type="text" id="form3Example2" value="${u.getName_user()}"  name="name"  class="form-control" />--%>
<%--            <label class="form-label" for="form2Example2">Name</label>--%>
<%--        </div>--%>
<%--        <div class="form-outline mb-4">--%>
<%--            <input type="date" id="form4Example2"  value="${u.getBirth()}" name="date"  class="form-control" />--%>
<%--            <label class="form-label" for="form2Example2">Date of Birth</label>--%>
<%--        </div>--%>

<%--    <div class="form-outline mb-4">--%>
<%--        <input type="password" id="form2Example2" value="${u.getPassword_user()}"  name="pass"  class="form-control" />--%>
<%--        <label class="form-label" for="form2Example2">Password</label>--%>
<%--    </div>--%>

<%--        <div class="form-outline mb-4">--%>
<%--            <input type="text" id="form5Example2" value="${u.getPhoneNumber()}"  name="phone"  class="form-control" />--%>
<%--            <label class="form-label" for="form2Example2">Phone Number</label>--%>
<%--        </div>--%>
<%--        <div class="form-outline mb-4">--%>
<%--            <input type="text" id="form6Example2" value="${u.getImage()}"  name="image"  class="form-control" />--%>
<%--            <label class="form-label" for="form2Example2">Image</label>--%>
<%--        </div>--%>

<%--    <!-- 2 column grid layout for inline styling -->--%>

<%--    <!-- Submit button -->--%>
<%--    <button type="submit" class="btn btn-primary btn-block mb-4">Update</button>--%>

<%--</form>--%>


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
        <a class="navbar-brand" href="home">library</a>
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
                    <a class="nav-link" href="#">Hello Alias</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/loginServlet">Logout</a>
                    <%--    <a href="/loginServlet">Đăng xuất</a>--%>

                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/loginServlet?action=updateUser&id_email=${id_email}">Update
                        information</a>
                    <%--<div>--%>
                    <%--    <a href="/loginServlet?action=updateUser&id_email=${id_email}">Cập nhật thông tin cá nhân</a>--%>
                    <%--</div>--%>

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
                    <p>${messager}</p>
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
                    <li class="breadcrumb-item"><a href="/bookServlet?action=">Home</a></li>


                    <li class="breadcrumb-item"><a href="#">Create new book</a></li>
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
        <%--    --%>

        <div class="col-sm-9">
            <div class="row">
                <form   method="post">
<%--                    <div class="form-outline mb-4">--%>
<%--                        <input type="text" id="form0Example0"  value="${u.getId()}" name="id_email"  class="form-control"  readonly/>--%>
<%--                        <label class="form-label" for="form2Example2">Id</label>--%>
<%--                    </div>--%>
                    <div class="form-outline mb-4">
                        <label class="form-label" for="form2Example2">Email</label>
                        <input type="email" id="form0Example2"  value="${u.getEmail()}" name="email"  class="form-control"  readonly/>

                    </div>
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form2Example2">Name</label><input type="text" id="form3Example2" value="${u.getName_user()}"  name="name"  class="form-control" />

                        </div>
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form2Example2">Date of Birth</label>
                            <input type="date" id="form4Example2"  value="${u.getBirth()}" name="date"  class="form-control" />
                        </div>

                    <div class="form-outline mb-4">
                        <label class="form-label" for="form2Example2">Password</label>
                        <input type="password" id="form2Example2" value="${u.getPassword_user()}"  name="pass"  class="form-control" />
                    </div>

                        <div class="form-outline mb-4">
                            <label class="form-label" for="form2Example2">Phone Number</label>
                            <input type="text" id="form5Example2" value="${u.getPhoneNumber()}"  name="phone"  class="form-control" />

                        </div>
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form2Example2">Image</label>
                            <input type="text" id="form6Example2" value="${u.getImage()}"  name="image"  class="form-control" />

                        </div>

                    <button type="submit" class="btn btn-primary btn-block mb-4">Update</button>

                </form>

        </div>
    </div>

    <!-- Footer -->
        <jsp:include page="/user/footer.jsp"></jsp:include>

</body>
</html>
