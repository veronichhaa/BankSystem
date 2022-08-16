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
      <form action="${contextPath}/clients/${person.id}" method="post" modelAttribute="personalForm">
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
          <tr class="table_row">
            <td><input class="personal_input" type="text" name="name" value="${person.name}"></td>
            <td><input class="personal_input" type="text" name="surname" value="${person.surname}"></td>
            <td><input class="personal_input" type="text" name="pas_ser" value="${person.pas_ser}"><input class="personal_input" type="text" name="pass_num" value="${person.pass_num}"></td>
            <td><input class="personal_input" type="text" name="address" value="${person.address}"></td>
            <td><input class="personal_input" type="text" name="phone" value="${person.phone}"></td>
            <td><input class="personal_input" type="text" name="birthdate" value="${person.birthdate}"></td>
          </tr>
          <tr class="table_row">
            <th class="table-header" colspan="6">Cчет</th>
          </tr>
          <tr class="table_row">
            <th colspan="2">Номер</th>
            <th colspan="2">Остаток</th>
            <th colspan="2">Лимит</th>
          </tr>
          <tr class="table_row">
            <td colspan="2"><input class="personal_input" type="text" name="number" value="${account.number}"></td>
            <td colspan="2"><input class="personal_input" type="text" name="sum" value="${account.sum}"></td>
            <td colspan="2"><input class="personal_input" type="text" name="lim" value="${account.lim}"></td>
          </tr>
          <tr>
            <th class="table-header" colspan="6">Карты</th>
          </tr>
          <tr class="table_row">
            <th colspan="2">Номер</th>
            <th colspan="2">Остаток</th>
            <th colspan="2">Действительна до</th>
          </tr>
          <tr class="table_row">
            <td colspan="2"><input class="personal_input" type="text" name="number" value="${card.number}"></td>
            <td colspan="2"><input class="personal_input" type="text" name="sum" value="${card.sum}"></td>
            <td colspan="2"><input class="personal_input" type="text" name="valid" value="${card.valid}"></td>
          </tr>
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
              <td><input class="personal_input" type="text" name="start" value="${var.start}"></td>
              <td><input class="personal_input" type="text" name="term" value="${var.term}"></td>
              <td><input class="personal_input" type="text" name="sum" value="${var.sum}"></td>
              <td><input class="personal_input" type="text" name="percent" value="${var.percent}"></td>
              <td colspan="2"><input class="personal_input" type="text" name="payments" value="${var.payments}"></td>
            </tr>
          </c:forEach>
          <tr class="table_row">
            <th class="table-header" colspan="6">Депозиты</th>
          </tr>
          <tr class="table_row">
            <th>Депозит от</th>
            <th>Срок</th>
            <th>Сумма</th>
            <th>Процент</th>
            <th colspan="2">Прибыль</th>
          </tr>
          <c:forEach var="var" items="${deposit}">
            <tr class="table_row">
              <td><input class="personal_input" type="text" name="start" value="${var.start}"></td>
              <td><input class="personal_input" type="text" name="term" value="${var.term}"></td>
              <td><input class="personal_input" type="text" name="sum" value="${var.sum}"></td>
              <td><input class="personal_input" type="text" name="percent" value="${var.percent}"></td>
              <td colspan="2"><input class="personal_input" type="text" name="profit" value="${var.profit}"></td>
            </tr>
          </c:forEach>
        </table>
        <button class="button_save">Сохранить</button>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      </form>
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
    <form id="editForm" method="POST" action="${contextPath}/clients/${person.id}">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
  </c:if>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<%--    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>--%>
</body>
</html>