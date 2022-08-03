<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 29/07/2022
  Time: 1:09 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1" width="800px">
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Describe</th>
        <th>Image</th>
        <th>Status</th>
        <th>Category</th>
        <th>Writer</th>
        <th>Location</th>
    </tr>
    <c:forEach items="${books}" var="b">
        <tr>
            <td >${b.getId()}</td>
            <td >${b.getNameBook()}</td>
            <td >${b.getDescribeBook()}</td>
            <td style="text-align: center"><img src="${b.getImage()}" alt="" width="100px" height="100px" > </td>
            <td >${b.getStatusBook()}</td>
            <td >${b.getCategory().getNameCategory()}</td>
            <td >${b.getPublishingCompany().getNamePublishing()}</td>
            <td >${b.getLocation().getNameLocation()}</td>
        </tr>
    </c:forEach>
</table>
<a href="/loginServlet">Back</a>
</body>
</html>
