<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>

    <meta http-equiv="Content-Type" content="text/html" charset=utf-8" />
    <%--    <meta http-equiv="X-UA-Compatible" content="IE=edge">--%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Открытие | Банк</title>
    <link rel="shortcut icon" href="${contextPath}/resources/img/favicon.png">
    <%--    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">--%>
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <header class="header">
            <div class="brand">
                <a class="logo" href="${contextPath}/welcome">
                    <img src="${contextPath}/resources/img/logo.png" width="25px" height="25px">
                </a>
                <a class="logo-link" href="${contextPath}/welcome">
                    <p>Открытие | Банк</p>
                </a>
            </div>
            <div class="navbar">
                <a class="navbar-text" href="${contextPath}/admin">Клиенты</a>
                <a class="navbar-text" href="#" onclick="document.forms['logoutForm'].submit()">Logout</a>
            </div>
        </header>
        <div class="section">
            <h1 class="h1_header">Страница администратора</h1>
            <h2>Клиенты</h2>
            <table class="table">
                <tr class="table_row">
                    <th class="table-header" colspan="6">Персональные данные</th>
                </tr>
                <tr class="table_row">
                    <th>Имя</th>
                    <th>Фамилия</th>
                    <th>Серия и номер паспорта</th>
                    <th>Адрес</th>
                    <th>Телефон</th>
                    <th>Дата рождения</th>
                </tr>
                <c:forEach var="person" items="${person_info}">
                    <tr class="table_row">
                        <td class="td-admin"><a class="admin-link" href="${contextPath}/clients/${person.id}">${person.name}</a></td>
                        <td class="td-admin"><a class="admin-link" href="${contextPath}/clients/${person.id}">${person.surname}</a></td>
                        <td class="td-admin"><a class="admin-link" href="${contextPath}/clients/${person.id}">${person.pas_ser} ${person.pass_num}</a></td>
                        <td class="td-admin"><a class="admin-link" href="${contextPath}/clients/${person.id}">${person.address}</a></td>
                        <td class="td-admin"><a class="admin-link" href="${contextPath}/clients/${person.id}">${person.phone}</a></td>
                        <td class="td-admin"><a class="admin-link" href="${contextPath}/clients/${person.id}">${person.birthdate}</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <footer class="footer">
            <div class="brand">
                <img class="logo" src="${contextPath}/resources/img/logo.png" width="25px" height="25px">
                <p>Открытие | Банк</p>
            </div>
            <div class="navbar">
                <a class="footer-text">8 800 444 44 00</a>
                <a class="footer-text">7 495 224 44 00</a>
            </div>
        </footer>
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </c:if>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<%--    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>--%>
</body>
</html>