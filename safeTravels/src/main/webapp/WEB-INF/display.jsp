<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
<div class="m-5 p-5">

<h1 class="mb-5">Expense Details</h1>

<h3>Expense Name: <c:out value="${expense.getExpenseName()}"/></h3>
<h3>Expense Description: <c:out value="${expense.getDescription()}"/></h3>
<h3>Vendor: <c:out value="${expense.getVendor()}"/></h3>
<h3>Amount Spent: $<c:out value="${expense.getAmount()}"/> </h3>

<a href="/expenses"> Go Back!</a>

</div>
</body>
</html>