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
                <a class="navbar-text" href="${contextPath}/personalRoom">Личный кабинет</a>
                <a class="navbar-text" href="${contextPath}/credit">Кредиты</a>
                <a class="navbar-text" href="${contextPath}/deposit">Депозиты</a>
                <a class="navbar-text" href="${contextPath}/welcome">О банке</a>
                <a class="navbar-text" href="#" onclick="document.forms['logoutForm'].submit()">Logout</a>
            </div>
        </header>
        <div class="section">
            <div class="form">
                <form class="form_body" method="post" action="${contextPath}/credit" modelAttribute="creditForm">
                    <h2 class="form_header">Оформить кредит</h2>
                    <div class="form-text"> Процентная ставка: 9.5%</div>
                    <input class="input" type="text" name="sum" placeholder="Введите сумму">
                    <br>
                    <input class="input" type="text" name="term" placeholder="Введите срок">
                    <br>
                    <button class="button" type="submit">Оформить кредит</button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
                <table class="table">
                    <tr class="table_row">
                        <th class="table-header" colspan="6">Кредиты</th>
                    </tr>
                    <tr class="table_row">
                        <th>Кредит от</th>
                        <th>Срок</th>
                        <th>Сумма</th>
                        <th>Процент</th>
                        <th colspan="2">Платежи</th>
                    </tr>
                    <c:forEach var="var" items="${credit}">
                        <tr class="table_row">
                            <td>${var.start}</td>
                            <td>${var.term}</td>
                            <td>${var.sum}</td>
                            <td>${var.percent}</td>
                            <td colspan="2">${var.payments}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
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