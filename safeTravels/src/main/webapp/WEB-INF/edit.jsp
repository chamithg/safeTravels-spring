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
<body class="d-flex justify-content-center">
<div class="m-5 p-5 w-75">
<h1>Edit Expense</h1>
<form:form action="/expenses/update/${expense.id}" method="post" modelAttribute="expense">
    <input type="hidden" name="_method" value="put">
   <p>
        <form:label path="expenseName">Expense name</form:label>
        <br>
        <form:errors path="expenseName" class="text-danger"/>
        <br>
        <form:input path="expenseName" class="form-control"/>
    </p>
    
    <p>
        <form:label path="vendor">Vendor</form:label>
        <br>
        <form:errors path="vendor" class="text-danger"/>
        <br>
        <form:input path="vendor" class="form-control"/>
    </p>
    <p>
        <form:label path="amount">Amount ($)</form:label>
        <br>
        <form:errors path="amount" class="text-danger"/>    
        <br> 
        <form:input type="number" path="amount" class="form-control"/>
    </p>  
    <p>
        <form:label path="description">Description</form:label>
        <br>
        <form:errors path="description" class="text-danger"/>
        <br>
        <form:textarea path="description" class="form-control"/>
    </p>  
    <input type="submit" class="btn btn-primary" value="Submit"/>
</form:form>
</div>
<a href="/expenses"> Go Back!</a>

</body>
</html>