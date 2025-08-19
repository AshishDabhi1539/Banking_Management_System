<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loan Status - FinCoreX</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
  <h3 class="mb-3">Apply for a Loan</h3>
  <c:if test="${param.applied == '1'}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">Loan application submitted.
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
  </c:if>
  <form class="row g-2" method="post" action="${pageContext.request.contextPath}/loan/apply">
    <div class="col-md-2"><input class="form-control" name="customerId" placeholder="Customer ID" required pattern="^[0-9]+$" title="Numbers only"></div>
    <div class="col-md-2">
      <select class="form-select" name="loanType">
        <option value="PERSONAL">PERSONAL</option>
        <option value="HOME">HOME</option>
        <option value="CAR">CAR</option>
        <option value="EDUCATION">EDUCATION</option>
      </select>
    </div>
    <div class="col-md-2"><input class="form-control" type="number" step="0.01" min="0.01" name="amount" placeholder="Amount" required></div>
    <div class="col-md-2"><input class="form-control" type="number" step="0.01" min="0.01" name="interestRate" placeholder="Interest %" required></div>
    <div class="col-md-2"><input class="form-control" type="number" min="1" step="1" name="tenureMonths" placeholder="Months" required></div>
    <div class="col-md-2"><button class="btn btn-primary w-100" type="submit">Apply</button></div>
  </form>
  <a class="btn btn-outline-secondary mt-3" href="${pageContext.request.contextPath}/customer/dashboard">Back</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>