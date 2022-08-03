<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: User--%>
<%--  Date: 27/07/2022--%>
<%--  Time: 7:47 CH--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Update Book</h1>--%>
<%--<form action="/bookServlet?action=update" method="post">--%>
<%--    <label><input type="text" name="id" value="${b.getId()}" hidden></label>--%>
<%--    <table>--%>
<%--        <tr>--%>
<%--            <td><label for="name">Name</label></td>--%>
<%--            <td><input type="text" name="name" id="name" value="${b.getNameBook()}"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td><label for="describe">Describe</label></td>--%>
<%--            <td><input type="text" name="describe" id="describe" value="${b.getDescribeBook()}"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td><label for="image">Image</label></td>--%>
<%--            <td><input type="text" name="image" id="image" value="${b.getImage()}"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td><label for="status">Status</label></td>--%>
<%--            <td><select name="status" id="status">--%>
<%--                <option value="${"New"}">Mới</option>--%>
<%--                <option value="${"Old"}">Cũ</option>--%>
<%--            </select>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td><label for="category">Category</label></td>--%>
<%--            <td>--%>
<%--                <select name="category" id="category">--%>
<%--                    <c:forEach items="${categories}" var="c">--%>
<%--                        <option value="${c.getId()}">${c.getNameCategory()}</option>--%>
<%--                    </c:forEach>--%>
<%--                </select>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td><label for="writer">Writer</label></td>--%>
<%--            <td>--%>
<%--                <select name="writer" id="writer">--%>
<%--                    <c:forEach items="${writers}" var="w">--%>
<%--                        <option value="${w.getId()}">${w.getNamePublishing()}</option>--%>
<%--                    </c:forEach>--%>
<%--                </select>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td><label for="location">Location</label></td>--%>
<%--            <td>--%>
<%--                <select name="location" id="location">--%>
<%--                    <c:forEach items="${locations}" var="l">--%>
<%--                        <option value="${l.getId()}">${l.getNameLocation()}</option>--%>
<%--                    </c:forEach>--%>
<%--                </select>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td colspan="2">--%>
<%--                <button type="submit">Update</button>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </table>--%>
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
        <a class="navbar-brand" href="/bookServlet?action="style="font-size: xx-large">Library</a>
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
                    <a class="nav-link" href="#">Hello ${email}</a>
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
         style="background-image: url('https://st.quantrimang.com/photos/image/2020/10/06/Hinh-nen-Genshin-Impact-4.jpg');">    <div class="container">
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
                    <%--          <button style="margin-top: 10px"><a href="/loginServlet">Back</a></button>--%>

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

                <div class="col-12 col-md-6 col-lg-4">
                    <div class="card">
                        <img class="card-img-top" src="${b.image}" alt="Card image cap">
                        <div class="card-body">
                            <h4 class="card-title show_txt"><a href="#" title="View Product">${b.getNameBook()}</a>
                            </h4>
                        </div>
                    </div>
                </div>



                <form action="/bookServlet?action=update" method="post">
                    <label><input type="text" name="id" value="${b.getId()}" hidden></label>
                    <table>
                        <tr>
                            <td colspan="2"><h2>Update Book</h2></td>
                        </tr>
                        <tr>
                            <td><label for="name">Name</label></td>
                            <td><input type="text" name="name" id="name" value="${b.getNameBook()}"></td>
                        </tr>
                        <tr>
                            <td><label for="describe">Describe</label></td>
                            <td><input type="text" name="describe" id="describe" value="${b.getDescribeBook()}"></td>
                        </tr>
                        <tr>
                            <td><label for="image">Image</label></td>
                            <td><input type="text" name="image" id="image" value="${b.getImage()}"></td>
                        </tr>
                        <tr>
                            <td><label for="status">Status</label></td>
                            <td><select name="status" id="status">
                                <option value="${"New"}">Mới</option>
                                <option value="${"Old"}">Cũ</option>
                            </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="category">Category</label></td>
                            <td>
                                <select name="category" id="category">
                                    <c:forEach items="${categories}" var="c">
                                        <option value="${c.getId()}">${c.getNameCategory()}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="writer">Writer</label></td>
                            <td>
                                <select name="writer" id="writer">
                                    <c:forEach items="${writers}" var="w">
                                        <option value="${w.getId()}">${w.getNamePublishing()}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="location">Location</label></td>
                            <td>
                                <select name="location" id="location">
                                    <c:forEach items="${locations}" var="l">
                                        <option value="${l.getId()}">${l.getNameLocation()}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button type="submit" class="btn btn-success">Update</button>

<%--                                <button type="submit">Update</button>--%>
                            </td>
                        </tr>
                    </table></form>
            </div>

        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="/user/footer.jsp"></jsp:include>

</body>
</html>
