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

<h1 >Save Travels</h1>

<table class="table">
  <thead>
    <tr>
    
      <th scope="col">Expense</th>
      <th scope="col">Vendor</th>
      <th scope="col">Amount</th>
      <th scope="col">Actions</th>
    </tr>
  </thead>
  <tbody>
    
   <c:forEach items="${expenses}" var="expense">
	<tr>
      <td><c:out value="${expense.getExpenseName()}"/></td>
      <td><c:out value="${expense.getVendor()}"/></td>
      <td>$<c:out value="${expense.getAmount()}"/></td>
      <td> 
      <a href="/expenses/edit/${expense.getId()}">edit</a> <br/>
      <a href="/expenses/display/${expense.getId()}" >display</a> <br/>
      <form action="/expenses/delete/${expense.getId()}"  method="post">
	    <input type="hidden" name="_method" value="delete">
	    <input class="btn btn-danger" type="submit" value="Delete">
	 </form>
      </td>

    </tr>
   </c:forEach>
  </tbody>
</table>


</div>


<h1 class="m-5 p-5">Add an expense</h1>
<div class="d-flex justify-content-center m-5 p-5">

<form:form class="w-50" action="/expenses/add" method="post" modelAttribute="expense">
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

</body>
</html>