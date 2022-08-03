<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 27/07/2022
  Time: 11:35 CH
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h3>Đăng kí</h3>--%>
<%--<form   method="post"  >--%>
<%--    --%>
<%--    <div class="form-outline mb-4">--%>
<%--        <input type="email" id="form2Example1" name="email" class="form-control" />--%>
<%--        <label class="form-label"   for="form2Example1">Email address</label>--%>
<%--    </div>--%>

<%--    <!-- Password input -->--%>
<%--    <div class="form-outline mb-4">--%>
<%--        <input type="password" id="form2Example2"   name="pass"  class="form-control" />--%>
<%--        <label class="form-label" for="form2Example2">Password</label>--%>
<%--    </div>--%>
<%--    <div class="row mb-4">--%>
<%--        <div class="col d-flex justify-content-center">--%>
<%--            <!-- Checkbox -->--%>
<%--            <div class="form-check">--%>
<%--                <input class="form-check-input" type="checkbox" value="" id="form2Example31" checked />--%>
<%--                <label class="form-check-label" for="form2Example31"> Remember me </label>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--    </div>--%>
<%--    <button type="submit" class="btn btn-primary btn-block mb-4">Sign in</button>--%>

<%--</form>--%>
<%--<br>--%>
<%--<p name="message" var="message" style="color: firebrick">${message}</p>--%>

<%--</body>--%>
<%--</html>--%>


<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <!--Made with love by Mutiullah Samim -->

    <!--Bootsrap 4 CDN-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!--Fontawesome CDN-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    <!--Custom styles-->
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<form  method="post">
    <%--    <!-- Email input -->--%>
    <%--    <div class="form-outline mb-4">--%>
    <%--        <input type="email" id="form2Example1" name="email" class="form-control" />--%>
    <%--        <label class="form-label" for="form2Example1">Email address</label>--%>
    <%--    </div>--%>

    <%--    <!-- Password input -->--%>
    <%--    <div class="form-outline mb-4">--%>
    <%--        <input type="password" id="form2Example2"   name="pass"  class="form-control" />--%>
    <%--        <label class="form-label" for="form2Example2">Password</label>--%>
    <%--    </div>--%>

    <div class="container">
        <div class="d-flex justify-content-center h-100">
            <div class="card">
                <div class="card-header">
                    <h3>Sign Up</h3>
                    <div class="d-flex justify-content-end social_icon">
                        <span><i class="fab fa-facebook-square"></i></span>
                        <span><i class="fab fa-google-plus-square"></i></span>
                        <span><i class="fab fa-twitter-square"></i></span>
                    </div>
                </div>
                <div class="card-body">
                    <form>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input type="email" id="form2Example1" name="email" class="form-control" placeholder="username">

                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input type="password" id="form2Example2"   name="pass"  class="form-control" placeholder="password">
                        </div>
                        <div class="row align-items-center remember">
                            <input type="checkbox">Remember Me
                        </div>
                        <div class="form-group">
                            <%--                            <input type="submit" value="Login" class="btn float-right login_btn">--%>
                            <%--                            <button type="submit" class="btn btn-primary btn-block mb-4">Login </button>--%>
                            <button type="submit" class="btn float-right login_btn">Sign Up</button>
                        </div>
                        <p name="message" var="message" style="color: white" >${message}</p>
                    </form>
                </div>
                <div class="card-footer">
                    <div class="d-flex justify-content-center links">
                        Don't have an account?<a href="/loginServlet?action=sign">Sign Up</a>
                    </div>
                    <div class="d-flex justify-content-center">
                        <a href="#">Forgot your password?</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<br/>
<a href="loginServlet">Hello Servlet</a>
</body>

</html>