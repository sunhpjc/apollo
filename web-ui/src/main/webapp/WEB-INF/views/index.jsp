<%--
  Created by IntelliJ IDEA.
  User: sunhuapeng
  Date: 2020/3/3
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>图片测试</title>
</head>
<body>
<div>
    <c:forEach items="${PPT}" var="ppt">
        <img src="${ppt.pic}">
    </c:forEach>
</div>
</body>
</html>
