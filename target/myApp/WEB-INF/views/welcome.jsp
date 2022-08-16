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
            <h2> Добро пожаловать, ${person.name}</h2>
            <a href="${contextPath}/admin">Кнопка для администратора</a>
            <br>
            <h2 class="h2_header">О банке</h2>
            <div class="about">
                <p class="about_text">     Банк Открытие – крупное значимое финансовое учреждение. Основной пакет акций находится у Банка России – 99, 99%. С 2019 года к Банку Открытие добавился Бинбанк, что еще больше усилило позиции организации на рынке. В состав банковской группы также входят и другие крупные значимые компании – «Росгосстрах», НПФ «Открытие», АО «Таможенная карта», «Открытие Брокер» и др.
                    Основные направления деятельности:
                    <ul>
                       <li>инвестиции;</li>
                        <li>услуги для малого и среднего бизнеса;</li>
                        <li>работа с корпоративными клиентами;</li>
                        <li>private banking.</li>
                    </ul>
                </p>
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